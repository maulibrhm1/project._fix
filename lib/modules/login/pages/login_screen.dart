// ignore_for_file: prefer_const_constructors

part of 'auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authC = Get.find<AuthController>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorEmail = '';
  String _errorPassword = '';
  bool _obscrueText = true;

  Timer? timer;

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
                child: Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        _loginHeader(),
                        _loginTextField(),
                        _changePage()
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _loginHeader() {
    return Padding(
        padding: const EdgeInsets.only(top: 24.0, bottom: 42.0),
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
          ],
        ));
  }

  _loginTextField() {
    return Form(
      key: formKey,
      child: Column(
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
            height: 30,
          ),
          CommonButton(
            padding: EdgeInsets.only(left: 24, right: 24, bottom: 16),
            buttonText: AppLocalizations(context).of("login"),
            onTap: () {
              if (_allValidation()) {
                showDialog(
                    context: context,
                    builder: (context) => Center(
                          child: CircularProgressIndicator(),
                        ));

                authC.signIn(_emailController.text.trim(),
                    _passwordController.text.trim());
              }
            },
            textColor: Colors.black,
          ),
          SizedBox(
            height: 18,
          )
        ],
      ),
    );
  }

  _changePage() {
    return Column(
      children: [
        ChangePage(
            label: AppLocalizations(context).of("forgot_your_Password"),
            changePage: " Reset Here",
            onTap: () => Get.to(ForgotPasswordScreen())),
        ChangePage(
            label: AppLocalizations(context).of("goto_signup"),
            changePage: " Sign Up Here",
            onTap: () => Get.to(SignUpScreen())),
      ],
    );
  }

  _allValidation() {
    bool isValid = formKey.currentState!.validate();
    setState(() {
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
    });
    return isValid;
  }
}
