import 'package:onboarding/onboarding.dart';

import 'onboarding_page_model.dart';

class OnboardingModel {
  static final onboardingPagesList = [
    PageModel(
        widget: const OnBoardingPageModel(
      imageName: 'onboarding1',
      onBoardingBodyText:
          'Organise your school activities.\nSchool data maagement with ease',
    )),
    PageModel(
        widget: const OnBoardingPageModel(
      imageName: 'onboarding2',
      onBoardingBodyText:
          'Organise your school activities.\nSchool data maagement with ease',
    )),
  ];
}
