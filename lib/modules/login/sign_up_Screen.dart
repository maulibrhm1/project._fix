// ignore_for_file: prefer_const_constructors

part of 'auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _errorEmail = '';
  String _errorPassword = '';
  String _errorFName = '';
  String _errorLName = '';
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Background(
          child: RemoveFocuse(
            onClick: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _appBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        _signupHeader(context),
                        CommonTextFieldView(
                          controller: _fnameController,
                          errorText: _errorFName,
                          padding: const EdgeInsets.only(
                              bottom: 16, left: 24, right: 24),
                          titleText: AppLocalizations(context).of("first_name"),
                          hintText:
                              AppLocalizations(context).of("enter_first_name"),
                          keyboardType: TextInputType.name,
                          onChanged: (String txt) {},
                        ),
                        CommonTextFieldView(
                          controller: _lnameController,
                          errorText: _errorLName,
                          padding: const EdgeInsets.only(
                              bottom: 16, left: 24, right: 24),
                          titleText: AppLocalizations(context).of("last_name"),
                          hintText:
                              AppLocalizations(context).of("enter_last_name"),
                          keyboardType: TextInputType.name,
                          onChanged: (String txt) {},
                        ),
                        CommonTextFieldView(
                          controller: _emailController,
                          errorText: _errorEmail,
                          titleText: AppLocalizations(context).of("your_mail"),
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, bottom: 16),
                          hintText:
                              AppLocalizations(context).of("enter_your_email"),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (String txt) {},
                        ),
                        CommonTextFieldView(
                          titleText: AppLocalizations(context).of("password"),
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, bottom: 24),
                          hintText:
                              AppLocalizations(context).of('enter_password'),
                          isObscureText: true,
                          onChanged: (String txt) {},
                          errorText: _errorPassword,
                          controller: _passwordController,
                        ),
                        CommonButton(
                          padding:
                              EdgeInsets.only(left: 24, right: 24, bottom: 8),
                          buttonText: AppLocalizations(context).of("sign_up"),
                          textColor: Colors.black,
                          onTap: () {
                            if (_allValidation())
                              NavigationServices(context).gotoTabScreen();
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            AppLocalizations(context).of("terms_agreed"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).disabledColor,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              AppLocalizations(context)
                                  .of("already_have_account"),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).disabledColor,
                              ),
                            ),
                            InkWell(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              onTap: () {
                                NavigationServices(context).gotoLoginScreen();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  AppLocalizations(context).of("login"),
                                  style: TextStyles(context)
                                      .getRegularStyle()
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.primaryColor,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).padding.bottom + 24,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _appBar() {
    return CommonAppbarView(
      iconData: Icons.arrow_back,
      onBackClick: () {
        Navigator.pop(context);
      },
    );
  }

  _signupHeader(BuildContext context) {
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

    if (_lnameController.text.trim().isEmpty) {
      _errorLName = AppLocalizations(context).of('last_name_cannot_empty');
      isValid = false;
    } else {
      _errorLName = '';
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
