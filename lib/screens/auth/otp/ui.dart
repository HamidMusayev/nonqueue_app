import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:nonqueue_app/screens/auth/pswreset/ui.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/route_transitions/slide_route.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final List<FocusNode> _nodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  final List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  final List<String> _inputs = ["7", "8", "9", "4", "5", "6", "1", "2", "3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          const Text(
            "Enter OTP",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w500,
              color: ColorPalette.qlessApp,
            ),
          ),
          const Text(
            "We sent it to the number +994 55  *** ** 12",
            style: TextStyle(color: Colors.blueGrey),
          ),
          Spaces.vertical20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [0, 1, 2, 3]
                .map(
                  (index) => Padding(
                    padding: Paddings.p8,
                    child: SizedBox(
                      width: 50,
                      child: TextField(
                        maxLength: 1,
                        maxLines: 1,
                        controller: _controllers[index],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.none,
                        focusNode: _nodes[index],
                        autofocus: index == 0,
                        decoration: const InputDecoration(counterText: ""),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Spaces.vertical20,
          const Text(
            "Resend code in 00:50",
            style: TextStyle(fontSize: 16, color: ColorPalette.lightBlack),
          ),
          Expanded(
            flex: 5,
            child: GridView.count(
              reverse: true,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.5,
              crossAxisCount: 3,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      primary: ColorPalette.qlessApp),
                  child: const Icon(Icons.fingerprint_rounded, size: 40),
                  onPressed: () async {
                    ///FINGERPRINT
                    bool a = await authenticate();
                    print("AUTHSTATUSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS: " +
                        a.toString());
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      primary: ColorPalette.qlessApp),
                  child: const Text("0",
                      style: TextStyle(
                          color: ColorPalette.lightBlack, fontSize: 28)),
                  onPressed: () {
                    addNumber("0");
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      primary: ColorPalette.qlessApp),
                  child: const Icon(Icons.backspace_rounded, size: 35),
                  onPressed: () {
                    removeNumber();
                  },
                ),
                ..._inputs.map(
                  (i) => TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        primary: ColorPalette.qlessApp),
                    child: Text(i,
                        style: const TextStyle(
                            color: ColorPalette.lightBlack, fontSize: 28)),
                    onPressed: () {
                      addNumber(i);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void addNumber(String i) {
    if (_controllers[0].text.isEmpty) {
      _controllers[0].text = i;
      _nodes[1].requestFocus();
    } else if (_controllers[1].text.isEmpty) {
      _controllers[1].text = i;
      _nodes[2].requestFocus();
    } else if (_controllers[2].text.isEmpty) {
      _controllers[2].text = i;
      _nodes[3].requestFocus();
    } else if (_controllers[3].text.isEmpty) {
      _controllers[3].text = i;
    }

    bool completed = true;
    for (var cont in _controllers) {
      if (cont.text.isEmpty) {
        completed = false;
        break;
      }
    }

    if (completed) {
      ///VERIFY TOKEN
      if (_controllers[0].text.isNotEmpty &&
          _controllers[1].text.isNotEmpty &&
          _controllers[2].text.isNotEmpty &&
          _controllers[3].text.isNotEmpty) {
        Navigator.pushReplacement(
            context, SlideRightRoute(page: const ResetPasswordScreen()));
      }
    }
  }

  void removeNumber() {
    for (var element in _nodes) {
      if (element.hasFocus) {
        _controllers[_nodes.indexOf(element)].clear();
      }
    }
    // if (_controllers[3].text.isNotEmpty) {
    //   _controllers[3].clear();
    //   _nodes[2].requestFocus();
    // } else if (_controllers[2].text.isNotEmpty) {
    //   _controllers[2].clear();
    //   _nodes[1].requestFocus();
    // } else if (_controllers[1].text.isNotEmpty) {
    //   _controllers[1].clear();
    //   _nodes[0].requestFocus();
    // } else if (_controllers[0].text.isNotEmpty) {
    //   _controllers[0].clear();
    //   _nodes[0].requestFocus();
    // }
  }

  Future<bool> authenticate() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();

    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'Please complete the biometrics to proceed.',
        biometricOnly: true,
      );
    }

    return isAuthenticated;
  }
}
