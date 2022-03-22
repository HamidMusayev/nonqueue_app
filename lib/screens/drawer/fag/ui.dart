import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/utils/constants.dart';

class FagScreen extends StatelessWidget {
  const FagScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAG',
          style: TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ExpansionTile(
            leading: const Icon(
              Icons.question_answer_rounded,
              color: ColorPalette.qlessApp,
            ),
            title: Text(
              'How to change my account info?'.tr,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            children: const <Widget>[
              ListTile(
                title: Text('Lorem ipsum dolor sit amet, consectetur '
                    'adipiscing elit.'),
              ),
            ],
          ),
          const ExpansionTile(
            leading: Icon(
              Icons.question_answer_rounded,
              color: ColorPalette.qlessApp,
            ),
            title: Text(
              'How to order items?',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            children: <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
          ),
          const ExpansionTile(
            leading: Icon(
              Icons.question_answer_rounded,
              color: ColorPalette.qlessApp,
            ),
            title: Text(
              'How to pay for items?',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            children: <Widget>[
              ListTile(title: Text('a')),
            ],
          ),
        ],
      ),
    );
  }
}
