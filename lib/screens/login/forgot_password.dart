import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/phone_input/phone_input_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Text(
        'ŞİFRƏNİ UNUTDUN?',
        style: TextStyle(
          color: Colors.cyan,
          decoration: TextDecoration.underline,
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Mobil nömrənizi daxil edin'),
            content: const IntlPhoneField(
              searchText: 'Axtarın...',
              invalidNumberMessage: 'Səhv nömrə!',
              initialCountryCode: 'AZ',
              autofocus: true,
              dropDownIcon: Icon(Icons.arrow_drop_down_rounded),
            ),
            actions: [
              TextButton(
                child: const Text('Növbəti'),
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text(
                          '+994*******70 Nömrənizə göndərilmiş SMS kodu daxil edin'),
                      content: const TextField(
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: '6 Rəqəmli kod',
                          prefixIcon: Icon(Icons.pin_rounded),
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('Növbəti'),
                          onPressed: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text('Yeni şifrənizi daxil edin'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    TextField(
                                      textInputAction: TextInputAction.done,
                                      obscureText: true,
                                      autofocus: true,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                        hintText: 'Yeni şifrə',
                                        prefixIcon: Icon(Icons.vpn_key_rounded),
                                      ),
                                    ),
                                    Spaces.vertical10,
                                    TextField(
                                      textInputAction: TextInputAction.done,
                                      obscureText: true,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                        hintText: 'Yeni şifrə təkrarı',
                                        prefixIcon: Icon(Icons.vpn_key_rounded),
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('Hazırdır'),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
