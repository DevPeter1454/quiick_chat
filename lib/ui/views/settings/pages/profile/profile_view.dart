import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiick_chat/shared/export.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/common/widgets/custom_text_field.dart';
import 'package:quiick_chat/ui/views/settings/pages/profile/profile_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'profile_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: "userName", validator: Validator.validateUsername),
  FormTextField(name: "phoneNumber", validator: Validator.validatePhoneNumber),
])
class ProfileView extends StatelessWidget with $ProfileView {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      onViewModelReady: (viewModel) {
        syncFormWithViewModel(viewModel);
        viewModel.setDataFromLocalStorage();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.kcWhiteColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.arrowBackIcon,
                        height: 33,
                      ).onTap(() {
                        model.back();
                      }),
                      const Spacer(),
                      Text(
                        "Profile",
                        style: AppTextstyles.semiBold(
                            color: AppColors.kcPrimaryColor, size: 22.sp),
                      ),
                      const Spacer(),
                    ],
                  ),
                  verticalSpace(41),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        " Kindly provide your name \nand optional picture to continue.",
                        textAlign: TextAlign.center,
                        style: AppTextstyles.medium,
                      ),
                      verticalSpace(21),
                      Stack(
                        children: [
                          Container(
                            height: 133,
                            width: 133,
                            decoration: ShapeDecoration(
                              image: model.profilePictureUrl.isEmpty
                                  ? null
                                  : DecorationImage(
                                      image:
                                          NetworkImage(model.profilePictureUrl),
                                      onError: (exception, stackTrace) {
                                        // logger.e('Failed to load profile image: $exception');
                                      },
                                      fit: BoxFit.cover,
                                    ),
                              shape: const OvalBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: Color(0xFF00B456),
                                ),
                              ),
                            ),
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
                                  width: 37.w,
                                  height: 37.h,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(24),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 52),
                          child: CustomTextField(
                            controller: userNameController,
                            hintText: "Enter your username",
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                          )),
                      verticalSpace(35),
                    ],
                  ),
                  Text(
                    'Phone number',
                    style: AppTextstyles.regular(),
                  ),
                  verticalSpace(9),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 8.70,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: CustomTextField(
                      controller: phoneNumberController,
                      focusNode: phoneNumberFocusNode,
                      hintText: "",
                      keyboardType: TextInputType.phone,
                      filled: false,
                    ),
                  ),
                  verticalSpace(16),
                  Text(
                    'Address',
                    style: AppTextstyles.regular(),
                  ),
                  verticalSpace(9),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 8.70,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: CustomTextField(
                      controller: phoneNumberController,
                      focusNode: phoneNumberFocusNode,
                      hintText: "",
                      keyboardType: TextInputType.phone,
                      filled: false,
                    ),
                  ),
                  verticalSpace(16),
                  Text(
                    'Bio',
                    style: AppTextstyles.regular(),
                  ),
                  verticalSpace(9),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 8.70,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: CustomTextField(
                      controller: phoneNumberController,
                      focusNode: phoneNumberFocusNode,
                      hintText: "",
                      keyboardType: TextInputType.phone,
                      filled: false,
                    ),
                  ),
                  verticalSpace(40),
                  PAppButton(
                      text: "Save",
                      onTap: () {
                        model.updateUserProfile(fromPicture: false);
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
