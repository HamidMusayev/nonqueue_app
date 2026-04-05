import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/bindings/drawer_flow_bindings.dart';
import 'package:nonqueue_app/utils/constants.dart';
import '../drawer/about/ui.dart';
import '../drawer/controller.dart';
import '../drawer/faq/ui.dart';
import '../drawer/help/ui.dart';
import '../drawer/payment/ui.dart';
import '../drawer/privacy/ui.dart';
import 'account/ui.dart';
import 'balance/ui.dart';
import 'history/ui.dart';

class CustomDrawer extends GetView<CustomDrawerController> {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: Paddings.p12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: Paddings.p24.copyWith(left: 0),
                icon: const Icon(
                  Icons.close_rounded,
                  color: ColorPalette.qlessApp,
                  size: 30,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              Flexible(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ListTile(
                      title: Text('yournqbalance'.tr),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BalanceScreen(),
                          fullscreenDialog: true,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('paymentmethods'.tr),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentMethodsScreen(),
                          fullscreenDialog: true,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('orderhistory'.tr),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderHistoryScreen(),
                          fullscreenDialog: true,
                        ),
                      ),
                    ),
                    const Divider(
                      color: ColorPalette.qlessApp,
                      endIndent: 100,
                      indent: 20,
                      thickness: 2,
                      height: 30,
                    ),
                    ListTile(
                      title: Text('accountinfo'.tr),
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(
                          () => const AccountScreen(),
                          binding: AccountBinding(),
                          fullscreenDialog: true,
                        );
                      },
                    ),
                    ListTile(
                      title: Text('about'.tr),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutScreen(),
                          fullscreenDialog: true,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('helpcenter'.tr),
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(
                          () => const HelpScreen(),
                          binding: HelpBinding(),
                          fullscreenDialog: true,
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('FAQ'),
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(
                          () => const FaqScreen(),
                          binding: FaqBinding(),
                          fullscreenDialog: true,
                        );
                      },
                    ),
                    ListTile(
                      title: Text('privacypolicy'.tr),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyScreen(),
                          fullscreenDialog: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<CustomDrawerController>(
                builder: (_) => ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<Map<String, String>>(
                    value: controller.activeLang,
                    isExpanded: false,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    underline: Container(),
                    borderRadius: Radiuses.r10,
                    onChanged: controller.updateLanguage,
                    items: controller.languages.map((lang) {
                      return DropdownMenuItem<Map<String, String>>(
                        value: lang,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/flags/${lang['icon']}'),
                              radius: 15,
                            ),
                            Spaces.horizontal6,
                            Text(lang['name'] ?? '')
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Spaces.vertical50,
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/splash/instagram_black.svg',
                      height: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/splash/facebook_black.svg',
                      height: 50,
                    ),
                  ),
                ],
              ),
              Spaces.vertical20,
            ],
          ),
        ),
      ),
    );
  }
}
