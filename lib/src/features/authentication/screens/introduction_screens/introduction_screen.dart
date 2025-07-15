import 'package:flutter/material.dart';
import 'package:secondary_phone_number_app/src/features/authentication/screens/introduction_screens/introduction_pages/introduction_page_1.dart';
import 'package:secondary_phone_number_app/src/features/authentication/screens/introduction_screens/introduction_pages/introduction_page_2.dart';
import 'package:secondary_phone_number_app/src/features/authentication/screens/introduction_screens/introduction_pages/introduction_page_3.dart';
import 'package:secondary_phone_number_app/src/features/authentication/screens/registration_screen/registration_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  // Page controller to keep track of which page we're on
  final PageController _controller = PageController();

  // Last page indicator to keep track of last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Introduction swipeable pages
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroductionPage1(),
              IntroductionPage2(),
              IntroductionPage3(),
            ],
          ),
          Container(
            alignment: Alignment(0.0, 0.80), // x=0 => center y=0.80 => bottom
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Skip button
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2); // jumping to last page
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade200,
                    ),
                  ),
                ),

                // Smooth page indicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(
                    dotColor: Colors.green.shade600,
                    activeDotColor: Colors.green.shade100,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),

                onLastPage
                    // Register button
                    ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RegistrationScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                          "Done",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade200,
                        ),
                      ),
                    )

                    // Next button
                    : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade200,
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
