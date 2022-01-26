
import 'package:flutter/material.dart';
import 'package:nonqueue_app/models/user.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/utils/encription.dart';

class HospitalCard extends StatelessWidget {
  final User hospital;
  const HospitalCard({Key? key, required this.hospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'http://194.135.95.23:8081/medicaldirector/api/user/getpicture?type=hospital&hashpin=${EncriptionHelper.hasPin(hospital.pinappusmast??"")}'),
          fit: BoxFit.cover,
        ),
      ),
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
                    SizedBox(
                      height: 90,
                      child: Image.network(
                          'http://194.135.95.23:8081/medicaldirector/api/user/getpicture?type=logo&hashpin=${EncriptionHelper.hasPin(hospital.pinappusmast??"")}',
                          fit: BoxFit.contain),
                    ),
                    Spaces.vertical20,
                    Text(
                      hospital.email,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Daxil ol',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
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
