// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:quiick_chat/shared/validator.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String UserNameValueKey = 'userName';

final Map<String, TextEditingController>
    _OnboardingAlmostDoneViewTextEditingControllers = {};

final Map<String, FocusNode> _OnboardingAlmostDoneViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _OnboardingAlmostDoneViewTextValidations = {
  UserNameValueKey: Validator.validateUsername,
};

mixin $OnboardingAlmostDoneView {
  TextEditingController get userNameController =>
      _getFormTextEditingController(UserNameValueKey);

  FocusNode get userNameFocusNode => _getFormFocusNode(UserNameValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_OnboardingAlmostDoneViewTextEditingControllers.containsKey(key)) {
      return _OnboardingAlmostDoneViewTextEditingControllers[key]!;
    }

    _OnboardingAlmostDoneViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _OnboardingAlmostDoneViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_OnboardingAlmostDoneViewFocusNodes.containsKey(key)) {
      return _OnboardingAlmostDoneViewFocusNodes[key]!;
    }
    _OnboardingAlmostDoneViewFocusNodes[key] = FocusNode();
    return _OnboardingAlmostDoneViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    userNameController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    userNameController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          UserNameValueKey: userNameController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _OnboardingAlmostDoneViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _OnboardingAlmostDoneViewFocusNodes.values) {
      focusNode.dispose();
    }

    _OnboardingAlmostDoneViewTextEditingControllers.clear();
    _OnboardingAlmostDoneViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get userNameValue => this.formValueMap[UserNameValueKey] as String?;

  set userNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({UserNameValueKey: value}),
    );

    if (_OnboardingAlmostDoneViewTextEditingControllers.containsKey(
        UserNameValueKey)) {
      _OnboardingAlmostDoneViewTextEditingControllers[UserNameValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasUserName =>
      this.formValueMap.containsKey(UserNameValueKey) &&
      (userNameValue?.isNotEmpty ?? false);

  bool get hasUserNameValidationMessage =>
      this.fieldsValidationMessages[UserNameValueKey]?.isNotEmpty ?? false;

  String? get userNameValidationMessage =>
      this.fieldsValidationMessages[UserNameValueKey];
}

extension Methods on FormStateHelper {
  String? setUserNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[UserNameValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    userNameValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      UserNameValueKey: getValidationMessage(UserNameValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _OnboardingAlmostDoneViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _OnboardingAlmostDoneViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      UserNameValueKey: getValidationMessage(UserNameValueKey),
    });
