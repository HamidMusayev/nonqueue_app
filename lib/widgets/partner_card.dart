import 'package:flutter/material.dart';
import 'package:nonqueue_app/models/company/company_branch.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/starmark.dart';

class PartnerCard extends StatelessWidget {
  final VoidCallback onTap;
  final CompanyBranch branch;
  const PartnerCard({Key? key, required this.onTap, required this.branch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorPalette.stroke,
      elevation: 4,
      margin: Paddings.p8,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(borderRadius: Radiuses.r10),
      child: InkWell(
        onTap: () => onTap.call(),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 160),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 130,
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
                    Text(
                      branch.name,
                      style: const TextStyle(
                        color: ColorPalette.lightBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          branch.adress,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            color: ColorPalette.greyInputText,
                          ),
                        ),
                        StarMark(stars: branch.stars),
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
