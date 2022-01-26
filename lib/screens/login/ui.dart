import 'package:flutter/material.dart';
import 'package:nonqueue_app/api/concrete/dio_service.dart';
import 'package:nonqueue_app/api/concrete/user_service.dart';
import 'package:nonqueue_app/api/result/result.dart';
import 'package:nonqueue_app/models/user.dart';
import 'package:nonqueue_app/screens/home/ui.dart';
import 'package:nonqueue_app/screens/login/forgot_password.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/utils/shared.dart';
import 'package:nonqueue_app/utils/validators.dart';
import 'package:nonqueue_app/widgets/route_transitions/slide_route.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _saveMe = false;
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
                  Text(
                    'Daxil ol',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: 30),
                  ),
                  const Text(
                    'Hesabınıza daxil olmaq üçün xanaları doldurun',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  Spaces.vertical50,
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    controller: _emailTxt,
                    validator: (value) => ValidatorHelper.validateEmail(value),
                    decoration: const InputDecoration(
                      hintText: 'E-mail',
                      prefixIcon: Icon(Icons.email_rounded),
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
                      hintText: 'Şifrə',
                      prefixIcon: const Icon(Icons.vpn_key_rounded),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _saveMe,
                            onChanged: (value) =>
                                setState(() => _saveMe = value ?? false),
                          ),
                          const Text('Yadda saxla')
                        ],
                      ),
                      const ForgotPassword(),
                    ],
                  ),
                  Spaces.vertical50,
                  Visibility(
                    visible: !_loading,
                    replacement:
                        const Center(child: CircularProgressIndicator()),
                    child: TextButton.icon(
                      label: const Text('Daxil ol'),
                      icon: const Icon(Icons.navigate_next_rounded),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          login();
                        }
                      },
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

  void login() async {
    setState(() => _loading = true);
    Result<User> result = await _service
        .login(User(email: _emailTxt.text, sifre: _passTxt.text));
    if (result.success) {
      User _user = result.data!;
      _user.sifre = 'null';

      SharedHelper.setBool('saveMe', _saveMe);
      SharedHelper.saveJson('user', _user.toJson());

      Navigator.pushReplacement(
          context, SlideRightRoute(page: HomeScreen(user: _user)));
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
