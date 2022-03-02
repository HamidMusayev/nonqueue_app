import 'package:flutter/material.dart';
import 'package:nonqueue_app/screens/inapp/drawer/account_info_changepass.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/utils/validators.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isObsecure = true;

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final TextEditingController _passTxt = TextEditingController();
    final TextEditingController _newpassTxt = TextEditingController();
    //final UserService _service = UserService(DIOService());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account information',
          style: TextStyle(color: ColorPalette.lightBlack),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.check_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: Paddings.p16,
          constraints: const BoxConstraints(maxWidth: 450),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Provide your personal information, '
                  'this won’t be part of your public profile',
                  style: TextStyle(color: ColorPalette.greyInputText),
                ),
                Spaces.vertical50,
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autofocus: false,
                  controller: _passTxt,
                  validator: (value) => ValidatorHelper.validateEmail(value),
                  decoration: const InputDecoration(hintText: 'Email address'),
                ),
                Spaces.vertical10,
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  controller: _newpassTxt,
                  validator: (value) => ValidatorHelper.validatePassword(value),
                  decoration: const InputDecoration(hintText: 'Phone number'),
                ),
                Spaces.vertical10,
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  controller: _newpassTxt,
                  validator: (value) => ValidatorHelper.validatePassword(value),
                  decoration: const InputDecoration(hintText: 'Gender'),
                ),
                Spaces.vertical10,
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.done,
                  controller: _newpassTxt,
                  validator: (value) => ValidatorHelper.validatePassword(value),
                  decoration: const InputDecoration(hintText: 'Date of birth'),
                ),
                Spaces.vertical50,
                TextButton(
                  style: TextButton.styleFrom(
                    primary: ColorPalette.editColor,
                    backgroundColor: Colors.transparent,
                    fixedSize: const Size.fromHeight(20),
                  ),
                  child: const Text(
                    'Change Password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountInfoChangePassScreen(),
                      fullscreenDialog: true,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
