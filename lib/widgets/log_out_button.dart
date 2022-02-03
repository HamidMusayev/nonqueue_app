import 'package:flutter/material.dart';
import 'package:nonqueue_app/screens/auth/welcome/ui.dart';
import 'package:nonqueue_app/utils/shared.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.logout_rounded,
        size: 28,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Çıxış'),
            content: const Text('Hesabdan çıxmaq istədiyinizə əminsiniz?'),
            actions: [
              TextButton(
                child: const Text('Bəli'),
                style: TextButton.styleFrom(
                  fixedSize: const Size.fromHeight(50),
                  backgroundColor: Colors.cyan.shade50,
                  primary: Colors.cyan,
                ),
                onPressed: () {
                  SharedHelper.removeJson("user");
                  SharedHelper.setBool("saveMe", false);
                  Navigator.pushAndRemoveUntil<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) =>
                              const WelcomeScreen()),
                      (route) => false);
                },
              ),
              TextButton(
                child: const Text('Xeyr'),
                style:
                    TextButton.styleFrom(fixedSize: const Size.fromHeight(50)),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
