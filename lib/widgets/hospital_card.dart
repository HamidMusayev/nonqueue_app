import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';

class BonusCard extends StatelessWidget {
  final String text;
  const BonusCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   // image: DecorationImage(
      //   //   image: NetworkImage(
      //   //       'http://194.135.95.23:8081/medicald'),
      //   //   fit: BoxFit.cover,
      //   // ),
      // ),
      child: Stack(
        children: [
          _buildShadowGradient(),
          Padding(
            padding: Paddings.p16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    // SizedBox(
                    //   height: 90,
                    //   child: Image.network(
                    //       'http://194.135',
                    //       fit: BoxFit.contain),
                    // ),
                    Spaces.vertical20,
                    const Text(
                      "hospital.email",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Daxil ol',
                            style: TextStyle(fontSize: 14, color: Colors.white)),
                        Icon(Icons.navigate_next_rounded, color: Colors.white)
                      ],
                    )
                  ],
                ),
                Container(
                  padding: Paddings.p8,
                  decoration: const BoxDecoration(
                      color: Colors.white, borderRadius: Radiuses.r8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.notifications_rounded, color: Colors.red),
                      Text('48', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShadowGradient() {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black87,
          ],
        ),
      ),
      child: SizedBox.expand(),
    );
  }
}
