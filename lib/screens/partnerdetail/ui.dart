import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nonqueue_app/widgets/partner_tile.dart';

import '../../utils/constants.dart';

class PartnerDetailScreen extends StatefulWidget {
  const PartnerDetailScreen({Key? key}) : super(key: key);

  @override
  _PartnerDetailScreenState createState() => _PartnerDetailScreenState();
}

class _PartnerDetailScreenState extends State<PartnerDetailScreen> {
  int _activeIndex = 0;
  int _activeSubIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Starbucks',
          style: TextStyle(
            color: ColorPalette.lightBlack,
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 220,
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network(
                    'https://www.greenqueen.com.hk/wp-content/uploads/2021/09/Shanghai-Opens-First-Starbucks-Greener-Store-Outside-North-America-1.jpg',
                  ),
                ),
              ),
              Padding(
                padding: Paddings.p12.copyWith(top: 140),
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      padding: Paddings.p16,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.5),
                        borderRadius: Radiuses.r20,
                      ),
                      child: const PartnerTile(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: Paddings.p16.copyWith(top: 0, bottom: 0, right: 0),
            child: SizedBox(
              height: 50,
              child: ListView.separated(
                itemCount: 7,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                primary: false,
                separatorBuilder: (context, index) => Spaces.horizontal6,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => setState(() => _activeIndex = index),
                  child: _activeIndex == index
                      ? const Chip(
                          backgroundColor: ColorPalette.qlessApp,
                          padding:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          labelStyle: TextStyle(color: Colors.white),
                          label: Text('Drinks'),
                        )
                      : const Chip(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: ColorPalette.stroke),
                          padding:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          labelStyle:
                              TextStyle(color: ColorPalette.greyInputText),
                          label: Text('Foods'),
                        ),
                ),
              ),
            ),
          ),
          Padding(
            padding: Paddings.p16.copyWith(top: 0, bottom: 0, right: 0),
            child: SizedBox(
              height: 50,
              child: ListView.separated(
                itemCount: 7,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                primary: false,
                separatorBuilder: (context, index) => Spaces.horizontal6,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => setState(() => _activeSubIndex = index),
                  child: _activeSubIndex == index
                      ? const Chip(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: ColorPalette.qlessApp),
                          labelStyle: TextStyle(color: ColorPalette.qlessApp),
                          label: Text('All drinks'),
                        )
                      : const Chip(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: ColorPalette.stroke),
                          labelStyle:
                              TextStyle(color: ColorPalette.greyInputText),
                          label: Text('Cold'),
                        ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: Paddings.p8,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 7,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Card(
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: Radiuses.r10,
                    side: BorderSide(color: ColorPalette.stroke),
                  ),
                  child: ExpansionTile(
                    title: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Caffe Americano'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '5.00 AZN',
                            style: TextStyle(
                              color: ColorPalette.qlessApp,
                            ),
                          ),
                          Text(
                            '8.00 AZN',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: ColorPalette.greyInputText,
                            ),
                          ),
                        ],
                      ),
                      leading: const CircleAvatar(
                        radius: 24,
                        //fit: BoxFit.fill,
                        backgroundImage: NetworkImage(
                            'https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1200-630,f_auto,q_auto:best/newscms/2019_33/2203981/171026-better-coffee-boost-se-329p.jpg'),
                      ),
                    ),
                    children: [
                      const Text(
                        '1 Big Tasty (beef), 1 medium Fries, 1 medium Coca-Cola drink.',
                        style: TextStyle(
                          color: ColorPalette.greyInputText,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text('Size:'),
                              Text('Drinks:'),
                              Text('Extras:'),
                            ],
                          ),
                          Column(
                            children: [

                            ],
                          )
                        ],
                      ),
                      ListTile(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
