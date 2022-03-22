import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/utils/constants.dart';

class CompletedCouponScreen extends StatelessWidget {
  const CompletedCouponScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<bool> _items = [
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'coupon'.tr,
          style: const TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: Paddings.p16,
          child: Column(
            children: [
              Card(
                elevation: 5,
                shadowColor: Colors.blueGrey.shade50,
                shape: const RoundedRectangleBorder(
                  borderRadius: Radiuses.r10,
                  side: BorderSide(
                    color: ColorPalette.stroke,
                  ),
                ),
                child: Padding(
                  padding: Paddings.p32,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F23%2F2012%2F02%2F03%2Fwarm-hazelnut-toddy.jpg'),
                      ),
                      const Padding(
                        padding: Paddings.p24,
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 2,
                          dashLength: 16,
                          dashColor: ColorPalette.greyInputText,
                          dashRadius: 10,
                          dashGapLength: 10,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0,
                        ),
                      ),
                      FittedBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _items
                              .map((e) => const Icon(
                                    Icons.coffee_rounded,
                                    color: ColorPalette.lightBlack,
                                  ))
                              .toList(),
                        ),
                      ),
                      Spaces.vertical10,
                      Text(
                        '${_items.where((element) => element).toList().length} / ${_items.length}',
                        style: const TextStyle(
                          color: ColorPalette.greyInputText,
                          fontSize: 16
                        ),
                      ),
                      Spaces.vertical10,
                      const Text(
                        '1 Free hot drink',
                        style: TextStyle(
                          color: ColorPalette.lightBlack,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'for buying 10 cups of hot drinks',
                        style: TextStyle(
                          color: ColorPalette.lightBlack,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spaces.vertical10,
                      Spaces.vertical20,
                      const Text(
                        'Redeemable at all Starbucks Coffee stores in Azerbaijan',
                        style: TextStyle(color: ColorPalette.greyInputText),
                      ),
                      const Text(
                        'Redeemable at all Starbucks Coffee stores in Azerbaijan',
                        style: TextStyle(color: ColorPalette.greyInputText),
                      ),
                      const Text(
                        'Redeemable at all Starbucks Coffee stores in Azerbaijan',
                        style: TextStyle(color: ColorPalette.greyInputText),
                      ),
                      Spaces.vertical20,
                      Text(
                        'validtill'.tr+ '01/05/22',
                        style: const TextStyle(
                          fontSize: 16,
                          color: ColorPalette.lightBlack,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spaces.vertical20,
              TextButton(
                child: Text('usegift'.tr),
                // onPressed: () {
                //   if (_formKey.currentState!.validate()) {
                //     login();
                //   }
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
