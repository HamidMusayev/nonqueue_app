import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/screens/drawer/fag/controller.dart';
import 'package:nonqueue_app/utils/constants.dart';

class FagScreen extends GetView<FaqController> {
  const FagScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FaqController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAG',
          style: TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: Obx(
        ()=> Visibility(
          visible: controller.isLoading.value,
          child: Center(child: CircularProgressIndicator()),
          replacement: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: controller.faqs.length,
            itemBuilder: (context, index) => ExpansionTile(
              leading: Icon(
                Icons.question_answer_rounded,
                color: ColorPalette.qlessApp,
              ),
              title: Text(
                controller.faqs[index].question,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(controller.faqs[index].answer),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
