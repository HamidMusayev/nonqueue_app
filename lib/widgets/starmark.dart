import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';

class StarMark extends StatelessWidget {
  final double stars;
  const StarMark({Key? key, required this.stars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          stars.toStringAsFixed(1),
          style: const TextStyle(
            color: ColorPalette.lightBlack,
            fontSize: 14,
          ),
        ),
        const Icon(
          Icons.star,
          color: Colors.amber, size: 20,
        ),
      ],
    );
  }
}
