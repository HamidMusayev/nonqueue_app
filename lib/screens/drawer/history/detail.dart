import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/partner_tile.dart';

class HistoryDetailScreen extends StatefulWidget {
  const HistoryDetailScreen({Key? key}) : super(key: key);

  @override
  _HistoryDetailScreenState createState() => _HistoryDetailScreenState();
}

class _HistoryDetailScreenState extends State<HistoryDetailScreen> {
  final List<Map<String, String>> _orderdetails = [
    {
      'name': 'Cofe americano',
      'price': '6.00',
      'count': 'x1',
      'totalprice': '12.00'
    },
    {
      'name': 'Cofe cappuchino',
      'price': '6.00',
      'count': 'x1',
      'totalprice': '12.00'
    },
    {
      'name': 'Cofe macchito',
      'price': '6.00',
      'count': 'x1',
      'totalprice': '12.00'
    },
    {
      'name': 'A quad long shot grande in a venti cup',
      'price': '6.00',
      'count': 'x1',
      'totalprice': '12.00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'orderhistory'.tr,
          style: const TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: Paddings.p16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '11.11.2021, 18:22',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Spaces.vertical20,
              const PartnerTile(),
              Spaces.vertical20,
              Text(
                'orderstatus'.tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'Successful, 11/11/21, 18:22',
                style: TextStyle(fontSize: 18),
              ),
              Spaces.vertical20,
               Text(
                'total'.tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                '17.50 AZN',
                style: TextStyle(fontSize: 18),
              ),
              Spaces.vertical20,
              TextButton(
                child:  Text('orderagain'.tr),
                // onPressed: () {
                //   if (_formKey.currentState!.validate()) {
                //     login();
                //   }
                onPressed: () {},
              ),
              Spaces.vertical20,
              Text(
                'yourorder'.tr,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spaces.vertical20,
              Text(
                'orderitems'.tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ..._orderdetails.map(
                (e) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(e['name'] ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        child: Text(e['price'] ?? ''),
                      ),
                      Spaces.horizontal6,
                      Spaces.horizontal6,
                      Spaces.horizontal6,
                      SizedBox(
                        child: Text(e['count'] ?? ''),
                      ),
                      Spaces.horizontal6,
                      Spaces.horizontal6,
                      Spaces.horizontal6,
                      SizedBox(
                        child: Text(e['totalprice'] ?? ''),
                      ),
                    ],
                  ),
                ),
              ),
              Spaces.vertical10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'priceinmanatinctaxes'.tr,
                    style: const TextStyle(
                      color: ColorPalette.lightBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    '17.50 AZN',
                    style: TextStyle(
                      color: ColorPalette.lightBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
