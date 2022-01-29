import 'package:flutter/material.dart';
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
        children: const <Widget>[
          ExpansionTile(
            leading: Icon(
              Icons.question_answer_rounded,
              color: ColorPalette.qlessApp,
            ),
            title: Text(
              'How can we help you?',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            children: <Widget>[
              ListTile(
                  title: Text('Lorem ipsum dolor sit amet, consectetur '
                      'adipiscing elit.')),
            ],
          ),
          ExpansionTile(
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
          ExpansionTile(
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
