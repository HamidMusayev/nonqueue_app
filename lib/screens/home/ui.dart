import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nonqueue_app/screens/home/title.dart';
import 'package:nonqueue_app/screens/inapp/coupon/completed_ui.dart';
import 'package:nonqueue_app/screens/inapp/coupon/ui.dart';
import 'package:nonqueue_app/widgets/bonus_card.dart';
import 'package:nonqueue_app/widgets/partner_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopPanel(
            title: 'love free stuff?',
            subtitle: 'Your bonuses',
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 250),
            child: CarouselSlider.builder(
              itemCount: _items.length,
              itemBuilder: (context, itemIndex, pageViewIndex) => BonusCard(
                items: _items[itemIndex],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _items[itemIndex]
                            .where((element) => !element)
                            .toList()
                            .isNotEmpty
                        ? const CouponScreen()
                        : const CompletedCouponScreen(),
                    fullscreenDialog: true,
                  ),
                ),
              ),
              options: CarouselOptions(
                //height: 400,
                //aspectRatio: 16 / 9,
                //viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayAnimationDuration: const Duration(milliseconds: 1300),
                autoPlayCurve: Curves.fastOutSlowIn,
                onPageChanged: (index, reason) {},
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          const TopPanel(
            title: 'want to make quick order?',
            subtitle: 'All partners',
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 235),
            child: ListView(
              primary: false,
              padding: const EdgeInsets.only(left: 16),
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              children:
                  [1, 2, 3, 4, 5, 6].map((e) => const PartnerCard()).toList(),
            ),
          ),
          const TopPanel(
            title: 'what other people like?',
            subtitle: 'Most popular',
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 235),
            child: ListView(
              primary: false,
              padding: const EdgeInsets.only(left: 16),
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              children:
                  [1, 2, 3, 4, 5, 6].map((e) => const PartnerCard()).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
