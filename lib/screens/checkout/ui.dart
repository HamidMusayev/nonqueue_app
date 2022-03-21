import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TimeOfDay _pickedTime = TimeOfDay.now();
  int? _pickedType;
  int? _pickedPayment;

  int _activeStep = 0;

  final List<Map<String, dynamic>> _cards = [
    {
      'value': 1,
      'name': 'Salary card',
      'number': '**** **** **** 2233',
      'icon': 'assets/splash/mastercard.svg'
    },
    {
      'value': 2,
      'name': 'Salary card 2',
      'number': '**** **** **** 2252',
      'icon': 'assets/splash/visacard.svg'
    },
    {
      'value': 3,
      'name': 'Student card',
      'number': '**** **** **** 4515',
      'icon': 'assets/splash/mastercard.svg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.glassEffect,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'checkout'.tr,
          style: const TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('total'.tr),
            trailing: const Text(
              '16.00 AZN',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text('priceinmanatinctaxes'.tr),
          ),
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ColorPalette.stroke,
                  spreadRadius: 2,
                  blurRadius: 5,
                )
              ],
              color: Colors.white,
              borderRadius: Radiuses.r20,
            ),
            child: Theme(
              data: Theme.of(context).copyWith(),
              child: Stepper(
                onStepContinue: () => setState(() => _activeStep++),
                onStepCancel: () => setState(() => _activeStep--),
                currentStep: _activeStep,
                physics: const BouncingScrollPhysics(),
                steps: [
                  Step(
                    isActive: _activeStep == 0,
                    state:
                        _activeStep > 0 ? StepState.indexed : StepState.indexed,
                    title: Text('details'.tr),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RadioListTile(
                          title: Text('pickup'.tr),
                          subtitle: Text('takefoodwithmyself'.tr),
                          value: 1,
                          groupValue: _pickedType,
                          onChanged: (int? value) =>
                              setState(() => _pickedType = value),
                        ),
                        RadioListTile(
                          title: Text('onsite'.tr),
                          subtitle: Text('itatrestaraunt'.tr),
                          value: 2,
                          groupValue: _pickedType,
                          onChanged: (int? value) =>
                              setState(() => _pickedType = value),
                        ),
                        Spaces.vertical10,
                        ListTile(
                          title: Text('yourarrivaltime'.tr),
                          subtitle: Text(
                            _pickedTime.format(context),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: ColorPalette.greyInputText,
                            ),
                          ),
                          leading: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              fixedSize: const Size.fromHeight(45),
                              shape: const RoundedRectangleBorder(
                                borderRadius: Radiuses.r10,
                              ),
                            ),
                            child: const Icon(Icons.access_time_rounded),
                            onPressed: () async => await _selectTime(),
                          ),
                        ),
                        Spaces.vertical20,
                        Spaces.vertical10,
                      ],
                    ),
                  ),
                  Step(
                    isActive: _activeStep == 1,
                    state: _activeStep > 1
                        ? StepState.complete
                        : StepState.indexed,
                    title: Text('payment'.tr),
                    content: Column(
                      children: [
                        RadioListTile(
                          title: Text('nqbalance'.tr + '35.00 AZN'),
                          value: 0,
                          groupValue: _pickedPayment,
                          onChanged: (int? value) =>
                              setState(() => _pickedPayment = value),
                        ),
                        ..._cards.map(
                          (c) => RadioListTile(
                            title: Text(c['name']),
                            onChanged: (int? value) =>
                                setState(() => _pickedPayment = value),
                            value: c['value'] as int,
                            groupValue: _pickedPayment,
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(c['number']),
                                SvgPicture.asset(c['icon'], height: 12),
                              ],
                            ),
                          ),
                        ),
                        Spaces.vertical20,
                        Spaces.vertical10,
                      ],
                    ),
                  ),
                  Step(
                    isActive: _activeStep == 2,
                    state: _activeStep > 2
                        ? StepState.complete
                        : StepState.indexed,
                    title: Text('confirmation'.tr),
                    content: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/splash/check.svg',
                          height: 60,
                        ),
                        Spaces.horizontal6,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('congratulations'.tr),
                            Text('yourorderdone'.tr),
                            Spaces.vertical10,
                            Text(
                              'yourordernumber'.tr,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const Text(
                              '#241218',
                              style: TextStyle(
                                color: ColorPalette.greyInputText,
                                fontWeight: FontWeight.w500,
                                fontSize: 26,
                              ),
                            ),
                            Spaces.vertical50,
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
                controlsBuilder: (context, controlDetails) => Row(
                  children: [
                    Visibility(
                      visible: _activeStep == 2,
                      child: Container(),
                      replacement: TextButton(
                        onPressed: controlDetails.onStepContinue,
                        style: TextButton.styleFrom(
                            fixedSize: const Size.fromHeight(45)),
                        child: Padding(
                          padding: Paddings.p24.copyWith(top: 0, bottom: 0),
                          child: Text('next'.tr),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _activeStep == 2,
                      child: TextButton(
                        onPressed: controlDetails.onStepCancel,
                        style: TextButton.styleFrom(
                            fixedSize: const Size.fromHeight(45)),
                        child: Padding(
                          padding: Paddings.p24.copyWith(top: 0, bottom: 0),
                          child: Text('track order'.tr),
                        ),
                      ),
                    ),
                    Spaces.horizontal6,
                    Visibility(
                      visible: _activeStep == 1,
                      replacement: Container(),
                      child: OutlinedButton(
                        onPressed: controlDetails.onStepCancel,
                        style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: Radiuses.r10),
                          primary: ColorPalette.lightBlack,
                          side: const BorderSide(
                              color: ColorPalette.greyInputText),
                          fixedSize: const Size.fromHeight(45),
                        ),
                        child: Padding(
                          padding: Paddings.p24.copyWith(top: 0, bottom: 0),
                          child: Text('back'.tr),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedS = await showTimePicker(
        context: context,
        initialTime: _pickedTime,
        builder: (context, child) => Theme(
              data: Theme.of(context).copyWith(
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    fixedSize: const Size.fromHeight(45),
                  ),
                ),
              ),
              child: child!,
            ));

    if (pickedS != null && pickedS != _pickedTime) {
      setState(() => _pickedTime = pickedS);
    }
  }
}
