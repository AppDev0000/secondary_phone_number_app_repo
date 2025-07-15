import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:secondary_phone_number_app/src/constants/color_strings.dart';
import 'package:secondary_phone_number_app/src/constants/images_strings.dart';
import 'package:secondary_phone_number_app/src/constants/text_strings.dart';
import 'package:secondary_phone_number_app/src/features/authentication/models/on_boarding_model.dart';
import 'package:secondary_phone_number_app/src/features/authentication/screens/on_boarding_screens/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final liquidController = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage1,
        title: tOnBoardingTitle1,
        subTitle: tOnBoardingSubTitle1,
        counterText: tOnBoardingCounter1,
        backGroundColor: tOnBoardingPage1Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage2,
        title: tOnBoardingTitle2,
        subTitle: tOnBoardingSubTitle2,
        counterText: tOnBoardingCounter2,
        backGroundColor: tOnBoardingPage2Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage3,
        title: tOnBoardingTitle3,
        subTitle: tOnBoardingSubTitle3,
        counterText: tOnBoardingCounter3,
        backGroundColor: tOnBoardingPage3Color,
      ),
    ),
  ];

  void onPageChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  void skip() {
    liquidController.jumpToPage(page: 2);
  }

  void animateToNextSlide() {
    int nextPage = liquidController.currentPage + 1;
    liquidController.animateToPage(page: nextPage);
  }
}