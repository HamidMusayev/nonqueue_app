import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';

class GiftScreen extends StatelessWidget {
  final Map<String, String> gift;
  const GiftScreen({Key? key, required this.gift}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> _giftdetails = [
      {
        'name': 'Cofe americano',
        'count': 'x1',
      },
      {
        'name': 'Cofe cappuchino',
        'count': 'x1',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gift',
          style: TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: Paddings.p16,
          child: Column(
            children: [
              Card(
                elevation: 5,
                shadowColor: Colors.blueGrey.shade50,
                shape: const RoundedRectangleBorder(
                  borderRadius: Radiuses.r10,
                  side: BorderSide(
                    color: ColorPalette.stroke,
                  ),
                ),
                child: Padding(
                  padding: Paddings.p32,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80'),
                      ),
                      Spaces.vertical20,
                      Text(
                        gift['title'] ?? '',
                        style: const TextStyle(
                          color: ColorPalette.lightBlack,
                          fontSize: 16,
                        ),
                      ),
                      const Padding(
                        padding: Paddings.p24,
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 2,
                          dashLength: 16,
                          dashColor: ColorPalette.greyInputText,
                          dashRadius: 10,
                          dashGapLength: 10,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.card_giftcard_rounded,
                            color: ColorPalette.qlessApp,
                            size: 35,
                          ),
                          Spaces.horizontal6,
                          Spaces.horizontal6,
                          Text(
                            gift['subtitle'] ?? '',
                            style: const TextStyle(
                              color: ColorPalette.lightBlack,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Spaces.vertical10,
                      ..._giftdetails.map(
                        (e) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          dense: true,
                          title: Text(
                            e['name'] ?? '',
                            style: const TextStyle(
                              color: ColorPalette.lightBlack,
                              fontSize: 16,
                            ),
                          ),
                          trailing: Text(e['count'] ?? ''),
                        ),
                      ),
                      Spaces.vertical20,
                      const Text(
                        'Redeemable at all Starbucks Coffee stores in Azerbaijan',
                        style:
                            TextStyle(color: ColorPalette.greyInputText),
                      )
                    ],
                  ),
                ),
              ),
              Spaces.vertical20,
              TextButton(
                child: const Text('Use Gift'),
                // onPressed: () {
                //   if (_formKey.currentState!.validate()) {
                //     login();
                //   }
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
