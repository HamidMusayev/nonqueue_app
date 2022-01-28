import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';

class BonusCard extends StatelessWidget {
  final List<bool> items;
  const BonusCard({Key? key, required this.items}) : super(key: key);

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
            shadowColor: Colors.blueGrey.shade50,
            elevation: 5,
            margin: Paddings.p8,
            color: Colors.white,
            shape: const RoundedRectangleBorder(borderRadius: Radiuses.r20),
            child: InkWell(
              borderRadius: Radiuses.r20,
              onTap: () {},
              child: Padding(
                padding: Paddings.p16,
                child: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.grey.shade100,
                            radius: 40,
                            backgroundImage: const NetworkImage(
                                "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/classic_snowball-9022de0.jpg?quality=90&resize=500,454")),
                        Spaces.vertical20,
                        Flexible(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 80),
                            child: Wrap(
                                children: items
                                    .map((e) => const Icon(
                                          Icons.restaurant_rounded,
                                          size: 16,
                                          color: Colors.black,
                                        ))
                                    .toList()),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: Paddings.p16,
                      child: DottedLine(
                        direction: Axis.vertical,
                        lineLength: double.infinity,
                        lineThickness: 2,
                        dashLength: 8,
                        dashColor: Colors.black,
                        dashRadius: 10,
                        dashGapLength: 6,
                        dashGapColor: Colors.transparent,
                        dashGapRadius: 0.0,
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
                              color: Colors.black,
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Spaces.vertical10,
                          Text(
                            '1 Free the biggest americano',
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Spaces.vertical10,
                          Text(
                            'for buying 10 hot drinks cappuchino',
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.blueGrey,
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
            shadowColor: Colors.pink.shade200,
            elevation: 5,
            margin: Paddings.p8,
            color: Colors.pink.shade800,
            shape: const RoundedRectangleBorder(borderRadius: Radiuses.r20),
            child: InkWell(
              borderRadius: Radiuses.r20,
              onTap: () {},
              child: Padding(
                padding: Paddings.p16,
                child: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.pink.shade900,
                            radius: 40,
                            backgroundImage: const NetworkImage(
                                "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/classic_snowball-9022de0.jpg?quality=90&resize=500,454")),
                        Spaces.vertical20,
                        Flexible(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 80),
                            child: Wrap(
                                children: items
                                    .map((e) => Icon(
                                          Icons.restaurant_rounded,
                                          size: 16,
                                          color:
                                              e ? Colors.white : Colors.white70,
                                        ))
                                    .toList()),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: Paddings.p16,
                      child: DottedLine(
                        direction: Axis.vertical,
                        lineLength: double.infinity,
                        lineThickness: 2,
                        dashLength: 8,
                        dashColor: Colors.white,
                        dashRadius: 10,
                        dashGapLength: 6,
                        dashGapColor: Colors.transparent,
                        dashGapRadius: 0.0,
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
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Spaces.vertical10,
                          Text(
                            '1 Free the biggest americano',
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Spaces.vertical10,
                          Text(
                            'for buying 10 hot drinks cappuchino',
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(
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
