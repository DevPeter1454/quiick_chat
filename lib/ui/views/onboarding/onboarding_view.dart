import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:stacked/stacked.dart';

import 'onboarding_viewmodel.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    FlutterCarouselController carouselController = FlutterCarouselController();
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      viewModelBuilder: () => OnboardingViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.kcWhiteColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 17.0, right: 18.0),
            child: ListView(
              children: [
                // verticalSpace(70),
                verticalSpace(18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Skip",
                      style: AppTextstyles.semiBold(
                          size: 20, color: AppColors.kcPrimaryColor),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18.sp,
                      color: AppColors.kcPrimaryColor,
                    )
                  ],
                ).onTap(() {
                  model.navigateToOnboardingPhone();
                }),
                verticalSpace(19),
                FlutterCarousel(
                    items: [0, 1, 2].map((i) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            model.onboardingImages[i],
                            height: 357,
                          ),
                          verticalSpace(27),
                          DotsIndicator(
                              dotsCount: 3,
                              position: i.toDouble(),
                              animate: true,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              decorator: DotsDecorator(
                                activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                color: AppColors.kcDotIndicatorColor,
                                activeSize: const Size(24, 8),
                                activeColor: AppColors.kcPrimaryColor,
                              )),
                          verticalSpace(40),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: screenWidth(context) * 0.65,
                              child: Column(
                                children: [
                                  Text(
                                    model.onboardingTitles[i],
                                    textAlign: TextAlign.center,
                                    style: AppTextstyles.semiBold(size: 22),
                                  ),
                                  verticalSpace(10),
                                  Text(model.onboardingSubtitles[i],
                                      textAlign: TextAlign.center,
                                      style: AppTextstyles.regular(size: 15)),
                                  verticalSpace(28),
                                  CircleAvatar(
                                    radius: 32.r,
                                    backgroundColor: AppColors.kcPrimaryColor,
                                    child: SvgPicture.asset(
                                      AppIcons.arrowForwardIcon,
                                      height: 20.25.h,
                                      width: 11.94.w,
                                    ),
                                  ).onTap(() {
                                    if (i != 2 && model.currentIndex != 2) {
                                      carouselController.nextPage();
                                    } else {
                                      model.navigateToOnboardingPhone();
                                    }
                                  })
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }).toList(),
                    options: FlutterCarouselOptions(
                      showIndicator: false,
                      controller: carouselController,
                      onPageChanged: (value, reason) => model.setIndex(value),
                      autoPlay: true,
                      onScrolled: (value) {
                        // model.setIndex(int.parse(value.toString()));
                      },
                      pauseAutoPlayOnManualNavigate: false,

                      height: screenHeight(context),
                      // enlargeCenterPage: true,
                      viewportFraction: 1,
                      autoPlayCurve: Curves.easeInOut,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayInterval: const Duration(milliseconds: 3000),
                    )),
                // verticalSpace(50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
