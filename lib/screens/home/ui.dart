import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/home/controller.dart';
import 'package:nonqueue_app/screens/home/title.dart';
import 'package:nonqueue_app/screens/inapp/coupon/completed_ui.dart';
import 'package:nonqueue_app/screens/inapp/coupon/ui.dart';
import 'package:nonqueue_app/widgets/bonus_card.dart';
import 'package:nonqueue_app/widgets/partner_card.dart';

import '../partnerdetail/ui.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitlePanel(
            title: 'lovefree'.tr,
            subtitle: 'yourbonuses'.tr,
          ),
          CarouselSlider.builder(
            itemCount: controller.items.length,
            itemBuilder: (context, itemIndex, pageViewIndex) => BonusCard(
              items: controller.items[itemIndex],
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => controller.items[itemIndex]
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
              height: 200,
              //aspectRatio: 15 / 8,
              //viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 1500),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {},
              scrollDirection: Axis.horizontal,
            ),
          ),
          TitlePanel(
            title: 'quickorder'.tr,
            subtitle: 'allpartners'.tr,
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 205),
            child: Obx(
              () => Visibility(
                visible: controller.isLoading.value,
                replacement: ListView.builder(
                  primary: false,
                  padding: const EdgeInsets.only(left: 16),
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.branches.length,
                  itemBuilder: (context, index) => PartnerCard(
                    branch: controller.branches[index],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PartnerDetailScreen(),
                        fullscreenDialog: true,
                      ),
                    ),
                  ),
                ),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
          TitlePanel(
            title: 'peoplelike'.tr,
            subtitle: 'mostpopular'.tr,
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 205),
            child: Obx(
              () => Visibility(
                visible: controller.isLoading.value,
                replacement: ListView.builder(
                  primary: false,
                  padding: const EdgeInsets.only(left: 16),
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.branches.length,
                  itemBuilder: (context, index) => PartnerCard(
                    branch: controller.branches[index],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PartnerDetailScreen(),
                        fullscreenDialog: true,
                      ),
                    ),
                  ),
                ),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
