import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:stacked/stacked.dart';

import 'call_viewmodel.dart';

class CallView extends StatelessWidget {
  const CallView({super.key});

  //  create the form

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CallViewModel>.reactive(
      viewModelBuilder: () => CallViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 21.0, right: 21.0),
          child: ListView(
            children: [
              verticalSpace(20.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 35.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {}, // contact functionality
                        icon: SvgPicture.asset(
                          AppIcons.dialPad,
                          height: 16.h,
                          width: 16.w,
                        )),
                    const Spacer(),
                    Text(
                      "Calls",
                      style: AppTextstyles.semiBold(
                          color: AppColors.kcPrimaryColor, size: 22.sp),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {}, // contact functionality
                      icon: Icon(
                        Icons.add,
                        color: AppColors.kcPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(17.h),

              /// space for contact search widget................................................................
              // Padding(
              //     padding: EdgeInsets.only(left: 9.w, right: 30.w),
              //     child: CustomTextField(
              //       controller: contactController,
              //       hintText: 'Search',
              //       keyboardType: TextInputType.text,
              //     )),
              // contact search widget end...................................................
              SizedBox(
                width: 350.w,
                height: 600.h,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ListTile(
                        // add user image
                        leading: Container(
                          height: 32.w,
                          width: 32.w,
                          decoration: const BoxDecoration(
                            color: Colors.black45,
                            shape: BoxShape.circle,
                          ),
                        ),
                        // displays username and call status
                        title: Text(
                          "James Bond",
                          style: AppTextstyles.semiBold(
                              color: AppColors.kcBlackColor, size: 14.sp),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            const Icon(Icons.call_missed),
                            Text(
                              "Missed call",
                              style: AppTextstyles.regular(
                                  color: AppColors.kcBlackColor, size: 12.sp),
                            )
                          ],
                        ),
                        // displays user options to video or audio call
                        trailing: SizedBox(
                          width: 70.w,
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add_call),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.video_call),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
