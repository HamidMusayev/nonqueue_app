import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({Key? key}) : super(key: key);

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  bool _question = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.p8.copyWith(bottom: 0),
      child: Card(
        elevation: 5,
        shadowColor: Colors.grey.shade50,
        child: ListTile(
          minVerticalPadding: 16,
          title: const Text('Cihazların təmiri üçün'),
          trailing: _question
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: const Size.fromHeight(30),
                          backgroundColor: Colors.red.shade600),
                      child: const Icon(Icons.close_rounded, size: 20),
                      onPressed: () {
                        setState(() {
                          _question = false;
                        });
                      },
                    ),
                    Spaces.horizontal6,
                    TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: const Size.fromHeight(30),
                          backgroundColor: Colors.green.shade600),
                      child: const Icon(Icons.check_rounded, size: 20),
                      onPressed: () {
                        setState(() {
                          _question = false;
                        });
                      },
                    ),
                  ],
                )
              : TextButton(
                  style: TextButton.styleFrom(
                      fixedSize: const Size.fromHeight(30),
                      backgroundColor: Colors.grey),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.schedule_rounded, size: 20),
                      Spaces.horizontal6,
                      Text(
                        'Təsdiq gözləyir',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      _question = true;
                    });
                  },
                ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Divider(
                height: 12,
                color: Colors.white,
              ),
              Text('Texniki xərclər'),
              Divider(height: 12),
              Text('12 iyun 2022 13:54'),
            ],
          ),
        ),
      ),
    );
  }
}
