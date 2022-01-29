import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help Center',
          style: TextStyle(color: ColorPalette.lightBlack),
        ),
      ),
      body: Container(
        padding: Paddings.p16,
        constraints: const BoxConstraints(maxWidth: 450),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Spaces.vertical20,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: ColorPalette.qlessApp,
                    size: 30,
                  ),
                  Spaces.horizontal6,
                  Text(
                    'How can we help you?',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Spaces.vertical20,
              Spaces.vertical10,
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Send us a message',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send_rounded),
                    ),
                    helperText: 'You will get answer to your email'
                        'as soon as possible'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
