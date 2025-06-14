import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor:
            AppColors.kcWhiteColor, // Use white color from Figma (#FFFFFF)
        body: SafeArea(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Quiick Login',
                    style: AppTextstyles.semiBold(
                        size: 22, color: AppColors.kcPrimaryColor),
                  ),
                  verticalSpace(51), // Use helper for spacing
                  Text(
                    'Kindly login using your face id',
                    textAlign: TextAlign.center,
                    style: AppTextstyles.small,
                  ),
                  verticalSpace(172.h),
                  SvgPicture.asset(
                      Platform.isIOS ? AppSvgs.face : AppSvgs.fingerprint),
                  // Use helper for spacing
                  const Spacer(),
                  SizedBox(
                    width: 193.w,
                    child: model.isBusy
                        ? SpinKitCircle(
                            itemBuilder: (context, index) => CircleAvatar(
                              backgroundColor: AppColors.kcPrimaryColor,
                            ),
                          )
                        : PAppButton(
                            text: "Login", onTap: () {}), //model.loginIntoAgora
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
