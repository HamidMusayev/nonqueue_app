import 'package:flutter/material.dart';
import 'package:nonqueue_app/screens/otp/ui.dart';
import 'package:nonqueue_app/screens/pswreset/ui.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/route_transitions/slide_route.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: Paddings.p16,
          constraints: const BoxConstraints(maxWidth: 450),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.pink,
                ),
              ),
              const Text(
                'Don’t worry! It happens.Please enter the email address/'
                'mobile phone number associated with your account ',
                style: TextStyle(color: Colors.blueGrey),
              ),
              Spaces.vertical50,
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Email address/Phone number',
                ),
              ),
              Spaces.vertical50,
              Visibility(
                replacement: const Center(child: CircularProgressIndicator()),
                child: TextButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        SlideRightRoute(page: const OTPScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
