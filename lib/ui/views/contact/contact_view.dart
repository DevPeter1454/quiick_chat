import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiick_chat/ui/common/export.dart';
// <<<<<<< HEAD
// =======
import 'package:quiick_chat/ui/common/widgets/custom_text_field.dart';
import 'package:quiick_chat/ui/views/contact/contact_view.form.dart';
//>>>>>>> d90f4c12e5841e7c62769de9da7e8b6861b6eca7/
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'contact_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'contact',
  )
])
class ContactView extends StatelessWidget with $ContactView {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactViewModel>.reactive(
      onViewModelReady: (model) => syncFormWithViewModel(model),
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
                      "Contact",
                      style: AppTextstyles.semiBold(
                          color: AppColors.kcPrimaryColor, size: 22.sp),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              verticalSpace(17.h),

              /// space for contact search widget................................................................
              Padding(
                  padding: EdgeInsets.only(left: 9.w, right: 30.w),
                  child: CustomTextField(
                    controller: contactController,
                    hintText: 'Search',
                    keyboardType: TextInputType.text,
                  )),
              // contact search widget end...................................................
              ListTile(
                leading: SvgPicture.asset(
                  AppIcons.groupIcon,
                  height: 20.25.h,
                  width: 11.94.w,
                ),
                title: Text(
                  "Create group",
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
                  "New contact",
                  style: AppTextstyles.semiBold(
                      color: AppColors.kcPrimaryColor, size: 16.sp),
                ),
                onTap: () {},

                /// fuctionality aspect to be done here
              )
            ],
          ),
        ),
      ),
    );
  }
}
