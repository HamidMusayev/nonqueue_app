import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/inapp/drawer/about.dart';
import 'package:nonqueue_app/screens/inapp/drawer/account/ui.dart';
import 'package:nonqueue_app/screens/inapp/drawer/balance.dart';
import 'package:nonqueue_app/screens/inapp/drawer/fag.dart';
import 'package:nonqueue_app/screens/inapp/drawer/help.dart';
import 'package:nonqueue_app/screens/inapp/drawer/history.dart';
import 'package:nonqueue_app/screens/inapp/drawer/payment.dart';
import 'package:nonqueue_app/screens/inapp/drawer/privacy.dart';
import 'package:nonqueue_app/utils/constants.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> _languages = [
      {
        'name': 'Azerbaijani',
        'icon': 'az.png',
        'locale': 'az',
        'locale2': 'AZ',
      },
      {
        'name': 'English',
        'icon': 'us.png',
        'locale': 'en',
        'locale2': 'GB',
      },
      {
        'name': 'Russian',
        'icon': 'ru.png',
        'locale': 'ru',
        'locale2': 'RU',
      },
    ];

    Map<String, String> _activeLang = _languages[0];
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
                      title: const Text('Your N-Q Balance'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BalanceScreen(),
                          fullscreenDialog: true,
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('Payment methods'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentMethodsScreen(),
                          fullscreenDialog: true,
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('Order history'),
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
                      title: const Text('Account information'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AccountInfoScreen(),
                          fullscreenDialog: true,
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('About'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutScreen(),
                          fullscreenDialog: true,
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('Help Center'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HelpScreen(),
                          fullscreenDialog: true,
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('FAQ'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FagScreen(),
                          fullscreenDialog: true,
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('Privacy Policy'),
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
              StatefulBuilder(
                builder: (context, state) => ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<Map<String, String>>(
                    value: _activeLang,
                    isExpanded: false,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    underline: Container(),
                    borderRadius: Radiuses.r10,
                    onChanged: (lang) {
                      if (lang != null) {
                        Get.updateLocale(
                            Locale(lang['locale']!, lang['locale2']));
                        state(() => _activeLang = lang);
                      }
                    },
                    items: _languages.map((lang) {
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
