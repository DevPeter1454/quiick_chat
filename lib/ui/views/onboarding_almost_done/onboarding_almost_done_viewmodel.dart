import 'dart:io'; // Import dart:io for File

import 'package:agora_chat_uikit/sdk_service/chat_sdk_service.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker
import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.logger.dart';
import 'package:quiick_chat/app/app.router.dart';
import 'package:quiick_chat/models/failure.dart';
import 'package:quiick_chat/repository/export.dart';
import 'package:quiick_chat/services/export.dart';
import 'package:quiick_chat/services/local_storage_service.dart';
import 'package:quiick_chat/ui/views/onboarding_almost_done/onboarding_almost_done_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingAlmostDoneViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<IAuthService>();
  final _loadingService = locator<LoadingService>();
  final _localStorageService = locator<LocalStorageService>();
  final _toastService = locator<ToastService>();
  final logger = getLogger('OnboardingAlmostDoneViewModel');

  String _profilePictureUrl = "";

  final ImagePicker _picker =
      ImagePicker(); // Create an instance of ImagePicker

  File? _selectedImage; // Variable to hold the selected image file
  File? get selectedImage => _selectedImage;

  void back() {
    _navigationService.back();
  }

  Future<void> navigateToBottomNavBar() async {
    try {
      _loadingService.showLoading();
      await loginIntoAgora().then((value) =>
          _navigationService.clearStackAndShow(Routes.bottomNavBarView));
    } catch (e) {
      logger.e(e);
    } finally {
      _loadingService.hideLoading();
    }
    // final user = _localStorageService.getUser();
    // user!.userName = userNameValue;
    // user.profilePictureUrl = _profilePictureUrl;

    // _navigationService.clearStackAndShow(Routes.bottomNavBarView);
    // await uploadImage();
  }

  Future<void> loginIntoAgora() async {
    final agoraUsername =
        _localStorageService.getUser()!.agoraChatInfo!.username;
    final agoraPassword =
        _localStorageService.getUser()!.agoraChatInfo!.password;
    bool connected = await ChatClient.getInstance.isConnected();
    if (connected) {
      await ChatClient.getInstance.logout();
    }
    await ChatClient.getInstance
        .loginWithPassword(agoraUsername, agoraPassword!);
    await ChatClient.getInstance.startCallback();
    bool isConnected = await ChatClient.getInstance.isConnected();
    print("connected $isConnected");
  }

  Future<void> selectImage() async {
    logger.d('selectImage');
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _selectedImage = File(image.path); // Store the selected image as a File
      notifyListeners(); // Notify the UI to update
      await uploadImage();
    } else {
      // User canceled the picker
      print('No image selected.');
    }
  }

  Future<void> uploadImage() async {
    try {
      _loadingService.showLoading();
      final res = await _authService.uploadUserProfilePhoto(
        userID: _localStorageService.getUser()!.id,
        image: _selectedImage!,
      );
      if (res.isSuccess) {
        _toastService.showSuccess("Success", res.getField("message"));
        logger.d(res.getField("data"));
        _profilePictureUrl =
            res.getNestedField(["data", "profile_picture_url"]);
        // navigateToBottomNavBar();
      } else {
        if (res.failure is ValidationFailure) {
          //clear the image
          _selectedImage = null;
          notifyListeners();
        }

        logger.e(res.failure!.message);
        _toastService.handleFailure(res.failure,
            context: "Profile Photo Upload failed",
            title: "Profile Photo Upload failed");
      }
    } catch (e) {
      logger.e(e);
      _toastService.showError("Error", "Profile Photo Upload failed");
    } finally {
      _loadingService.hideLoading();
    }
  }

  Future<void> updateUserProfile() async {
    if (userNameValue == null || userNameValue!.isEmpty) {
      _toastService.showError("Error", "User Name is required");
      return;
    }

    try {
      _loadingService.showLoading();
      final res = await _authService.uploadUserProfilePhotoUrl(
        userID: _localStorageService.getUser()!.id,
        imageUrl: _profilePictureUrl,
        userName: userNameValue!,
      );
      if (res.isSuccess) {
        _toastService.showSuccess("Success", res.getField("message"));
        logger.d(res.getField("data"));

        navigateToBottomNavBar();
        // _localStorageService.setUser(res.getField("data"));
      } else {
        _toastService.handleFailure(res.failure,
            context: "User Profile Information Update failed");
      }
    } catch (e) {
      logger.e(e);
      _toastService.showError(
          "Error", "User Profile Information Update failed");
    } finally {
      _loadingService.hideLoading();
    }
  }
}
