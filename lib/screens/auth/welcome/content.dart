import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nonqueue_app/utils/constants.dart';

class SplashContent extends StatelessWidget {
  final Map<String, String> data;
  const SplashContent({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: SvgPicture.asset(
            data['image'] ?? '',
            placeholderBuilder: (context) => const CircularProgressIndicator(),
          ),
        ),
        Spaces.vertical50,
        Text(
          data['title'] ?? '',
          softWrap: true,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ColorPalette.greyInputText,
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
