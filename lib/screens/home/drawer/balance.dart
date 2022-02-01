import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nonqueue_app/screens/home/drawer/payment.dart';
import 'package:nonqueue_app/utils/constants.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Non-Queue balance',
          style: TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: Paddings.p16,
          constraints: const BoxConstraints(maxWidth: 450),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: const [
                  Text(
                    'Current balance:',
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorPalette.lightBlack,
                    ),
                  ),
                  Spaces.horizontal6,
                  Spaces.horizontal6,
                  Text(
                    '35.00',
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorPalette.lightBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spaces.horizontal6,
                  Text(
                    '₼',
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorPalette.lightBlack,
                    ),
                  ),
                ],
              ),
              Spaces.vertical20,
              Row(
                children: const [
                  Text(
                    'Enter amount:',
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorPalette.lightBlack,
                    ),
                  ),
                  Spaces.horizontal6,
                  Spaces.horizontal6,
                  SizedBox(
                    width: 120,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '00.00',
                        suffixIcon: Text(
                          '₼',
                          style: TextStyle(
                            fontSize: 30,
                            color: ColorPalette.qlessApp,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Spaces.vertical50,
              TextButton(
                child: const Text('Add Money'),
                onPressed: () {},
              ),
              const Divider(
                height: 100,
                color: ColorPalette.greyInputText,
                thickness: 1,
                indent: 80,
                endIndent: 80,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.credit_card_rounded,
                    color: ColorPalette.qlessApp,
                  ),
                  Spaces.horizontal6,
                  Text(
                    'Your default payment card',
                    style: TextStyle(
                      color: ColorPalette.lightBlack,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Spaces.vertical20,
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Salary card'),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('**** **** **** 2233'),
                    const Text('Expiry date:  01/22 '),
                    SvgPicture.asset(
                      'assets/splash/mastercard.svg',
                      height: 15,
                    ),
                  ],
                ),
                value: false,
                onChanged: (value) {
                  print(value);
                },
                groupValue: false,
              ),
              Spaces.vertical10,
              TextButton(
                style: TextButton.styleFrom(
                  primary: ColorPalette.editColor,
                  backgroundColor: Colors.transparent,
                  fixedSize: const Size.fromHeight(20),
                ),
                child: const Text(
                  'Change default payment card',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentMethodsScreen(),
                    fullscreenDialog: true,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
