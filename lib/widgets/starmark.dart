import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';

class StarMark extends StatelessWidget {
  const StarMark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text(
          '5.0',
          style: TextStyle(
            color: ColorPalette.lightBlack,
            fontSize: 16,
          ),
        ),
        Icon(
          Icons.star,
          color: Colors.orange,
        ),
      ],
    );
  }
}
