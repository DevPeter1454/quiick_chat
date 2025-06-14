import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:stacked/stacked.dart';

import 'onboarding_language_viewmodel.dart';

class OnboardingLanguageView extends StatelessWidget {
  const OnboardingLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingLanguageViewModel>.reactive(
      viewModelBuilder: () => OnboardingLanguageViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.kcWhiteColor,
        body: Container(
          padding: const EdgeInsets.only(left: 21.0, right: 21.0),
          child: Column(
            children: [
              verticalSpace(70),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 18.sp,
                    color: AppColors.kcPrimaryColor,
                  ),
                  Text(
                    "Back",
                    style: AppTextstyles.semiBold(
                        size: 20, color: AppColors.kcPrimaryColor),
                  ),
                ],
              ).onTap(() {
                model.back();
              }),
              verticalSpace(31.h),
              Column(
                children: [
                  Text(
                    "Your Language",
                    style: AppTextstyles.semiBold(size: 26.sp),
                  ),
                  verticalSpace(11.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      horizontalSpace(43.w),
                      Text(
                        model.selectedCountry!.name,
                        style: AppTextstyles.semiBold(
                            size: 18, color: AppColors.kcPrimaryColor),
                      ),
                      horizontalSpace(7.w),
                      SvgPicture.asset(AppIcons.arrowDownIcon)
                    ],
                  ).onTap(() {
                    model.showCountries();
                  }),
                  verticalSpace(7.h),
                  Container(
                    width: 267,
                    height: 54,
                    decoration: ShapeDecoration(
                      color: const Color(0x3800B456),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      model.selectedCountry!.languages.first,
                      style: AppTextstyles.semiBold(size: 16.sp),
                    )),
                  ),
                  verticalSpace(31.h),
                  SizedBox(
                    width: 212,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'By continuing, you agree to our ',
                              style: AppTextstyles.medium),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: AppTextstyles.medium.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: AppTextstyles.medium,
                          ),
                          TextSpan(
                            text: 'Terms of Service.',
                            style: AppTextstyles.medium.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalSpace(122),
                  Padding(
                      // width: 75.w,
                      padding: const EdgeInsets.symmetric(horizontal: 72),
                      child: PAppButton(text: "Confirm", onTap: model.next))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
