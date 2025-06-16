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
            right: 21.0,
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
                      onPressed: () {}, // handle going back to previouss page
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
                  AppIcons.chatColor,
                  height: 20.25.h,
                  width: 11.94.w,
                ),
                title: Text(
                  "Chat color",
                  style: AppTextstyles.semiBold(
                      color: AppColors.kcBlackColor, size: 16.sp),
                ),
                trailing: SizedBox(
                  width: 50.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 20.25.h,
                        width: 20.25.w,
                        decoration: const BoxDecoration(
                            color: Colors.amberAccent, // needs to be updated
                            shape: BoxShape.circle),
                      ),
                      SvgPicture.asset(
                        AppIcons.arrowForwardIcon,
                        height: 11.25.h,
                        width: 11.94.w,
                        color: AppColors.kcBlackColor,
                      )
                    ],
                  ),
                ),
                onTap: () {},

                /// fuctionality aspect to be done here
              ),
              verticalSpace(7.h),
              ListTile(
                leading: SvgPicture.asset(
                  AppIcons.chatWallpaper,
                  height: 20.25.h,
                  width: 11.94.w,
                ),
                title: Text(
                  "New contact",
                  style: AppTextstyles.semiBold(
                      color: AppColors.kcBlackColor, size: 16.sp),
                ),
                trailing: SizedBox(
                  width: 50.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 20.25.h,
                        width: 11.94.w,
                        color: Colors.blue, // needs to be updated
                      ),
                      SvgPicture.asset(
                        AppIcons.arrowForwardIcon,
                        height: 11.25.h,
                        width: 11.94.w,
                        color: AppColors.kcBlackColor,
                      )
                    ],
                  ),
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
