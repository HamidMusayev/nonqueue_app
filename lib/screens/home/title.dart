import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/utils/constants.dart';

class TitlePanel extends StatelessWidget {
  final String? title;
  final String subtitle;
  final bool? viewAllButton;
  const TitlePanel(
      {Key? key, this.title, required this.subtitle, this.viewAllButton})
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
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              title != null
                  ? Text(title!,
                      style: const TextStyle(color: ColorPalette.qlessApp, fontSize: 12))
                  : Container(),
              Text(
                subtitle,
                style: const TextStyle(
                  color: ColorPalette.lightBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          viewAllButton == null
              ? TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: ColorPalette.editColor,
                    backgroundColor: Colors.transparent,
                    fixedSize: const Size.fromHeight(20),
                  ),
                  child: Text(
                    'viewall'.tr,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
