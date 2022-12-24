import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../homepage/homepage.dart';
import 'onboarding1.dart';
import 'onboarding2.dart';
import 'onboarding3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool onLastPage = false;
  //skip,next,done TextStyle()
  TextStyle footerTextStyle = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                onLastPage = (value == 2);
              });
            },
            children: const [
              OnboardingPage1(),
              OnboardingPage2(),
              OnboardingPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(2);
                  },
                  child: Text(
                    'skip',
                    style: footerTextStyle,
                  ),
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                ),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        child: Text(
                          'done',
                          style: footerTextStyle,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.bounceOut,
                          );
                        },
                        child: Text(
                          'next',
                          style: footerTextStyle,
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
