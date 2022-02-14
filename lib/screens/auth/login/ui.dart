import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/api/concrete/dio_service.dart';
import 'package:nonqueue_app/api/concrete/user_service.dart';
import 'package:nonqueue_app/api/result/result.dart';
import 'package:nonqueue_app/screens/auth/pswforgot/ui.dart';
import 'package:nonqueue_app/screens/auth/register/ui.dart';
import 'package:nonqueue_app/screens/inapp/ui.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/utils/shared.dart';
import 'package:nonqueue_app/utils/validators.dart';
import 'package:nonqueue_app/widgets/route_transitions/slide_route.dart';

import '../../../models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObsecure = true;
  bool _loading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTxt = TextEditingController();
  final TextEditingController _passTxt = TextEditingController();
  final UserService _service = UserService(DIOService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: Paddings.p16,
            constraints: const BoxConstraints(maxWidth: 450),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Welcome back!',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: ColorPalette.qlessApp,
                    ),
                  ),
                  const Text(
                    'Enter your email and password to login',
                    style: TextStyle(color: ColorPalette.greyInputText),
                  ),
                  Spaces.vertical50,
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    controller: _emailTxt,
                    validator: (value) => ValidatorHelper.validateEmail(value),
                    decoration: const InputDecoration(
                      hintText: 'Email address',
                      prefixIcon: Icon(Icons.alternate_email_rounded),
                    ),
                  ),
                  Spaces.vertical10,
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: _isObsecure,
                    controller: _passTxt,
                    validator: (value) =>
                        ValidatorHelper.validatePassword(value),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock_rounded),
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => _isObsecure = !_isObsecure),
                        icon: _isObsecure
                            ? const Icon(Icons.visibility_off_rounded)
                            : const Icon(Icons.visibility_rounded),
                      ),
                    ),
                  ),
                  Spaces.vertical10,
                  GestureDetector(
                    onTap: () => Get.to(const ForgotPasswordScreen()),
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: ColorPalette.qlessApp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  Spaces.vertical50,
                  Visibility(
                    visible: !_loading,
                    replacement:
                        const Center(child: CircularProgressIndicator()),
                    child: TextButton(
                      child: const Text('Login'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          login();
                        }
                      },
                    ),
                  ),
                  Spaces.vertical20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account?  ',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(const RegisterScreen()),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: ColorPalette.qlessApp,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spaces.vertical50,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    setState(() => _loading = true);
    Result<User> result =
        await _service.login(User(email: _emailTxt.text, sifre: _passTxt.text));
    if (result.success) {
      User _user = result.data!;
      _user.sifre = 'null';
      SharedHelper.saveJson('user', _user.toJson());

      Navigator.pushReplacement(
          context, SlideRightRoute(page: const InAppScreen()));
    } else {
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            runSpacing: 10,
            children: [
              const Icon(Icons.cancel_rounded, color: Colors.white),
              Text(result.message),
            ],
          ),
        ),
      );
    }
  }
}
