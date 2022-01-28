import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
            Icon(Icons.near_me_rounded, color: Colors.blue),
            Spaces.horizontal6,
            Text(
              'Select location',
              style: TextStyle(color: Colors.blue, fontSize: 18),
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
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
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
                primary:  false,
                padding: EdgeInsets.only(left: 24),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [1,2,3,4,5,6].map((e)=> PartnerCard()).toList(),
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
