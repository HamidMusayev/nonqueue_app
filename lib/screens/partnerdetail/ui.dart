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
      body: SingleChildScrollView(
        child: Column(
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
                            backgroundColor: Colors.white,
                            side: BorderSide(color: ColorPalette.qlessApp),
                            labelStyle: TextStyle(color: ColorPalette.qlessApp),
                            label: Text('Drinks'),
                          )
                        : const Chip(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: ColorPalette.stroke),
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
                    child: _activeIndex == index
                        ? const Chip(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: ColorPalette.qlessApp),
                            labelStyle: TextStyle(color: ColorPalette.qlessApp),
                            label: Text('Hot'),
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
            )
          ],
        ),
      ),
    );
  }
}
