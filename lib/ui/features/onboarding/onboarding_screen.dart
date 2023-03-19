import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late Material materialButton;

  late int index;

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = OnboardingModel.onboardingPagesList.length-1;
            setIndex(OnboardingModel.onboardingPagesList.length-1);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          context.router.replaceNamed("/signup-screen");
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign up',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Onboarding(
            pages: OnboardingModel.onboardingPagesList,
            onPageChange: (int pageIndex) {
              index = pageIndex;
            },
            startPageIndex: 0,
            footerBuilder: (context, dragDistance, pagesLength, setIndex) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: background,
                  border: Border.all(
                    width: 0.0,
                    color: background,
                  ),
                ),
                child: ColoredBox(
                  color: background,
                  child: Padding(
                    padding: const EdgeInsets.all(45.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIndicator(
                          netDragPercent: dragDistance,
                          pagesLength: pagesLength,
                          indicator: Indicator(
                            indicatorDesign: IndicatorDesign.line(
                              lineDesign: LineDesign(
                                lineType: DesignType.line_uniform,
                              ),
                            ),
                          ),
                        ),
                        index == pagesLength - 1
                            ? _signupButton
                            : _skipButton(setIndex: setIndex)
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
