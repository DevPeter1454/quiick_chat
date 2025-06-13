// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:quiick_chat/app/app.logger.dart';
import 'package:quiick_chat/models/failure.dart';
import 'package:quiick_chat/ui/common/export.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

enum ToastType {
  success,
  error,
  warning,
  info,
}

class ToastService {
  final logger = getLogger('ToastService');

  // Show a toast notification with optional context
  void showToast({
    required String title,
    required String message,
    required ContentType type,
    Color? backgroundColor,
    BuildContext? context,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    final materialBanner = MaterialBanner(
      elevation: 0,
      backgroundColor: Colors.transparent,
      dividerColor: Colors.transparent,
      forceActionsBelow: true,
      animation: const AlwaysStoppedAnimation(1.0),
      onVisible: () {
        Future.delayed(duration, () {
          if (context != null) {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          } else if (rootScaffoldMessengerKey.currentState != null) {
            rootScaffoldMessengerKey.currentState!.hideCurrentMaterialBanner();
          }
        });
      },
      content: AwesomeSnackbarContent(
        color: backgroundColor,
        title: title,
        titleTextStyle: AppTextstyles.semiBold(color: AppColors.kcWhiteColor),
        messageTextStyle:
            AppTextstyles.medium.copyWith(color: AppColors.kcWhiteColor),
        message: message,
        contentType: type,
        inMaterialBanner: true,
      ),
      actions: const [SizedBox.shrink()],
    );

    // Use provided context or global key
    if (context != null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentMaterialBanner()
        ..showMaterialBanner(materialBanner);
    } else if (rootScaffoldMessengerKey.currentState != null) {
      rootScaffoldMessengerKey.currentState!
        ..hideCurrentMaterialBanner()
        ..showMaterialBanner(materialBanner);
    } else {
      logger.e('No context or ScaffoldMessengerKey available to show toast');
    }
  }

  // Convenience methods for common toast types
  void showError(String title, String message, {BuildContext? context}) {
    showToast(
      title: title,
      message: message,
      type: ContentType.failure,
      backgroundColor: AppColors.errorColor.withOpacity(0.8),
      context: context,
    );
  }

  void showSuccess(String title, String message, {BuildContext? context}) {
    showToast(
      title: title,
      message: message,
      type: ContentType.success,
      backgroundColor: AppColors.kcPrimaryColor,
      context: context,
    );
  }

  // Fix these methods to match the updated signature
  void showWarning(String title, String message, {BuildContext? context}) {
    showToast(
      title: title,
      message: message,
      type: ContentType.warning,
      context: context,
    );
  }

  void showInfo(String title, String message, {BuildContext? context}) {
    showToast(
      title: title,
      message: message,
      type: ContentType.help,
      context: context,
    );
  }

  // Reusable method to handle different types of failures
  void handleFailure(Failure? failure, {String? context, String? title}) {
    final contextStr = context != null ? '[$context] ' : '';

    if (failure == null) {
      logger.e('${contextStr}Unknown error');
      showError('Operation Failed', 'Unknown error occurred');
      return;
    }

    logger.e('${contextStr}Error: ${failure.message}');

    // Handle different failure types
    if (failure is ValidationFailure) {
      showError(title ?? 'Validation Error', failure.message);
    } else if (failure is NetworkFailure || failure is SocketFailure) {
      showError('Network Error',
          'Please check your internet connection and try again');
    } else if (failure is AuthFailure) {
      showError('Authentication Error', failure.message);
    } else if (failure is TimeoutFailure) {
      showError(
          'Request Timeout', 'The operation timed out. Please try again.');
    } else {
      showError(context ?? 'Operation Failed', failure.message);
    }
  }
}
