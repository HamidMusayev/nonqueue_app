import 'package:flutter/material.dart';
import 'package:nonqueue_app/screens/login/ui.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/route_transitions/slide_route.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: Paddings.p16,
        constraints: const BoxConstraints(maxWidth: 450),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
                color: Colors.pink,
              ),
            ),
            Spaces.vertical50,
            const TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autofocus: true,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'New password',
                prefixIcon: Icon(Icons.lock_rounded),
              ),
            ),
            Spaces.vertical10,
            const TextField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm new password',
                prefixIcon: Icon(Icons.lock_rounded),
              ),
            ),
            Spaces.vertical50,
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                Navigator.pushReplacement(context, SlideRightRoute(page: LoginScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
