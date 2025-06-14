import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:quiick_chat/shared/export.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/common/widgets/custom_text_field.dart';
import 'package:quiick_chat/ui/views/onboarding_almost_done/onboarding_almost_done_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'onboarding_almost_done_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'userName', validator: Validator.validateUsername),
])
class OnboardingAlmostDoneView extends StatelessWidget
    with $OnboardingAlmostDoneView {
  const OnboardingAlmostDoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingAlmostDoneViewModel>.reactive(
      viewModelBuilder: () => OnboardingAlmostDoneViewModel(),
      onViewModelReady: (viewModel) => syncFormWithViewModel(viewModel),
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
                verticalSpace(21.h),
                Column(
                  children: [
                    Text(
                      "Almost done",
                      style: AppTextstyles.semiBold(size: 26.sp),
                    ),
                    verticalSpace(15.h),
                    SizedBox(
                      width: 212.w,
                      child: Text(
                          "Kindly provide your name \nand optional picture to continue",
                          textAlign: TextAlign.center,
                          style: AppTextstyles.small),
                    ),
                    verticalSpace(19.h),
                    Stack(
                      alignment: Alignment.center, // Center the child
                      children: [
                        Positioned(
                          bottom: 0.h,
                          right: 20,
                          child: GestureDetector(
                            onTap: model.selectImage,
                            child: CircleAvatar(
                              backgroundColor: AppColors.kcPrimaryColor,
                              radius: 16.r,
                              child: SvgPicture.asset(
                                AppIcons.editIcon,
                                width: 37.w,
                                height: 37.h,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 133.h,
                          width: 133.w,
                          decoration: ShapeDecoration(
                            // Use DecorationImage if an image is selected
                            image: model.selectedImage != null
                                ? DecorationImage(
                                    image: FileImage(model.selectedImage!),
                                    fit: BoxFit
                                        .cover, // Cover the container area
                                  )
                                : null, // No image if null
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 1,
                                color: AppColors.kcPrimaryColor,
                              ),
                            ),
                          ),
                          // Optionally, add a placeholder icon if no image is selected
                          child: model.selectedImage == null
                              ? Icon(
                                  Icons.person, // Placeholder icon
                                  size: 60.sp,
                                  color:
                                      AppColors.kcPrimaryColor.withOpacity(0.5),
                                )
                              : null, // No child if image is displayed via decoration
                        ),
                        Positioned(
                          bottom: 0.h,
                          right: 20,
                          child: GestureDetector(
                            onTap: model.selectImage,
                            child: CircleAvatar(
                              backgroundColor: AppColors.kcPrimaryColor,
                              radius: 16.r,
                              child: SvgPicture.asset(
                                AppIcons.editIcon,
                                width: 16.w, // Adjusted size for clarity
                                height: 16.h, // Adjusted size for clarity
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(34),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 52),
                        child: CustomTextField(
                          controller: userNameController,
                          hintText: "Enter your username",
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                        )),
                    verticalSpace(34.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 61.w),
                      child: PAppButton(
                        text: "Continue",
                        onTap: model.updateUserProfile,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
