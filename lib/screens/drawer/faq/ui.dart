import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/drawer/faq/controller.dart';
import 'package:nonqueue_app/utils/constants.dart';

class FaqScreen extends GetView<FaqController> {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAQ',
          style: TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: Obx(
        ()=> Visibility(
          visible: controller.isLoading.value,
          replacement: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.faqs.length,
            itemBuilder: (context, index) => ExpansionTile(
              leading: const Icon(
                Icons.question_answer_rounded,
                color: ColorPalette.qlessApp,
              ),
              title: Text(
                controller.faqs[index].question,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(controller.faqs[index].answer),
                ),
              ],
            ),
          ),
          child: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
