import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/bonus_card.dart';

import '../inapp/coupon/completed_ui.dart';
import '../inapp/coupon/ui.dart';

class MyBonusPanel extends StatelessWidget {
  const MyBonusPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<List<bool>> _items = [
      [
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
      ],
      [
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
      ],
      [
        true,
        true,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
      ],
    ];

    return Container(
      padding: Paddings.p16.copyWith(bottom: 0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'search'.tr,
              prefixIcon: const Icon(Icons.search_rounded),
            ),
          ),
          Spaces.vertical10,
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _items.length,
              itemBuilder: (context, index) => SizedBox(
                height: 200,
                child: BonusCard(
                  items: _items[index],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _items[index]
                              .where((element) => !element)
                              .toList()
                              .isNotEmpty
                          ? const CouponScreen()
                          : const CompletedCouponScreen(),
                      fullscreenDialog: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
