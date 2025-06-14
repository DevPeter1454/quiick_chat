import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:quiick_chat/shared/export.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/common/widgets/custom_text_field.dart';
import 'package:quiick_chat/ui/views/onboarding_phone/onboarding_phone_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'onboarding_phone_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'phoneNumber', validator: Validator.validatePhoneNumber),
])
class OnboardingPhoneView extends StatelessWidget with $OnboardingPhoneView {
  const OnboardingPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingPhoneViewModel>.reactive(
      viewModelBuilder: () => OnboardingPhoneViewModel(),
      onViewModelReady: (viewModel) => syncFormWithViewModel(viewModel),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.kcWhiteColor,
        body: Padding(
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
                    "Your Phone",
                    style: AppTextstyles.semiBold(size: 26.sp),
                  ),
                  verticalSpace(15.h),
                  SizedBox(
                    width: 212.w,
                    child: Text(
                      "Select your country and enter your phone number to get started. We’ll send you a verification code for secure access.",
                      style: AppTextstyles.small,
                      textAlign: TextAlign.center,
                    ),
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
                  Row(
                    children: [
                      horizontalSpace(43.w),
                      Container(
                        // height: 54.h,
                        width: 76.w,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.kcBlackColor,
                          borderRadius: BorderRadius.circular(17.r),
                        ),
                        child: Center(
                          child: Text(
                            model.selectedCountry!.dialCode,
                            style: AppTextstyles.semiBold(
                                size: 16.51.sp, color: AppColors.kcWhiteColor),
                          ),
                        ),
                      ),
                      horizontalSpace(17.w),
                      Expanded(
                        child: SizedBox(
                          // height: 54.h, // Set the same height as the container
                          child: CustomTextField(
                            controller: phoneNumberController,
                            hintText: "Phone Number",
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ),
                      horizontalSpace(43.w),
                    ],
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
                  verticalSpace(35),
                  Padding(
                      // width: 75.w,
                      padding: const EdgeInsets.symmetric(horizontal: 72),
                      child: PAppButton(
                          text: "Confirm",
                          onTap: model.showNumberConfirmationDialog))
                ],
              )
            ],
          ),
        ),
      ).onTap(() {
        FocusScope.of(context).unfocus();
      }),
    );
  }
}
