import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/drawer/payment/ui.dart';
import 'package:nonqueue_app/utils/constants.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'nqbalance'.tr,
          style: const TextStyle(color: ColorPalette.lightBlack),
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
                children: [
                  Text(
                    'currentbalance'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      color: ColorPalette.lightBlack,
                    ),
                  ),
                  Spaces.horizontal6,
                  Spaces.horizontal6,
                  const Text(
                    '35.00',
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorPalette.lightBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spaces.horizontal6,
                  const Text(
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
                children: [
                  Text(
                    'enteramount'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      color: ColorPalette.lightBlack,
                    ),
                  ),
                  Spaces.horizontal6,
                  Spaces.horizontal6,
                  const SizedBox(
                    width: 120,
                    child: TextField(
                      keyboardType: TextInputType.number,
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
                child: Text('addmoney'.tr),
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
                children: [
                  const Icon(
                    Icons.credit_card_rounded,
                    color: ColorPalette.qlessApp,
                  ),
                  Spaces.horizontal6,
                  Text(
                    'defaultpaymentcard'.tr,
                    style: const TextStyle(
                      color: ColorPalette.lightBlack,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Spaces.vertical20,
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('salarycard'.tr),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('**** **** **** 2233'),
                    Text('${'expirydate'.tr}21/12'),
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
                  foregroundColor: ColorPalette.editColor,
                  backgroundColor: Colors.transparent,
                  fixedSize: const Size.fromHeight(20),
                ),
                child: Text(
                  'changepaymentcard'.tr,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
