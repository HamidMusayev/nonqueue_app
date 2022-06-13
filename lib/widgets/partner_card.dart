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
      elevation: 2,
      margin: Paddings.p8,
      color: Colors.white,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(borderRadius: Radiuses.r10),
      child: GestureDetector(
        onTap: () => onTap.call(),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 170),
          child: Column(
            children: [
              SizedBox(
                height: 135,
                width: 170,
                child: Image.network(
                  'https://image.freepik.com/free-photo/cheesecake-topped-with-cofee-cup-coffee_140725-3361.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: Paddings.p8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      branch.name,
                      maxLines: 1,
                      style: const TextStyle(
                        color: ColorPalette.lightBlack,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            branch.adress ?? '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              color: ColorPalette.greyInputText,
                              fontSize: 12,
                            ),
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
