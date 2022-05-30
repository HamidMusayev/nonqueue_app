import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/auth/otp/controller.dart';
import 'package:nonqueue_app/utils/constants.dart';

class OTPScreen extends StatefulWidget {
  final String email;
  final String type;

  const OTPScreen(
    this.email,
    this.type, {
    Key? key,
  }) : super(key: key);

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

  final List<String> _inputs = ['7', '8', '9', '4', '5', '6', '1', '2', '3'];

  final _controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            'enterotp'.tr,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: ColorPalette.qlessApp,
            ),
          ),
          Text(
            '${'wesentitto'.tr} ${widget.email.substring(0, 3)}*******${widget.email.substring(10)}',
            style: const TextStyle(color: Colors.blueGrey),
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
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: _controllers[index],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.none,
                        focusNode: _nodes[index],
                        autofocus: index == 0,
                        decoration: const InputDecoration(counterText: ''),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          //Spaces.vertical20,
          // const Text(
          //   'Resend code in 00:50',
          //   style: TextStyle(fontSize: 16, color: ColorPalette.lightBlack),
          // ),
          Expanded(
            flex: 5,
            child: GridView.count(
              reverse: true,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.5,
              crossAxisCount: 3,
              children: [
                // TextButton(
                //   style: TextButton.styleFrom(
                //       backgroundColor: Colors.white,
                //       primary: ColorPalette.qlessApp),
                //   child: const Icon(Icons.fingerprint_rounded, size: 40),
                //   onPressed: () async {
                //     await _controller.authenticate(widget.email);
                //   },
                // ),
                //Disabled Biometric Authentiction
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white, primary: Colors.white),
                  onPressed: null,
                  child: Container(),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      primary: ColorPalette.qlessApp),
                  child: const Text(
                    '0',
                    style: TextStyle(
                      color: ColorPalette.lightBlack,
                      fontSize: 28,
                    ),
                  ),
                  onPressed: () => addNumber('0'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      primary: ColorPalette.qlessApp),
                  child: const Icon(Icons.backspace_rounded, size: 35),
                  onPressed: () => removeNumber(),
                ),
                ..._inputs.map(
                  (i) => TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        primary: ColorPalette.qlessApp),
                    child: Text(i,
                        style: const TextStyle(
                            color: ColorPalette.lightBlack, fontSize: 28)),
                    onPressed: () => addNumber(i),
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
      _controller.confirmOtp(
        int.parse(
            '${_controllers[0].text}${_controllers[1].text}${_controllers[2].text}${_controllers[3].text}'),
        widget.email,
        widget.type,
      );
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
}
