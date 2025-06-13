// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/add_contact/add_contact_dialog.dart';
import '../ui/dialogs/code_input/code_input_dialog.dart';
import '../ui/dialogs/file/file_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/number_confirmation/number_confirmation_dialog.dart';
import '../ui/dialogs/preview/preview_dialog.dart';

enum DialogType {
  infoAlert,
  numberConfirmation,
  codeInput,
  addContact,
  file,
  preview,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.numberConfirmation: (context, request, completer) =>
        NumberConfirmationDialog(request: request, completer: completer),
    DialogType.codeInput: (context, request, completer) =>
        CodeInputDialog(request: request, completer: completer),
    DialogType.addContact: (context, request, completer) =>
        AddContactDialog(request: request, completer: completer),
    DialogType.file: (context, request, completer) =>
        FileDialog(request: request, completer: completer),
    DialogType.preview: (context, request, completer) =>
        PreviewDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
