import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

import '../../../utils/responsive_size_units.dart';

class OnBoardingPageModel extends StatelessWidget {
  const OnBoardingPageModel(
      {Key? key, required this.imageName, required this.onBoardingBodyText})
      : super(key: key);
  final String imageName;
  final String onBoardingBodyText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: background,
        border: Border.all(
          width: 0.0,
          color: background,
        ),
      ),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              height: heightSizer(500, context),
              padding: EdgeInsets.symmetric(
                horizontal: widthSizer(45, context),
                vertical: heightSizer(90, context),
              ),
              child: Image.asset('assets/images/$imageName.png',),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'EPHIWAY',
                  style: pageTitleStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widthSizer(45, context),
                  vertical: heightSizer(90, context)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  onBoardingBodyText,
                  style: pageInfoStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
