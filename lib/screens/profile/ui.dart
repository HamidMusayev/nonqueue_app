import 'package:flutter/material.dart';
import 'package:nonqueue_app/screens/auth/welcome/ui.dart';
import 'package:nonqueue_app/screens/inapp/drawer/account_info.dart';
import 'package:nonqueue_app/utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: Paddings.p16,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                    radius: 50,
                  ),
                ),
                Spaces.vertical20,
                Padding(
                  padding: Paddings.p24.copyWith(top: 0, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text(
                            'N-Q points :',
                            style: TextStyle(
                              color: ColorPalette.greyInputText,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                '10',
                                style: TextStyle(
                                  color: ColorPalette.greyInputText,
                                  fontSize: 18,
                                ),
                              ),
                              Spaces.horizontal6,
                              Icon(
                                Icons.toll_rounded,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Text(
                            'N-Q balance :',
                            style: TextStyle(
                              color: ColorPalette.lightBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '35 ₼',
                            style: TextStyle(
                              color: ColorPalette.lightBlack,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spaces.vertical20,
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Full name',
                  ),
                ),
                Spaces.vertical20,
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                ),
                Spaces.vertical20,
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Bio',
                  ),
                ),
                Spaces.vertical20,
                TextButton(
                  style: TextButton.styleFrom(
                    primary: ColorPalette.editColor,
                    backgroundColor: Colors.transparent,
                    fixedSize: const Size.fromHeight(20),
                  ),
                  child: const Text(
                    'Account information',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountInfoScreen(),
                      fullscreenDialog: true,
                    ),
                  ),
                ),
                Spaces.vertical10,
                TextButton(
                  style: TextButton.styleFrom(
                    primary: ColorPalette.editColor,
                    backgroundColor: Colors.transparent,
                    fixedSize: const Size.fromHeight(20),
                  ),
                  child: const Text(
                    'Log out',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Log out'),
                        content: const Text('Are you sure?'),
                        actions: [
                          TextButton(
                            child: const Text('Yes'),
                            style: TextButton.styleFrom(
                              fixedSize: const Size.fromHeight(40),
                              backgroundColor: ColorPalette.glassEffect,
                              primary: ColorPalette.qlessApp,
                            ),
                            onPressed: () {
                              // SharedHelper.removeJson("user");
                              // SharedHelper.setBool("saveMe", false);
                              Navigator.pushAndRemoveUntil<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) =>
                                          const WelcomeScreen()),
                                  (route) => false);
                            },
                          ),
                          TextButton(
                            child: const Text('No'),
                            style: TextButton.styleFrom(
                                fixedSize: const Size.fromHeight(40)),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
