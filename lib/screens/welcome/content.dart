import 'package:flutter/cupertino.dart';
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
        // SvgPicture.asset(
        //   data["image"] ?? "",
        //   placeholderBuilder: (context) => const CircularProgressIndicator(),
        // ),
        Flexible(
          child: Image.asset(data["image"] ?? ""),
        ),
        Spaces.vertical50,
        Text(
          data["title"] ?? "",
          softWrap: true,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22),
        ),
        Spaces.vertical10,
        Text(data["text"] ?? "", softWrap: true),
      ],
    );
  }
}
