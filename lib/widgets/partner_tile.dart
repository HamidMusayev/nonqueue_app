import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/starmark.dart';

class PartnerTile extends StatelessWidget {
  const PartnerTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://cdn.mos.cms.futurecdn.net/8tEvBrHEeMTTBt26SiniHM.jpg'),
          radius: 40,
        ),
        Spaces.horizontal6,
        Spaces.horizontal6,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Starbucks',
              style: TextStyle(
                color: ColorPalette.lightBlack,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            StarMark(stars: 1.251),
            Text(
              'Best coffee here!',
              style: TextStyle(
                color: ColorPalette.greyInputText,
                fontSize: 14,
              ),
            ),
            Text(
              'Fatali Kyoski ave. Ganjlik mall',
              softWrap: true,
              style: TextStyle(
                color: ColorPalette.lightBlack,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }
}
