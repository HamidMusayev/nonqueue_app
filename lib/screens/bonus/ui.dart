import 'package:flutter/material.dart';
import 'package:nonqueue_app/screens/bonus/mybonus.dart';
import 'package:nonqueue_app/screens/bonus/offeer.dart';
import 'package:nonqueue_app/utils/constants.dart';

class BonusScreen extends StatefulWidget {
  const BonusScreen({Key? key}) : super(key: key);

  @override
  State<BonusScreen> createState() => _BonusScreenState();
}

class _BonusScreenState extends State<BonusScreen>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.glassEffect,
        title: TabBar(
          controller: _controller,
          labelColor: ColorPalette.qlessApp,
          unselectedLabelColor: ColorPalette.greyInputText,
          //isScrollable: true,
          tabs: const [
            Tab(text: 'Offers'),
            Tab(text: 'My bonuses'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          OfferPanel(),
          MyBonusPanel(),
        ],
      ),
    );
  }
}
