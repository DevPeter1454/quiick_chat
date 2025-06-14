import 'package:flutter/material.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/common/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

import 'contact_viewmodel.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactViewModel>.reactive(
      viewModelBuilder: () => ContactViewModel(),
      builder: (context, model, child) => Scaffold(
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
                    Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.kcPrimaryColor,
                    ),
                    const Spacer(),
                    Text(
                      "Contacts",
                      style: AppTextstyles.semiBold(
                          color: AppColors.kcPrimaryColor, size: 22.sp),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              // verticalSpace(17.h),
              // Padding(
              //     padding: EdgeInsets.only(left: 9.w, right: 30.w),
              //     child: CustomTextField(
              //       controller: searchController,
              //       hintText: 'Search',
              //       keyboardType: TextInputType.text,
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
