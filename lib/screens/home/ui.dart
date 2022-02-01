import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nonqueue_app/screens/home/drawer.dart';
import 'package:nonqueue_app/screens/home/title.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/bonus_card.dart';
import 'package:nonqueue_app/widgets/partner_card.dart';

import 'notification/ui.dart';

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

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationScreen(),
                fullscreenDialog: true,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_rounded),
            label: 'Bonuses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account_rounded),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorPalette.qlessApp,
        unselectedItemColor: ColorPalette.greyInputText,
        elevation: 10,
        onTap: _onItemTapped,
      ),
      drawer: const HomeDrawer(),
      body: SingleChildScrollView(
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
            )
          ],
        ),
      ),
    );
  }
}
