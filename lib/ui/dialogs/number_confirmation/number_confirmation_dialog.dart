import 'package:flutter/material.dart';

import 'package:quiick_chat/ui/common/export.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'number_confirmation_dialog_model.dart';

const double _graphicSize = 60;

class NumberConfirmationDialog
    extends StackedView<NumberConfirmationDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const NumberConfirmationDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NumberConfirmationDialogModel viewModel,
    Widget? child,
  ) {
    return Blur(
      blur: 2,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(49.w, 34.h, 49.w, 9.69.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${request.data}",
                style: AppTextstyles.semiBold(
                    size: 21.33.sp, color: AppColors.kcPrimaryColor),
              ),
              verticalSpace(14),
              Text(
                "Kindly confirm this number",
                style: AppTextstyles.small,
              ),
              verticalSpace(24),
              Padding(
                padding: const EdgeInsets.only(left: 53.0, right: 53.0),
                child: PAppButton(
                  text: "Edit",
                  onTap: () => completer(DialogResponse(confirmed: false)),
                  style: ABStyle.outline,
                ),
              ),
              verticalSpace(8),
              PAppButton(
                  text: "Continue",
                  onTap: () {
                    completer(DialogResponse(confirmed: true));
                  })
            ],
          ),
        ),
      ),
    );
  }

  @override
  NumberConfirmationDialogModel viewModelBuilder(BuildContext context) =>
      NumberConfirmationDialogModel();
}
