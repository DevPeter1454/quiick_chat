import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:stacked/stacked.dart';

import 'bottom_nav_bar_viewmodel.dart';

class BottomNavBarView extends StackedView<BottomNavBarViewModel> {
  const BottomNavBarView({super.key});

  @override
  Widget builder(
    BuildContext context,
    BottomNavBarViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: viewModel.pages[viewModel.currentIndex],
      ),
      bottomNavigationBar: Container(
        height: 90.h,
        color: AppColors.kcWhiteColor,
        child: BottomNavigationBar(
          currentIndex: viewModel.currentIndex,
          type: BottomNavigationBarType.fixed,
          // fixedColor: AppColors.appWhite,
          showUnselectedLabels: true,
          selectedLabelStyle: AppTextstyles.regularFigtree(
              size: 12.94.sp, color: AppColors.kcPrimaryColor),
          unselectedFontSize: 12.94.sp,
          showSelectedLabels: true,
          unselectedItemColor: const Color(0xFF5E5F60),
          selectedItemColor: AppColors.kcPrimaryColor,
          onTap: viewModel.setIndex,
          backgroundColor: Colors.white,
          items: viewModel.pages.map((page) {
            var index = viewModel.pages.indexOf(page);
            return BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  viewModel.icons[index],
                  height: 24,
                ),
                label: viewModel.title[index],
                activeIcon: SvgPicture.asset(
                  viewModel.activeIcons[index],
                  color: AppColors.kcPrimaryColor,
                  height: 24,
                ));
          }).toList(),
        ),
      ),
    );
  }

  @override
  BottomNavBarViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BottomNavBarViewModel();

  @override
  void onViewModelReady(BottomNavBarViewModel viewModel) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.colorChat();
    });
  }
}
