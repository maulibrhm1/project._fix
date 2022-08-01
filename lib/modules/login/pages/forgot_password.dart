part of "auth.dart";

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String _errorEmail = '';
  final authC = Get.find<AuthController>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: RemoveFocuse(
          onClick: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Appbar(),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, bottom: 16.0, left: 24, right: 24),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  AppLocalizations(context)
                                      .of("resend_email_link"),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).disabledColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CommonTextFieldView(
                          controller: _emailController,
                          titleText: AppLocalizations(context).of("your_mail"),
                          errorText: _errorEmail,
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, bottom: 24),
                          hintText:
                              AppLocalizations(context).of("enter_your_email"),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (String txt) {},
                        ),
                        CommonButton(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, bottom: 16),
                          buttonText: AppLocalizations(context).of("send"),
                          onTap: () {
                            if (_allValidation()) {
                              showDialog(
                                  context: context,
                                  builder: (context) => const Center(
                                        child: CircularProgressIndicator(),
                                      ));
                              authC
                                  .forgetPassword(_emailController.text.trim());
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _allValidation() {
    bool isValid = true;
    if (_emailController.text.trim().isEmpty) {
      _errorEmail = AppLocalizations(context).of('email_cannot_empty');
      isValid = false;
    } else if (!Validator.validateEmail(_emailController.text.trim())) {
      _errorEmail = AppLocalizations(context).of('enter_valid_email');
      isValid = false;
    } else {
      _errorEmail = '';
    }
    setState(() {});
    return isValid;
  }
}
