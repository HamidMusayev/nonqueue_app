import 'package:flutter/material.dart';
import 'package:nonqueue_app/screens/home/gift/ui.dart';
import 'package:nonqueue_app/utils/constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> _notifications = [
      {
        'image':
            'https://i.pinimg.com/564x/a6/29/02/a62902c0458a23d705492bb701371a43.jpg',
        'title': 'You get a gift from Hamid Musayev',
        'subtitle': 'Coupon from Starbucks'
      },
      {
        'image':
            'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'title': 'You get a gift from Nihad Afandi',
        'subtitle': 'Coupon from Starbucks'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: Container(
        padding: Paddings.p16,
        child: ListView.builder(
          itemCount: _notifications.length,
          itemBuilder: (context, index) => ListTile(
            contentPadding: Paddings.p8,
            leading: CircleAvatar(
              backgroundColor: ColorPalette.greyInputText,
              radius: 30,
              backgroundImage:
                  NetworkImage(_notifications[index]['image'] ?? ''),
            ),
            title: Text(_notifications[index]['title'] ?? ''),
            subtitle: Text(
              _notifications[index]['subtitle'] ?? '',
              style: const TextStyle(color: ColorPalette.greyInputText),
            ),
            trailing: const Icon(Icons.navigate_next_rounded),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GiftScreen(),
                fullscreenDialog: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
