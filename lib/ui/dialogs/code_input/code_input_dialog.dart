import 'package:flutter/material.dart';

import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/common/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'code_input_dialog_model.dart';

const double _graphicSize = 60;

class CodeInputDialog extends StackedView<CodeInputDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const CodeInputDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget builder(
    BuildContext context,
    CodeInputDialogModel viewModel,
    Widget? child,
  ) {
    final codeController = TextEditingController();
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.title ?? 'Hello Stacked Dialog!!',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      if (request.description != null) ...[
                        verticalSpaceTiny,
                        Text(
                          request.description!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: kcMediumGrey,
                          ),
                          maxLines: 3,
                          softWrap: true,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            verticalSpaceMedium,
            CustomTextField(
              controller: codeController,
              hintText: "Code",
              keyboardType: TextInputType.number,
              style: AppTextstyles.mediumSemiBold
                  .copyWith(color: AppColors.kcBlackColor),
            ),
            verticalSpaceSmall,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Resend Code",
                style: AppTextstyles.semiBold(
                    size: 16, color: AppColors.kcPrimaryColor),
              ).onTap(() {
                completer(DialogResponse(confirmed: true, data: {
                  "isResend": false,
                }));
              }),
            ),
            verticalSpaceSmall,
            PAppButton(
                text: "Confirm",
                onTap: () {
                  if (codeController.text.isNotEmpty) {
                    completer(DialogResponse(confirmed: true, data: {
                      "code": codeController.text,
                      "isResend": false,
                    }));
                  } else {
                    return;
                  }
                }),
          ],
        ),
      ),
    );
  }

  @override
  CodeInputDialogModel viewModelBuilder(BuildContext context) =>
      CodeInputDialogModel();
}
