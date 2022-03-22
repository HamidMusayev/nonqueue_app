import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/utils/constants.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'paymentmethods'.tr,
          style: const TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: Container(
        padding: Paddings.p16,
        constraints: const BoxConstraints(maxWidth: 450),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'setdefaultcard'.tr,
              style: const TextStyle(
                color: ColorPalette.lightBlack,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spaces.vertical10,
            Flexible(
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) => RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('salarycard'.tr),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('**** **** **** 2233'),
                      Text('expirydate'.tr + ' 01/22'),
                      SvgPicture.asset(
                        'assets/splash/mastercard.svg',
                        height: 15,
                      ),
                    ],
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                  value: false,
                  groupValue: false,
                ),
              ),
            ),
            Spaces.vertical10,
            ExpansionTile(
              title: Text(
                'addnewcard'.tr,
                style: const TextStyle(
                  color: ColorPalette.lightBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              children: [
                Spaces.vertical20,
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(hintText: 'cardholder'.tr),
                      ),
                      Spaces.vertical20,
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'cardnumber'.tr,
                          prefixIcon: const Icon(Icons.credit_card_rounded),
                        ),
                      ),
                      Spaces.vertical20,
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              decoration:
                                  InputDecoration(hintText: 'expiredate'.tr),
                            ),
                          ),
                          Spaces.horizontal6,
                          Flexible(
                            child: TextFormField(
                              textInputAction: TextInputAction.done,
                              decoration:
                                  const InputDecoration(hintText: 'CVV'),
                            ),
                          ),
                        ],
                      ),
                      Spaces.vertical50,
                      TextButton(
                        child: Text('addnewcard'.tr),
                        // onPressed: () {
                        //   if (_formKey.currentState!.validate()) {
                        //     login();
                        //   }
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
