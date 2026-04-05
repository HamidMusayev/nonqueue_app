import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/partner_tile.dart';

import '../../partnerdetail/ui.dart';

class FilterPanel extends StatefulWidget {
  const FilterPanel({Key? key}) : super(key: key);

  @override
  _FilterPanelState createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.center,
          child: DottedLine(
            direction: Axis.horizontal,
            lineLength: 50,
            lineThickness: 5,
            dashLength: 50,
            dashColor: Color(0xFFD6D6DA),
            dashRadius: 10,
          ),
        ),
        Spaces.vertical10,
        TextField(
          decoration: InputDecoration(
            hintText: 'search'.tr,
            prefixIcon: const Icon(Icons.search_rounded),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Spaces.vertical20,
                Text(
                  'nearbycurrentlocation'.tr,
                  style: const TextStyle(
                    color: ColorPalette.lightBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Spaces.vertical10,
                Wrap(
                  spacing: 8,
                  children: ['5km', '10 km', '15 km']
                      .map((e) => Chip(
                            label: Text(e),
                          ))
                      .toList(),
                ),
                Spaces.vertical20,
                Text(
                  'foodtype'.tr,
                  style: const TextStyle(
                    color: ColorPalette.lightBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Spaces.vertical10,
                Wrap(
                  spacing: 8,
                  children: [
                    'coffee'.tr,
                    'fastfood'.tr,
                    'smoothies'.tr,
                    'vegan'.tr,
                    'seafood'.tr,
                    'cocktails'.tr,
                    'deserts'.tr
                  ]
                      .map((e) => Chip(
                            label: Text(e),
                          ))
                      .toList(),
                ),
                Spaces.vertical20,
                Text(
                  'orderagain'.tr,
                  style: const TextStyle(
                    color: ColorPalette.lightBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                ListView.builder(
                  itemCount: 6,
                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PartnerDetailScreen(),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    contentPadding: Paddings.p8,
                    title: const PartnerTile(),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
