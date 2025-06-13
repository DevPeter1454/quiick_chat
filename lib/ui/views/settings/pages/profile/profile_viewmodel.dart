import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.logger.dart';
import 'package:quiick_chat/repository/auth_repository/auth_service.dart';
import 'package:quiick_chat/services/loading_service.dart';
import 'package:quiick_chat/services/local_storage_service.dart';
import 'package:quiick_chat/services/toast_service.dart';
import 'package:quiick_chat/ui/views/settings/pages/profile/profile_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _toastService = locator<ToastService>();
  final _loadingService = locator<LoadingService>();
  final _authService = locator<IAuthService>();
  final _localStorageService = locator<LocalStorageService>();
  final logger = getLogger('ProfileViewModel');

  final ImagePicker _picker =
      ImagePicker(); // Create an instance of ImagePicker

  File? _selectedImage; // Variable to hold the selected image file
  File? get selectedImage => _selectedImage;

  String _profilePictureUrl = "";
  String get profilePictureUrl => _profilePictureUrl;
  void setProfilePictureUrl(String url) {
    _profilePictureUrl = url;
    notifyListeners();
  }

  String _userName = "";
  String get userName => _userName;
  void setUserName(String userName) {
    _userName = userName;
    notifyListeners();
  }

  void setDataFromLocalStorage() {
    _profilePictureUrl = _localStorageService.getUser()!.profilePicture!;
    _userName = _localStorageService.getUser()!.username;
    userNameValue = _localStorageService.getUser()!.username;
    notifyListeners();
  }

  void back() {
    _navigationService.back(result: true);
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

        setProfilePictureUrl(
            res.getNestedField(["data", "profile_picture_url"]));
        // navigateToBottomNavBar();
        updateUserProfile(fromPicture: true);
      } else {
        _toastService.handleFailure(res.failure,
            context: "Profile Photo Upload failed");
      }
    } catch (e) {
      logger.e(e);
      _toastService.showError("Error", "Profile Photo Upload failed");
    } finally {
      // _loadingService.hideLoading();
    }
  }

  Future<void> updateUserProfile({required bool fromPicture}) async {
    if (!fromPicture) {
      if (userNameValue == null || userNameValue!.isEmpty) {
        _toastService.showError("Error", "User Name is required");
        return;
      }
    }

    try {
      _loadingService.showLoading();
      final res = await _authService.uploadUserProfilePhotoUrl(
        userID: _localStorageService.getUser()!.id,
        imageUrl: _profilePictureUrl,
        userName: fromPicture
            ? _localStorageService.getUser()!.username
            : userNameValue!,
      );
      if (res.isSuccess) {
        _toastService.showSuccess("Success", res.getField("message"));
        logger.d(res.getField("data"));

        // navigateToBottomNavBar();
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
