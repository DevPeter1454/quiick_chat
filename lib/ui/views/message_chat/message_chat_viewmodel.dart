// import 'package:agora_chat_uikit/chat_uikit.dart';
import 'package:quiick_chat/app/app.locator.dart';
// import 'package:quiick_chat/ui/widgets/chat/file_preview_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MessageChatViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  // final _dialogService = locator<DialogService>();

  void back() {
    _navigationService.back();
  }

  void stopAudio() {
    // Implement audio stopping logic if needed
  }

  void rebuild() {
    rebuildUi();
  }

  // void viewImage(Message message) {
  //   // Show full-screen image viewer
  //   // _dialogService.showCustomDialog(
  //   //   variant: DialogType.custom,
  //   //   data: {
  //   //     'imageUrl': message.remotePath,
  //   //     'title': 'Image',
  //   //   },
  //   // );
  // }

  // void playVoiceMessage(Message message) {
  //   // Voice message playback is already handled in the VoiceMessagePlayer widget
  // }

  // void playVideo(Message message) {
  //   // Implement video playback
  //   // _dialogService.showCustomDialog(
  //   //   variant: DialogType.custom,
  //   //   data: {
  //   //     'videoUrl': message.remotePath,
  //   //     'title': 'Video',
  //   //   },
  //   // );
  // }

  // void handleFileMessage(Message message) {
  //   // Extract filename from path
  //   String filePath = message.remotePath ?? 'Unknown file';
  //   String fileName = filePath.split('/').last;

  //   _navigationService.navigateToView(
  //       FilePreviewDialog(fileUrl: filePath, fileName: fileName));

  // Show file preview dialog
  // _dialogService.showDialog(
  //   title: 'File Preview',
  //   description: 'Would you like to download this file?',
  //   dialogPlatform: DialogPlatform.Material,
  //   barrierDismissible: true,
  //   customData: FilePreviewDialog(
  //     fileUrl: filePath,
  //     fileName: fileName,
  //   ),
  // );
  // }

  // void openLocation(Message message) {
  //   // Implement location opening
  // }
}
