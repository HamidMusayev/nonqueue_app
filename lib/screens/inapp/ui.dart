import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/bonus/ui.dart';
import 'package:nonqueue_app/screens/contacts/ui.dart';
import 'package:nonqueue_app/screens/home/ui.dart';
import 'package:nonqueue_app/screens/profile/ui.dart';
import 'package:nonqueue_app/screens/search/ui.dart';
import 'package:nonqueue_app/utils/constants.dart';
import '../drawer/ui.dart';
import 'notification/ui.dart';

class InAppScreen extends StatefulWidget {
  const InAppScreen({Key? key}) : super(key: key);

  @override
  _InAppScreenState createState() => _InAppScreenState();
}

class _InAppScreenState extends State<InAppScreen> {
  final List<Widget> _widgets = [
    const HomeScreen(),
    const MapScreen(),
    const BonusScreen(),
    const ContactsScreen(),
    const ProfileScreen(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Row(
        //   children: const [
        //     Icon(
        //       Icons.near_me_rounded,
        //       color: ColorPalette.editColor,
        //     ),
        //     Spaces.horizontal6,
        //     Text(
        //       'Search Location',
        //       style: TextStyle(
        //         color: ColorPalette.editColor,
        //         fontSize: 18,
        //       ),
        //     )
        //   ],
        // ),
        title: const Text(
          'Non Queue',
          style: TextStyle(
            color: ColorPalette.lightBlack,
            fontSize: 18,
          ),
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_rounded),
            label: 'home'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search_rounded),
            label: 'search1'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.card_giftcard_rounded),
            label: 'bonuses'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.supervisor_account_rounded),
            label: 'contacts'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_rounded),
            label: 'profile'.tr,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorPalette.qlessApp,
        unselectedItemColor: ColorPalette.greyInputText,
        elevation: 10,
        onTap: _onItemTapped,
      ),
      drawer: const CustomDrawer(),
      body: _widgets.elementAt(_selectedIndex),
    );
  }
}
