part of 'auth.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final authC = Get.find<AuthController>();
  bool isEmailVerified = false;
  bool canResendEmail = false;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
          const Duration(seconds: 3), (_) => checkEmailVerified());

      if (isEmailVerified) timer?.cancel();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isEmailVerified
        ? const BottomTabScreen(registered: false)
        : _verifyEmailPage(context, size);
  }

  _verifyEmailPage(BuildContext context, Size size) {
    return Scaffold(
        body: Background(
      child: RemoveFocuse(
        onClick: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _verifyEmailBody(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  _verifyEmailBody() {
    return Padding(
        padding: const EdgeInsets.only(top: 104.0, bottom: 42.0),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  child: Image.asset(
                    'assets/images/LogoMJ.png',
                    width: 150,
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20, bottom: 32),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  'A Verification Email has been sent to your email.',
                  style: TextStyles(context)
                      .getRegularStyle()
                      .copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                )),
            Text(
              "Didn't get the email?",
              style: TextStyles(context).getBoldStyle().copyWith(fontSize: 18),
            ),
            const SizedBox(height: 14),
            CommonButton(
              isClickable: canResendEmail,
              onTap: () {
                canResendEmail ? sendVerificationEmail() : null;
              },
              buttonTextWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.email),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Resent Email")
                  ]),
            ),
            const SizedBox(height: 14),
            TextButton(
                onPressed: () {
                  authC.signout();
                },
                child: const Text(
                  "cancel",
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ));
  }
}
