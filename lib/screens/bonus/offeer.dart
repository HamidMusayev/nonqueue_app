import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/bonus/offerdetail.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/discount_tile.dart';

class OfferPanel extends StatelessWidget {
  const OfferPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              itemCount: 7,
              itemBuilder: (context, index) => DiscountTile(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OfferDetailScreen(),
                    fullscreenDialog: true,
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
