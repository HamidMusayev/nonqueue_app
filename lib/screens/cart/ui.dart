import 'package:flutter/material.dart';
import 'package:nonqueue_app/widgets/bonus_card.dart';

import '../../utils/constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, String>> _cartitems = [
    {
      'name': 'Caffe Americano',
      'size': 'grande',
      'value': '17.50 AZN',
      'count': '1',
      'image':
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/index-unhealthiest-starbucks-drinks-1572380007.jpg?crop=0.495xw:0.990xh;0,0&resize=640:*'
    },
    {
      'name': 'Caffe Mocha',
      'size': 'medium',
      'value': '5.50 AZN',
      'count': '1',
      'image':
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/index-unhealthiest-starbucks-drinks-1572380007.jpg?crop=0.495xw:0.990xh;0,0&resize=640:*'
    },
    {
      'name': 'Caramel Machiato',
      'size': 'large',
      'value': '5.50 AZN',
      'count': '1',
      'image':
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/index-unhealthiest-starbucks-drinks-1572380007.jpg?crop=0.495xw:0.990xh;0,0&resize=640:*'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping bag',
          style: TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Paddings.p16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Order items',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: _cartitems.length,
                  itemBuilder: (context, index) => Padding(
                    padding: Paddings.p8,
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(_cartitems[index]['image'] ?? ''),
                          radius: 36,
                        ),
                        Spaces.horizontal6,
                        Spaces.horizontal6,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _cartitems[index]['name'] ?? '',
                              softWrap: true,
                              style: const TextStyle(
                                color: ColorPalette.lightBlack,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Size: ${_cartitems[index]['size'] ?? ''}',
                              softWrap: true,
                              style: const TextStyle(
                                color: ColorPalette.greyInputText,
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Spaces.vertical10,
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: Radiuses.r10,
                                border: Border.all(color: ColorPalette.stroke),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        if (int.parse(_cartitems[index]['count']
                                                .toString()) >
                                            0) {
                                          setState(() {
                                            _cartitems[index]['count'] =
                                                (int.parse(_cartitems[index]
                                                                ['count']
                                                            .toString()) -
                                                        1)
                                                    .toString();
                                          });
                                        }
                                      },
                                      icon: const Icon(Icons.remove_rounded)),
                                  Text(
                                    _cartitems[index]['count'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _cartitems[index]['count'] = (int.parse(
                                                    _cartitems[index]['count']
                                                        .toString()) +
                                                1)
                                            .toString();
                                      });
                                    },
                                    icon: const Icon(Icons.add_rounded),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.clear_rounded,
                                color: ColorPalette.qlessApp,
                              ),
                              onPressed: () {
                                setState(() {
                                  _cartitems.remove(_cartitems[index]);
                                });
                              },
                            ),
                            Text(
                              _cartitems[index]['value'] ?? '',
                              style: const TextStyle(
                                color: ColorPalette.lightBlack,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                color: ColorPalette.lightBlack,
                height: 40,
              ),
              const Text(
                'Total',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spaces.vertical10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Price in manat, inc taxes',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '16.00 AZN',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Spaces.vertical20,
              ExpansionTile(
                leading: const Icon(
                  Icons.card_giftcard_rounded,
                  color: ColorPalette.qlessApp,
                ),
                title: const Text(
                  'Hey, the item you chosed has a coupon! Tap here!',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    child: BonusCard(
                        items: const [true, true, true, true, true],
                        onTap: () {}),
                  ),
                ],
              ),
              Spaces.vertical50,
              TextButton(onPressed: () {}, child: const Text('Next'))
            ],
          ),
        ),
      ),
    );
  }
}
