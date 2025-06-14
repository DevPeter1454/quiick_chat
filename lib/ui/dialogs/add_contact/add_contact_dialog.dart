import 'package:flutter/material.dart';

import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/common/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'add_contact_dialog_model.dart';

const double _graphicSize = 60;

class AddContactDialog extends StackedView<AddContactDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const AddContactDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget builder(
    BuildContext context,
    AddContactDialogModel viewModel,
    Widget? child,
  ) {
    final TextEditingController phoneController = TextEditingController();
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
                        style: AppTextstyles.bold(
                          size: 16.sp,
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
              controller: phoneController,
              hintText: "Phone Number",
              keyboardType: TextInputType.phone,
              style: AppTextstyles.mediumSemiBold
                  .copyWith(color: AppColors.kcBlackColor),
            ),
            verticalSpaceMedium,
            PAppButton(
                text: "Confirm",
                onTap: () {
                  if (phoneController.text.isNotEmpty) {
                    completer(DialogResponse(confirmed: true, data: {
                      "phone": phoneController.text,
                    }));
                  } else {}
                })
          ],
        ),
      ),
    );
  }

  @override
  AddContactDialogModel viewModelBuilder(BuildContext context) =>
      AddContactDialogModel();
}
