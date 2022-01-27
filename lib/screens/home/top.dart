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
      padding: Paddings.p32,
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
                style: const TextStyle(color: Colors.pink),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Text(
            "View all",
            style: TextStyle(color: Colors.blue, fontSize: 16),
          )
        ],
      ),
    );
  }
}
