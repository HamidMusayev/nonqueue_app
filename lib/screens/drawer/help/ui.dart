import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/drawer/help/controller.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/utils/validators.dart';

class HelpScreen extends GetView<HelpController> {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'helpcenter'.tr,
          style: const TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: Container(
        padding: Paddings.p16,
        constraints: const BoxConstraints(maxWidth: 450),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Spaces.vertical20,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: ColorPalette.qlessApp,
                    size: 30,
                  ),
                  Spaces.horizontal6,
                  Text(
                    'wehelpyou'.tr,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Spaces.vertical20,
              Spaces.vertical10,
              Form(
                key: controller.formKey,
                child: TextFormField(
                  validator: ValidatorHelper.validateMsg,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'sendusmessage'.tr,
                    suffixIcon: Obx(
                      () => Visibility(
                        visible: controller.isLoading.value,
                        replacement: IconButton(
                          onPressed: () async => controller.sendForHelp(),
                          icon: const Icon(Icons.send_rounded),
                        ),
                        child: const SizedBox(
                            height: 5,
                            child: CircularProgressIndicator(),),
                      ),
                    ),
                    helperText: 'willgetansweryouremail'.tr,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
