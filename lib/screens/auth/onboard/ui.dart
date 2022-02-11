import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nonqueue_app/screens/auth/login/ui.dart';
import 'package:nonqueue_app/screens/auth/register/ui.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/route_transitions/slide_route.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/130592059/original/3ea72cb2f595b9068597d282e9a5c92755a2cf94/a-hand-holding-iphone-samsung-with-your-app.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            _buildShadowGradient(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: Paddings.p24,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      child: const Text("Sign Up"),
                      onPressed: () {
                        Navigator.push(context,
                            SlideRightRoute(page: const RegisterScreen()));
                      },
                    ),
                    Spaces.vertical10,
                    TextButton.icon(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white, primary: Colors.black),
                      label: const Text("Continue With Google"),
                      icon: SvgPicture.asset(
                        "assets/splash/google.svg",
                        width: 30,
                      ),
                      onPressed: () {
                        signInWithGoogle();
                      },
                    ),
                    // Spaces.vertical10,
                    // TextButton.icon(
                    //   onPressed: () {},
                    //   style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    //   label: const Text("Continue With Facebook"),
                    //   icon: SvgPicture.asset(
                    //     "assets/splash/facebook.svg",
                    //     width: 30,
                    //   ),
                    // ),
                    const Divider(color: Colors.white, height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          child: const Text(
                            "LOG IN",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushReplacement(
                                context, SlideRightRoute(page: LoginScreen()));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShadowGradient() {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black87,
          ],
        ),
      ),
      child: SizedBox.expand(),
    );
  }

  Future<void> signInWithGoogle() async {
    final _googleSignIn = GoogleSignIn();

    GoogleSignInAccount? _signInAccount = await _googleSignIn.signIn();
    print(_signInAccount.toString());
  }
}
