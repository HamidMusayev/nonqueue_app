import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment Methods',
          style: TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: Container(
        padding: Paddings.p16,
        constraints: const BoxConstraints(maxWidth: 450),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Set your default payment card',
              style: TextStyle(
                color: ColorPalette.lightBlack,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spaces.vertical10,
            Expanded(
              child: ListView.builder(
                primary: false,
                itemCount: 4,
                itemBuilder: (context, index) => RadioListTile(
                  title: const Text('Salary card'),
                  subtitle: Row(
                    children: const [
                      Text('**** **** **** 2233'),
                      Spaces.horizontal6,
                      Text('Expiry date:  01/22 ')
                    ],
                  ),
                  value: false,
                  onChanged: (value) {
                    print(value);
                  },
                  groupValue: false,
                ),
              ),
            ),
            Spaces.vertical10,
            ExpansionTile(
              title: const Text(
                'Add new card',
                style: TextStyle(
                  color: ColorPalette.lightBlack,
                  fontSize: 18,
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
                        decoration: const InputDecoration(
                          hintText: 'Card holder',
                        ),
                      ),
                      Spaces.vertical20,
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: 'Card number',
                            prefixIcon: Icon(Icons.credit_card_rounded)),
                      ),
                      Spaces.vertical20,
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                hintText: 'Expire date',
                              ),
                            ),
                          ),
                          Spaces.horizontal6,
                          Expanded(
                            child: TextFormField(
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                hintText: 'CVV',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spaces.vertical50,
                      TextButton(
                        child: const Text('Add new Card'),
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
