import 'package:flutter/material.dart';
import 'package:nonqueue_app/screens/onboard/ui.dart';
import 'package:nonqueue_app/screens/welcome/content.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/route_transitions/slide_route.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _pageIndex = 0;
  final _controller = PageController(initialPage: 0);

  List<Map<String, String>> splashData = [
    {
      "title": "Hello, Welcome to Non-Queue!",
      "text": "Pick your order without waiting!",
      "image": "assets/splash/first.png"
    },
    {
      "title": "Hello, Welcome to Non-Queue!",
      "text": "Pick your order without waiting!",
      "image": "assets/splash/first.png"
    },
    {
      "title": "Hello, Welcome to Non-Queue!",
      "text": "Pick your order without waiting!",
      "image": "assets/splash/first.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Spacer(flex: 2),
          Expanded(
            flex: 6,
            child: PageView.builder(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) => setState(() => _pageIndex = value),
              itemCount: splashData.length,
              itemBuilder: (context, index) =>
                  SplashContent(data: splashData[index]),
            ),
          ),
          const Spacer(flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              splashData.length,
              (index) => buildDot(index: index),
            ),
          ),
          const Spacer(flex: 1),
          Padding(
            padding: Paddings.p32,
            child: _pageIndex == 2
                ? TextButton(
                    child: const Text('Get Started'),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context, SlideRightRoute(page: OnBoardScreen()));
                    },
                  )
                : TextButton(
                    child: const Text('Next'),
                    onPressed: () {
                      setState(() {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.fastOutSlowIn);
                      });
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
      width: _pageIndex == index ? 35 : 30,
      decoration: BoxDecoration(
        color: _pageIndex == index
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary.withOpacity(.3),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
