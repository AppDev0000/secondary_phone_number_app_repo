import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:secondary_phone_number_app/src/features/authentication/controllers/on_boarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final onBoardingController = OnBoardingController();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Liquid swipe button on the left of screen
          LiquidSwipe(
            pages: onBoardingController.pages,
            liquidController: onBoardingController.liquidController,
            onPageChangeCallback: onBoardingController.onPageChangedCallback,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),

          // Next onBoarding page button
          Positioned(
            bottom: 60,
            child: OutlinedButton(
              onPressed: () => onBoardingController.animateToNextSlide(),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Skip button on the top left corner of onBoarding pages
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => onBoardingController.skip(),
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
          ),

          // Smooth onBoarding pages indicator
          Obx(
                () => Positioned(
              bottom: 30,
              child: AnimatedSmoothIndicator(
                activeIndex: onBoardingController.currentPage.value,
                count: 3,
                effect: const WormEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Color(0xFF272727),
                  dotHeight: 6,
                  dotWidth: 6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}