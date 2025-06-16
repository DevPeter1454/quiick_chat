import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:stacked/stacked.dart';

import 'chat_wallpaper_viewmodel.dart';

class ChatWallpaperView extends StackedView<ChatWallpaperViewModel> {
  const ChatWallpaperView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ChatWallpaperViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Container(
          padding: const EdgeInsets.only(
            left: 21.0,
          ),
          child: ListView(
            children: [
              verticalSpace(20.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 35.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.kcPrimaryColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Chat Wallpaper",
                      style: AppTextstyles.semiBold(
                          color: AppColors.kcPrimaryColor, size: 22.sp),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              verticalSpace(17.h),
              ListTile(
                leading: SvgPicture.asset(
                  AppIcons.groupIcon,
                  height: 20.25.h,
                  width: 11.94.w,
                ),
                title: Text(
                  "Create groups",
                  style: AppTextstyles.semiBold(
                      color: AppColors.kcPrimaryColor, size: 16.sp),
                ),
                onTap: () {},

                /// fuctionality aspect to be done here
              ),
              ListTile(
                leading: SvgPicture.asset(
                  AppIcons.newContacts,
                  height: 20.25.h,
                  width: 11.94.w,
                ),
                title: Text(
                  "New contacts",
                  style: AppTextstyles.semiBold(
                      color: AppColors.kcPrimaryColor, size: 16.sp),
                ),
                onTap: () {},

                /// fuctionality aspect to be done here
              )
            ],
          ),
        ));
  }

  @override
  ChatWallpaperViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatWallpaperViewModel();
}
