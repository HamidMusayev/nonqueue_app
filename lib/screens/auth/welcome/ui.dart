import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/routes/app_routes.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'content.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _pageIndex = 0;
  final _controller = PageController(initialPage: 0);

  final List<Map<String, String>> _splashData = [
    {'title': 'orderbeforego'.tr, 'image': 'assets/splash/first.svg'},
    {
      'title': 'makefriendshappysendgifts'.tr,
      'image': 'assets/splash/second.svg'
    },
    {'title': 'getorderwithoutwaiting'.tr, 'image': 'assets/splash/third.svg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) => setState(() => _pageIndex = value),
              itemCount: _splashData.length,
              itemBuilder: (context, index) =>
                  SplashContent(data: _splashData[index]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _splashData.length,
              (index) => buildDot(index: index),
            ),
          ),
          Spaces.vertical20,
          Padding(
            padding: Paddings.p24,
            child: _pageIndex == 2
                ? TextButton(
                    child: Text('getstarted'.tr),
                    onPressed: () => Get.offNamed(AppRoutes.onboard))
                : TextButton(
                    child: Text('next'.tr),
                    onPressed: () {
                      setState(
                        () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.fastOutSlowIn,
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: _pageIndex == index ? 36 : 32,
      decoration: BoxDecoration(
        color:
            _pageIndex == index ? ColorPalette.nonQueue : ColorPalette.stroke,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
