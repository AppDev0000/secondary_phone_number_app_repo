import 'package:flutter/material.dart';
import 'package:secondary_phone_number_app/src/features/authentication/models/on_boarding_model.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(30.0),
      color: model.backGroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height / 2,
          ),
          Column(
            children: [
              Text(
                model.title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                model.subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Text(model.counterText),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}