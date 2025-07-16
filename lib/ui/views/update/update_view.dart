import 'package:flutter/material.dart';

import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/common/widgets/custom_text_field.dart';
import 'package:quiick_chat/ui/views/update/update_view.form.dart';
import 'package:quiick_chat/ui/widgets/common/status_dashs.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'update_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'search'),
])
class UpdateView extends StatelessWidget with $UpdateView {
  const UpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UpdateViewModel>.reactive(
      viewModelBuilder: () => UpdateViewModel(),
      onViewModelReady: (viewModel) => syncFormWithViewModel(viewModel),
      builder: (context, model, child) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 21.0, right: 21.0),
          child: ListView(
            children: [
              verticalSpace(20.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
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
                  padding: EdgeInsets.only(left: 9.w, right: 9.w),
                  child: CustomTextField(
                    controller: searchController,
                    hintText: 'Search',
                    keyboardType: TextInputType.text,
                  )),
              verticalSpace(8.h),
              Padding(
                padding: EdgeInsets.only(left: 9.w, right: 9.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "  Status",
                      style: AppTextstyles.semiBold(
                          color: AppColors.kcBlackColor, size: 16.sp),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        color: AppColors.kcBlackColor,
                      ),
                    )
                  ],
                ),
              ),
              verticalSpace(8.h),
              SizedBox(
                height: 90.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 9.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(2.w),
                              child: CustomPaint(
                                painter: StatusDashs(),
                                child: Padding(
                                  padding: EdgeInsets.all(3.w),
                                  child: Container(
                                    height: 62.w,
                                    width: 62.w,
                                    decoration: const BoxDecoration(
                                      color: Colors.amber,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Text('data'),
                          ],
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
