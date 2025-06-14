import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:quiick_chat/ui/common/export.dart';
import 'package:stacked/stacked.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      onViewModelReady: (viewModel) {
        viewModel.setUserName();
      },
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Container(
              padding: const EdgeInsets.only(
                left: 21.0,
              ),
              child: Column(
                children: [
                  Text(
                    "Chats",
                    style: AppTextstyles.semiBold(
                        color: AppColors.kcPrimaryColor, size: 22.sp),
                  ),
                  verticalSpace(16.h),
                  Expanded(
                    child: ListView.builder(
                        itemCount: model.settings.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            _buildSettingItemWidget(
                                title: model.settings[index],
                                iconPath: model.settingsIcons[index],
                                onTap: () => model.navigateTo(index))),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget _buildSettingItemWidget(
      {required String title,
      required String iconPath,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        onTap: onTap,
        title: Text(title),
        titleTextStyle: AppTextstyles.medium.copyWith(
          fontSize: 18.sp,
          color: AppColors.kcBlackColor,
          fontFamily: "Poppins-Medium",
        ),
        leading: CircleAvatar(
          backgroundColor: AppColors.kcPrimaryColor,
          child: SvgPicture.asset(iconPath),
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(right: 31.0),
          child: SvgPicture.asset(
            AppIcons.arrowForwardIcon,
            height: 12,
            color: AppColors.kcPrimaryColor,
          ),
        ),
      ),
    );
  }
}
