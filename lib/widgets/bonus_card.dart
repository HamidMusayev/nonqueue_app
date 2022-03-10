import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';

class BonusCard extends StatelessWidget {
  final List<bool> items;
  final VoidCallback onTap;
  const BonusCard({Key? key, required this.items, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool completed = true;
    for (bool i in items) {
      if (!i) {
        completed = false;
        break;
      }
    }
    return completed
        ? Card(
            shadowColor: ColorPalette.stroke,
            elevation: 4,
            margin: Paddings.p8,
            color: Colors.white,
            shape: const RoundedRectangleBorder(borderRadius: Radiuses.r20),
            child: InkWell(
              borderRadius: Radiuses.r20,
              onTap: () => onTap.call(),
              child: Padding(
                padding: Paddings.p16,
                child: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                                'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/classic_snowball-9022de0.jpg?quality=90&resize=500,454')),
                        Spaces.vertical20,
                        Flexible(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 70),
                            child: Wrap(
                              children: items
                                  .map(
                                    (e) => const Icon(
                                      Icons.restaurant_rounded,
                                      size: 14,
                                      color: ColorPalette.lightBlack,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: Paddings.p16,
                      child: DottedLine(
                        direction: Axis.vertical,
                        lineLength: double.infinity,
                        lineThickness: 1,
                        dashLength: 10,
                        dashColor: ColorPalette.lightBlack,
                        dashRadius: 10,
                        dashGapLength: 8,
                        dashGapColor: Colors.transparent,
                        dashGapRadius: 0,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Company Name',
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(
                              color: ColorPalette.lightBlack,
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Spaces.vertical10,
                          Text(
                            '1 Free the biggest americano',
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 12,
                              color: ColorPalette.lightBlack,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Spaces.vertical10,
                          Text(
                            'for buying 10 hot drinks cappuchino',
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 10,
                              color: ColorPalette.greyInputText,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Card(
            shadowColor: ColorPalette.couponColor,
            elevation: 4,
            margin: Paddings.p8,
            color: ColorPalette.couponColor,
            shape: const RoundedRectangleBorder(borderRadius: Radiuses.r20),
            child: InkWell(
              borderRadius: Radiuses.r20,
              onTap: () => onTap.call(),
              child: Padding(
                padding: Paddings.p16,
                child: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                                'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/classic_snowball-9022de0.jpg?quality=90&resize=500,454')),
                        Spaces.vertical20,
                        Flexible(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 70),
                            child: Wrap(
                              children: items
                                  .map(
                                    (e) => Icon(
                                      Icons.restaurant_rounded,
                                      size: 14,
                                      color: e ? Colors.white : Colors.white70,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: Paddings.p16,
                      child: DottedLine(
                        direction: Axis.vertical,
                        lineLength: double.infinity,
                        lineThickness: 1,
                        dashLength: 10,
                        dashColor: Colors.white,
                        dashRadius: 10,
                        dashGapLength: 8,
                        dashGapColor: Colors.transparent,
                        dashGapRadius: 0,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Company Name',
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Spaces.vertical10,
                          Text(
                            '1 Free the biggest americano',
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Spaces.vertical10,
                          Text(
                            'for buying 10 hot drinks cappuchino',
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white70,
                              overflow: TextOverflow.ellipsis,
                            ),
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

  // Widget _buildShadowGradient() {
  //   return const DecoratedBox(
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         begin: Alignment.topCenter,
  //         end: Alignment.bottomCenter,
  //         colors: [
  //           Colors.transparent,
  //           Colors.black87,
  //         ],
  //       ),
  //     ),
  //     child: SizedBox.expand(),
  //   );
  // }
}
