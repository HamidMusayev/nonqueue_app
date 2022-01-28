import 'package:flutter/material.dart';
import 'package:nonqueue_app/screens/otp/ui.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/phone_input/phone_input_field.dart';
import 'package:nonqueue_app/widgets/route_transitions/slide_route.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: Paddings.p16,
            constraints: const BoxConstraints(maxWidth: 450),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: ColorPalette.qlessApp,
                  ),
                ),
                const Text(
                  'You are going to sign up to Non-Queue',
                  style: TextStyle(color: ColorPalette.greyInputText),
                ),
                Spaces.vertical50,
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    prefixIcon: Icon(Icons.alternate_email_rounded),
                  ),
                ),
                Spaces.vertical10,
                const TextField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: Icon(Icons.person_rounded),
                  ),
                ),
                Spaces.vertical10,
                const IntlPhoneField(
                  searchText: 'Search..',
                  invalidNumberMessage: 'Wrong number!',
                  initialCountryCode: 'AZ',
                  textInputAction: TextInputAction.next,
                  dropDownIcon: Icon(Icons.arrow_drop_down_rounded),
                ),
                Spaces.vertical10,
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: _isObsecure,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () =>
                          setState(() => _isObsecure = !_isObsecure),
                      icon: _isObsecure
                          ? const Icon(Icons.visibility_off_rounded)
                          : const Icon(Icons.visibility_rounded),
                    ),
                    prefixIcon: const Icon(Icons.vpn_key_rounded),
                  ),
                ),
                Spaces.vertical20,
                const Text(
                    "By signing up, you’re agree to our Terms & Conditions and Private Policy"),
                Spaces.vertical50,
                TextButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, SlideRightRoute(page: OTPScreen()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
