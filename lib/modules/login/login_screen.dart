// ignore_for_file: prefer_const_constructors

part of 'auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _errorEmail = '';
  TextEditingController _emailController = TextEditingController();
  String _errorPassword = '';
  TextEditingController _passwordController = TextEditingController();

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
              _appBar(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _loginHeader(context),
                      _loginTextField(context),
                      _forgetPassword(),
                      _registerAccount()
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

  CommonAppbarView _appBar(BuildContext context) {
    return CommonAppbarView(
      iconData: Icons.arrow_back,
      onBackClick: () {
        Navigator.pop(context);
      },
    );
  }

  _loginHeader(BuildContext context) {
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
              'Login',
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

  _loginTextField(BuildContext context) {
    return Column(
      children: [
        CommonTextFieldView(
          controller: _emailController,
          errorText: _errorEmail,
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
          titleText: AppLocalizations(context).of("your_mail"),
          hintText: AppLocalizations(context).of("enter_your_email"),
          keyboardType: TextInputType.emailAddress,
          onChanged: (String txt) {},
        ),
        CommonTextFieldView(
          padding: const EdgeInsets.only(left: 24, right: 24),
          titleText: AppLocalizations(context).of("password"),
          hintText: AppLocalizations(context).of("enter_password"),
          isObscureText: true,
          onChanged: (String txt) {},
          errorText: _errorPassword,
          controller: _passwordController,
        ),
        SizedBox(
          height: 30,
        ),
        CommonButton(
          padding: EdgeInsets.only(left: 24, right: 24, bottom: 16),
          buttonText: AppLocalizations(context).of("login"),
          onTap: () {
            if (_allValidation()) NavigationServices(context).gotoTabScreen();
          },
          textColor: Colors.black,
        ),
      ],
    );
  }

  _forgetPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                AppLocalizations(context).of("forgot_your_Password"),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).disabledColor,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                onTap: () {
                  NavigationServices(context).gotoForgotPassword();
                },
                child: Text(
                  ' Reset here',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _registerAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                AppLocalizations(context).of("goto_signup"),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).disabledColor,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                onTap: () {
                  NavigationServices(context).gotoSignupScreen();
                },
                child: Text(
                  ' Sign Up here',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool _allValidation() {
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
