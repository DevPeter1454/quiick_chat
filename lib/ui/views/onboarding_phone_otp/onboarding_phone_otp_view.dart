import 'package:flutter/material.dart';

import 'package:quiick_chat/shared/export.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/common/widgets/custom_text_field.dart';
import 'package:quiick_chat/ui/views/onboarding_phone_otp/onboarding_phone_otp_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'onboarding_phone_otp_viewmodel.dart';

@FormView(
    fields: [FormTextField(name: "code", validator: Validator.validateOTP)])
class OnboardingPhoneOtpView extends StatelessWidget
    with $OnboardingPhoneOtpView {
  const OnboardingPhoneOtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingPhoneOtpViewModel>.reactive(
      viewModelBuilder: () => OnboardingPhoneOtpViewModel(),
      onViewModelReady: (viewModel) {
        syncFormWithViewModel(viewModel);
      },
      onDispose: (viewModel) {
        // codeController.dispose();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.kcWhiteColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 21.0, right: 21.0),
          child: SingleChildScrollView(
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
                verticalSpace(27.h),
                Container(
                  width: double.infinity,
                  // height: 302,
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    color: AppColors.kcWhiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x113629B7),
                        blurRadius: 30,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Type a code',
                        style: AppTextstyles.semiBold(
                            color: const Color(0xFF979797), size: 12.sp),
                      ),
                      verticalSpace(16.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                                controller: codeController,
                                hintText: "Code",
                                keyboardType: TextInputType.number,
                                style: AppTextstyles.mediumSemiBold
                                    .copyWith(color: AppColors.kcBlackColor)),
                          ),
                          horizontalSpace(12.w),
                          PAppButton(
                            text: "Resend",
                            onTap: model.resendOtp,
                            shape: ABShape.mediumRounded,
                          )
                        ],
                      ),
                      verticalSpace(24.h),
                      Text(
                        'We texted you a code to verify your Phone',
                        style: AppTextstyles.regular(
                                color: const Color(0xFF898989))
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      verticalSpace(31.h),
                      Text(
                        "This code will expired 10 minutes after this message. If you don't get a message.",
                        textAlign: TextAlign.left,
                        style: AppTextstyles.regular(
                                color: const Color(0xFF898989))
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      verticalSpace(24.h),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.w),
                          child: PAppButton(
                              text: "Continue", onTap: model.verifyPhoneNumber))
                    ],
                  ),
                ),
                verticalSpace(98.h),
                Text(
                  'Change your phone number',
                  style:
                      AppTextstyles.semiBold(color: AppColors.kcPrimaryColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
