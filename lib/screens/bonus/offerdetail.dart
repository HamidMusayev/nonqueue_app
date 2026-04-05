import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/widgets/discount_tile.dart';

import '../../utils/constants.dart';

class OfferDetailScreen extends StatelessWidget {
  const OfferDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'offerdetail'.tr,
          style: const TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: Container(
        padding: Paddings.p16,
        child: Column(
          children: [
            DiscountTile(onTap: () {}),
            Spaces.vertical20,
            const Text(
                'Come before 12:00 oclock get 30% discount \n* Drinks included in the promotion: Coca-Cola, Coca-Cola Zero, Fanta, Sprite \n* Papadias included in the promotion: Italian, Chicken BBQ and Spicy Chicken Ranch \n* Calzone included in the promotion: Meat and Chicken \n* The order is valid for restaurants at 28 Mall, Park Bulvar, Genclik Mall, Deniz Mall and Shuvalan Park TM.'),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text('gotobuy'.tr),
            )
          ],
        ),
      ),
    );
  }
}
