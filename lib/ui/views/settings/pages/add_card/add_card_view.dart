import 'package:flutter/material.dart';

import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/common/widgets/custom_text_field.dart';
import 'package:quiick_chat/ui/views/settings/pages/add_card/add_card_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'add_card_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'cardNumber'),
  FormTextField(name: 'expiryDate'),
  FormTextField(name: 'cvv'),
  FormTextField(name: 'walletPin'),
])
class AddCardView extends StatelessWidget with $AddCardView {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddCardViewModel>.reactive(
      viewModelBuilder: () => AddCardViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.kcWhiteColor,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 33.0, right: 33.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Add Card",
                    style: AppTextstyles.semiBold(
                        color: AppColors.kcPrimaryColor, size: 22.sp),
                  ),
                ),
                verticalSpace(21),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    color: AppColors.kcWhiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x113629B7),
                        blurRadius: 30,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Type your card number ',
                        style: AppTextstyles.semiBold(
                            color: const Color(0xFF979797), size: 12.sp),
                      ),
                      verticalSpace(16.h),
                      CustomTextField(
                        controller: cardNumberController,
                        focusNode: cardNumberFocusNode,
                        hintText: "",
                        keyboardType: TextInputType.phone,
                      ),
                      verticalSpace(10.h),
                      Text(
                        'Type your  expiry date  ',
                        style: AppTextstyles.semiBold(
                            color: const Color(0xFF979797), size: 12.sp),
                      ),
                      verticalSpace(16.h),
                      SizedBox(
                        width: 142,
                        child: CustomTextField(
                          controller: expiryDateController,
                          hintText: "",
                          focusNode: expiryDateFocusNode,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      verticalSpace(10.h),
                      Text(
                        'Type your  CVV   ',
                        style: AppTextstyles.semiBold(
                            color: const Color(0xFF979797), size: 12.sp),
                      ),
                      verticalSpace(16.h),
                      SizedBox(
                        width: 142,
                        child: CustomTextField(
                          controller: cvvController,
                          focusNode: cvvFocusNode,
                          hintText: "",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      verticalSpace(10.h),
                      Text(
                        'Create pin ',
                        style: AppTextstyles.semiBold(
                            color: const Color(0xFF979797), size: 12.sp),
                      ),
                      verticalSpace(16.h),
                      SizedBox(
                        width: 142,
                        child: CustomTextField(
                          controller: walletPinController,
                          focusNode: walletPinFocusNode,
                          hintText: "",
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(19.h),
                SizedBox(
                    width: 100.w, child: PAppButton(text: "Add", onTap: () {}))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
