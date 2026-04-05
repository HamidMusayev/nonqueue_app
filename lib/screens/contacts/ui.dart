import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/contacts/controller.dart';
import 'package:nonqueue_app/screens/contacts/partners/ui.dart';
import 'package:nonqueue_app/utils/constants.dart';

class ContactsScreen extends GetView<ContactsController> {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: Paddings.p16.copyWith(bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.person_add_rounded),
              title: Text('giftinviteyourfriend'.tr),
              horizontalTitleGap: 0,
            ),
            const Divider(
              color: ColorPalette.greyInputText,
              height: 40,
              thickness: 1,
            ),
            Text(
              'nqpcontacts'.tr,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: ColorPalette.lightBlack,
              ),
            ),
            Spaces.vertical20,
            Obx(
              () => Visibility(
                replacement: Column(
                  children: [
                    Text(
                      'allowapplicationaccessyourcontacts'.tr,
                      style: const TextStyle(
                        color: ColorPalette.greyInputText,
                      ),
                    ),
                    Spaces.vertical20,
                    TextButton(
                      onPressed: () => controller.initContacts(),
                      child: Text('allowaccess'.tr),
                    )
                  ],
                ),
                visible: controller.isGranted.value,
                child: Container(),
              ),
            ),
            Obx(
              () => Visibility(
                replacement: Expanded(
                  child: ListView.builder(
                    itemCount: controller.nonQueueContacts.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PartnersScreen(),
                          fullscreenDialog: true,
                        ),
                      ),
                      contentPadding: EdgeInsets.zero,
                      leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/splash/contact.png'),
                        radius: 24,
                        backgroundColor: Colors.transparent,
                      ),
                      title:
                          Text(controller.nonQueueContacts[index].displayName),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.card_giftcard_rounded,
                            color: ColorPalette.qlessApp,
                          ),
                          Spaces.horizontal6,
                          Spaces.horizontal6,
                          Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 28,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                visible: controller.isLoading.value,
                child: const LinearProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
