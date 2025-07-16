import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:stacked/stacked.dart';

import 'chat_color_viewmodel.dart';

class ChatColorView extends StackedView<ChatColorViewModel> {
  const ChatColorView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ChatColorViewModel viewModel,
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
                    onPressed: () {
                      viewModel.back();
                    }, // handle going back to previouss page
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.kcPrimaryColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Chat Color",
                    style: AppTextstyles.semiBold(
                        color: AppColors.kcPrimaryColor, size: 22.sp),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            verticalSpace(17.h),
            // Color pallet space
            Container(
              width: 400.w,
              height: 600.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 210, 210, 210),
                      blurRadius: 2,
                      spreadRadius: 3,
                      offset: Offset(2, 2),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ColorPicker(
                    colorPickerWidth: 300.w,
                    pickerColor: viewModel.pickerColor,
                    onColorChanged: viewModel.changeColor,
                  ),
                  SizedBox(
                    width: 300.w,
                    height: 100.h,
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 7),
                        itemCount: viewModel.recentSavedColors.length,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () => viewModel.updateColorPick(
                                  Color(int.parse(
                                      '0x${viewModel.recentSavedColors[index]}')),
                                  index),
                              child: viewModel.colorPressed[index]
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color: Color(int.parse(
                                              '0x${viewModel.recentSavedColors[index]}')), // needs to be updated
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: AppColors.kcBlackColor,
                                              width: 4)),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        color: Color(int.parse(
                                            '0x${viewModel.recentSavedColors[index]}')), // needs to be updated
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                            ),
                          );
                        }),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      viewModel
                          .updateChatColor(viewModel.pickerColor.toHexString());
                      viewModel
                          .toSaveColors(viewModel.pickerColor.toHexString());
                      viewModel.back();
                    },
                    child: const Text('Save'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ChatColorViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatColorViewModel();

  @override
  void onViewModelReady(ChatColorViewModel viewModel) =>
      SchedulerBinding.instance
          .addPostFrameCallback((timeStamp) => viewModel.savedColors());
}
