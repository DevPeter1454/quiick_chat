import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/common/widgets/settings_row_item.dart';
import 'package:stacked/stacked.dart';

import 'privacy_viewmodel.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PrivacyViewModel>.reactive(
      viewModelBuilder: () => PrivacyViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.kcWhiteColor,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 33.0, right: 33.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.kcPrimaryColor,
                    ).onTap(() {
                      model.back();
                    }),
                    const Spacer(),
                    Text(
                      "Privacy",
                      style: AppTextstyles.semiBold(
                          color: AppColors.kcPrimaryColor, size: 22.sp),
                    ),
                    const Spacer()
                  ],
                ),
                verticalSpace(37.h),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.privacyItems.length,
                    itemBuilder: (context, index) => SettingsRowItem(
                          // fontSize: 16,
                          title: model.privacyItems[index]["title"],
                          value: model.privacyItems[index]["subtitle"],
                          onTap: () {},
                        )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Chat Lock",
                      style: AppTextstyles.mainMedium(size: 18),
                    ),
                    CupertinoSwitch(
                        value: model.isChatLockActivated,
                        onChanged: (value) => model.toggleChatLock(value))
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
