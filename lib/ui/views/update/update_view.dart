import 'package:flutter/material.dart';

import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/common/widgets/custom_text_field.dart';
import 'package:quiick_chat/ui/views/update/update_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'update_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'search'),
])
class UpdateView extends StatelessWidget with $UpdateView {
  const UpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UpdateViewModel>.reactive(
      viewModelBuilder: () => UpdateViewModel(),
      onViewModelReady: (viewModel) => syncFormWithViewModel(viewModel),
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
                    const Spacer(),
                    Text(
                      "Updates",
                      style: AppTextstyles.semiBold(
                          color: AppColors.kcPrimaryColor, size: 22.sp),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.add,
                      color: AppColors.kcPrimaryColor,
                    )
                  ],
                ),
              ),
              verticalSpace(17.h),
              Padding(
                  padding: EdgeInsets.only(left: 9.w, right: 30.w),
                  child: CustomTextField(
                    controller: searchController,
                    hintText: 'Search',
                    keyboardType: TextInputType.text,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
