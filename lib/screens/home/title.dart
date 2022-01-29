import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';

class TopPanel extends StatelessWidget {
  final String title;
  final String subtitle;
  const TopPanel({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.p24,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(color: ColorPalette.qlessApp),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: ColorPalette.lightBlack,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: ColorPalette.editColor,
              backgroundColor: Colors.transparent,
              fixedSize: const Size.fromHeight(20),
            ),
            child: const Text(
              "View all",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
