import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';

class OfferPanel extends StatelessWidget {
  const OfferPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.p16,
      child: Column(
        children: const [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
