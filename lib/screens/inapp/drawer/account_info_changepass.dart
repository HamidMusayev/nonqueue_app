import 'package:flutter/material.dart';
import 'package:nonqueue_app/screens/auth/pswforgot/ui.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/utils/validators.dart';

class AccountInfoChangePassScreen extends StatelessWidget {
  const AccountInfoChangePassScreen({Key? key}) : super(key: key);

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
          'Change password',
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
                  'Your password must be more then six characters long and include a combination of nubmers, letters and special characters (!#@&%)',
                  style: TextStyle(color: ColorPalette.greyInputText),
                ),
                Spaces.vertical50,
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autofocus: false,
                  obscureText: _isObsecure,
                  controller: _passTxt,
                  validator: (value) => ValidatorHelper.validateEmail(value),
                  decoration:
                      const InputDecoration(hintText: 'Current password'),
                ),
                Spaces.vertical10,
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  controller: _newpassTxt,
                  obscureText: _isObsecure,
                  validator: (value) => ValidatorHelper.validatePassword(value),
                  decoration: const InputDecoration(hintText: 'New password'),
                ),
                Spaces.vertical10,
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  controller: _newpassTxt,
                  obscureText: _isObsecure,
                  validator: (value) => ValidatorHelper.validatePassword(value),
                  decoration:
                      const InputDecoration(hintText: 'Re-enter new password'),
                ),
                Spaces.vertical50,
                TextButton(
                  style: TextButton.styleFrom(
                    primary: ColorPalette.editColor,
                    backgroundColor: Colors.transparent,
                    fixedSize: const Size.fromHeight(20),
                  ),
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen()
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
