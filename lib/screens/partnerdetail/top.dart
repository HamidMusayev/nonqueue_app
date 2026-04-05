import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../widgets/partner_tile.dart';

class TopPanel extends StatelessWidget {
  const TopPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.network(
              'https://images.stockcake.com/public/8/6/d/86d4659b-fb86-4bf5-abd2-ec6b7ed145f2_large/cozy-coffee-shop-stockcake.jpg',
            ),
          ),
        ),
        Padding(
          padding: Paddings.p12.copyWith(top: 110),
          child: ClipRRect(
            borderRadius: Radiuses.r20,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                padding: Paddings.p16,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(0.5),
                  borderRadius: Radiuses.r20,
                ),
                child: const PartnerTile(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
