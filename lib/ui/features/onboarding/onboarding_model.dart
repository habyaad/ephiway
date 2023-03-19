import 'package:onboarding/onboarding.dart';

import 'onboarding_page_model.dart';

class OnboardingModel {
  static final onboardingPagesList = [
    PageModel(
        widget: const OnBoardingPageModel(
      imageName: 'onboarding1',
      onBoardingBodyText:
          'Organise your school activities.\nHave your school data in your pocket',
    )),
    PageModel(
        widget: const OnBoardingPageModel(
      imageName: 'onboarding2',
      onBoardingBodyText:
          'School data management with ease.\nSchool data computation now seamless.',
    )),
  ];
}
