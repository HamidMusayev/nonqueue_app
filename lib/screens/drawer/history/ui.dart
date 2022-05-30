import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/drawer/history/detail.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/order_tile.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> orders = [
      {
        'date': 'Thu 11/11',
        'name': 'Starbuckffffffffffffffffffffffffffffffffffffs',
        'desc': '2 americano, 1 cappuchino',
        'value': '17.50 AZN',
        'time': '13:35',
        'image':
            'https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png'
      },
      {
        'date': 'October 2021',
        'name': 'Starbucks',
        'desc': '1 latte',
        'value': '5.50 AZN',
        'time': '18:24',
        'image':
            'https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'orderhistory'.tr,
          style: const TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: Container(
        padding: Paddings.p16,
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) => OrderTile(
            order: orders[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HistoryDetailScreen(),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
