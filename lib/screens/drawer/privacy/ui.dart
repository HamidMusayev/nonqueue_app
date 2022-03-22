import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/utils/constants.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'privacypolicy'.tr,
          style: const TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: Container(
        padding: Paddings.p16,
        constraints: const BoxConstraints(maxWidth: 450),
        child: const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Enim et aenean eros, sed amet urna sit. Lorem integer a cras tristique donec massa mauris. Arcu, fusce eget venenatis commodo, nunc integer aliquet. Mi convallis sodales tempor id viverra eget. Sagittis ullamcorper aliquam praesent volutpat cursus vel quis. Bibendum a, viverra et sit. Elit sit interdum et lectus id pharetra, consequat. Imperdiet mattis faucibus a ut semper tellus risus. Nunc sed auctor tortor molestie. Sapien, tristique nunc, iaculis est sed vitae egestas nulla.'),
      ),
    );
  }
}
