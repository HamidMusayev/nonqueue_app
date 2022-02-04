import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/partner_tile.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.center,
          child: DottedLine(
            direction: Axis.horizontal,
            lineLength: 50,
            lineThickness: 5,
            dashLength: 50,
            dashColor: Color(0xFFD6D6DA),
            dashRadius: 10,
          ),
        ),
        Spaces.vertical10,
        const TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: Icon(Icons.search_rounded),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Spaces.vertical20,
                const Text(
                  'Nearby your current location',
                  style: TextStyle(
                    color: ColorPalette.lightBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Spaces.vertical10,
                Wrap(
                  spacing: 8,
                  children: ['5km', '10 km', '15 km']
                      .map((e) => Chip(
                            label: Text(e),
                          ))
                      .toList(),
                ),
                Spaces.vertical20,
                const Text(
                  'Food type',
                  style: TextStyle(
                    color: ColorPalette.lightBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Spaces.vertical10,
                Wrap(
                  spacing: 8,
                  children: [
                    'Coffee',
                    'Fast food',
                    'Smoothies',
                    'Vegan',
                    'Seafood',
                    'Cocktails',
                    'Deserts'
                  ]
                      .map((e) => Chip(
                            label: Text(e),
                          ))
                      .toList(),
                ),
                Spaces.vertical20,
                const Text(
                  'Order again',
                  style: TextStyle(
                    color: ColorPalette.lightBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                ListView.builder(
                  itemCount: 6,
                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => const Padding(
                    padding: Paddings.p8,
                    child: PartnerTile(),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
