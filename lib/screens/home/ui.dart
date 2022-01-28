import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:nonqueue_app/screens/home/top.dart';
import 'package:nonqueue_app/utils/constants.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(
              Icons.near_me_rounded,
              color: ColorPalette.editColor,
            ),
            Spaces.horizontal6,
            Text(
              'Select location',
              style: TextStyle(
                color: ColorPalette.editColor,
                fontSize: 18,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          )
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: Paddings.p8,
            child: ListView(
              // Important: Remove any padding from the ListView.
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    padding: Paddings.p24.copyWith(left: 0),
                    icon: const Icon(
                      Icons.close_rounded,
                      color: ColorPalette.qlessApp,
                      size: 30,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                ListTile(
                  title: const Text('Your N-Q Balance'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Payment methods'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Order history'),
                  onTap: () {},
                ),
                const Divider(
                  color: ColorPalette.qlessApp,
                  endIndent: 100,
                  indent: 20,
                  thickness: 2,
                  height: 40,
                ),
                ListTile(
                  title: const Text('Account information'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('About'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Help Center'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('FAQ'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Privacy Policy'),
                  onTap: () {},
                ),
                DropdownButton<String>(
                  value: 'us',
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  underline: Container(),
                  borderRadius: Radiuses.r10,
                  onChanged: (lang) {
                    if (lang != null) {
                      // Get.updateLocale(lang.value);
                      // setState(() => _activeLanguage = lang);
                    }
                  },
                  items: ['us', 'az', 'tr', 'ru'].map((lang) {
                    return DropdownMenuItem<String>(
                      value: lang,
                      child: Image.asset('assets/flags/$lang.png', width: 22),
                    );
                  }).toList(),
                ),
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
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopPanel(
              title: 'love free stuff?',
              subtitle: 'Your Bonuses',
            ),
            CarouselSlider.builder(
              itemCount: _items.length,
              itemBuilder: (context, itemIndex, pageViewIndex) => BonusCard(
                items: _items[itemIndex],
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
            const TopPanel(
              title: 'want to make quick order?',
              subtitle: 'All partners',
            ),
            Container(
              constraints: const BoxConstraints(maxHeight: 235),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 24),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [1, 2, 3, 4, 5, 6].map((e) => PartnerCard()).toList(),
              ),
            )
            // SizedBox(
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: 6,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (context, index) => PartnerCard()),
            // )
          ],
        ),
      ),
    );
  }
}
