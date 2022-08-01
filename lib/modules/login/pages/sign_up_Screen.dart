// ignore_for_file: prefer_const_constructors

part of 'auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _errorEmail = '';
  String _errorPassword = '';
  String _errorFName = '';
  String _errorUName = '';
  bool _obscrueText = true;
  final authC = Get.find<AuthController>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _unameController = TextEditingController();

  bool isChecked = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: RemoveFocuse(
          onClick: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Appbar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _signupHeader(),
                      _signupTextField(),
                      _signupFooter()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _signupFooter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14),
      width: MediaQuery.of(context).size.width * 0.96,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  activeColor: AppTheme.primaryColor,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  }),
              Container(
                padding: EdgeInsets.only(right: 24),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  AppLocalizations(context).of("terms_agreed"),
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
              ),
            ],
          ),
          CommonButton(
            padding: EdgeInsets.only(left: 24, right: 24, bottom: 8),
            buttonText: AppLocalizations(context).of("sign_up"),
            textColor: Colors.black,
            onTap: () {
              if (_allValidation()) {
                showDialog(
                    context: context,
                    builder: (context) => Center(
                          child: CircularProgressIndicator(),
                        ));
                authC.signUp(
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                    _fnameController.text.trim(),
                    _unameController.text.trim(),
                    _emailController.text.trim(),
                    _passwordController.text.trim());
              }
            },
          ),
          ChangePage(
              label: AppLocalizations(context).of("already_have_account"),
              changePage: " Login",
              onTap: () => Get.to(LoginScreen())),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + 24,
          ),
        ],
      ),
    );
  }

  _signupTextField() {
    return Column(
      children: [
        CommonTextFieldView(
          controller: _fnameController,
          errorText: _errorFName,
          padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
          titleText: "Full Name",
          hintText: "enter your full name",
          keyboardType: TextInputType.name,
          onChanged: (String txt) {},
        ),
        CommonTextFieldView(
          controller: _unameController,
          errorText: _errorUName,
          padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
          titleText: "Username",
          hintText: "enter your username",
          keyboardType: TextInputType.name,
          onChanged: (String txt) {},
        ),
        CommonTextFieldView(
          controller: _emailController,
          errorText: _errorEmail,
          titleText: "Email",
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
          hintText: "enter your email",
          keyboardType: TextInputType.emailAddress,
          onChanged: (String txt) {},
        ),
        CommonTextFieldView(
          widget: GestureDetector(
            onTap: () {
              setState(() {
                _obscrueText = !_obscrueText;
              });
            },
            child: Icon(
                _obscrueText ? Icons.visibility_outlined : Icons.visibility),
          ),
          padding: const EdgeInsets.only(left: 24, right: 24),
          titleText: AppLocalizations(context).of("password"),
          hintText: AppLocalizations(context).of("enter_password"),
          isObscureText: _obscrueText,
          onChanged: (String txt) {},
          errorText: _errorPassword,
          controller: _passwordController,
        ),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }

  _signupHeader() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  shadowColor: Colors.black12.withOpacity(
                    Theme.of(context).brightness == Brightness.dark ? 2 : 1,
                  ),
                  child: Image.asset('assets/images/LogoMJ.png'),
                ),
              ),
            ),
            Text(
              'Sign Up',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ));
  }

  _allValidation() {
    bool isValid = true;

    if (_fnameController.text.trim().isEmpty) {
      _errorFName = AppLocalizations(context).of('first_name_cannot_empty');
      isValid = false;
    } else {
      _errorFName = '';
    }

    if (_unameController.text.trim().isEmpty) {
      _errorUName = AppLocalizations(context).of('last_name_cannot_empty');
      isValid = false;
    } else {
      _errorUName = '';
    }

    if (_emailController.text.trim().isEmpty) {
      _errorEmail = AppLocalizations(context).of('email_cannot_empty');
      isValid = false;
    } else if (!Validator.validateEmail(_emailController.text.trim())) {
      _errorEmail = AppLocalizations(context).of('enter_valid_email');
      isValid = false;
    } else {
      _errorEmail = '';
    }

    if (_passwordController.text.trim().isEmpty) {
      _errorPassword = AppLocalizations(context).of('password_cannot_empty');
      isValid = false;
    } else if (_passwordController.text.trim().length < 6) {
      _errorPassword = AppLocalizations(context).of('valid_password');
      isValid = false;
    } else {
      _errorPassword = '';
    }
    setState(() {});
    return isValid;
  }
}
