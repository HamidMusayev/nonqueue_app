import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/starmark.dart';

class PartnerCard extends StatelessWidget {
  const PartnerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blueGrey.shade50,
      elevation: 5,
      margin: Paddings.p8,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(borderRadius: Radiuses.r10),
      child: InkWell(
        onTap: () {},
        child: Container(
          constraints: const BoxConstraints(maxWidth: 160),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 160,
                width: 160,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network(
                    'https://image.freepik.com/free-photo/cheesecake-topped-with-cofee-cup-coffee_140725-3361.jpg',
                  ),
                ),
              ),
              Padding(
                padding: Paddings.p8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Company name',
                      style: TextStyle(
                        color: ColorPalette.lightBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          '5 km away',
                          overflow: TextOverflow.fade,
                        ),
                        StarMark(),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
