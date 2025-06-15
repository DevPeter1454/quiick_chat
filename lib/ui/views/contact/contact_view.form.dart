// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String ContactValueKey = 'contact';

final Map<String, TextEditingController> _ContactViewTextEditingControllers =
    {};

final Map<String, FocusNode> _ContactViewFocusNodes = {};

final Map<String, String? Function(String?)?> _ContactViewTextValidations = {
  ContactValueKey: null,
};

mixin $ContactView {
  TextEditingController get contactController =>
      _getFormTextEditingController(ContactValueKey);

  FocusNode get contactFocusNode => _getFormFocusNode(ContactValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ContactViewTextEditingControllers.containsKey(key)) {
      return _ContactViewTextEditingControllers[key]!;
    }

    _ContactViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ContactViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ContactViewFocusNodes.containsKey(key)) {
      return _ContactViewFocusNodes[key]!;
    }
    _ContactViewFocusNodes[key] = FocusNode();
    return _ContactViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    contactController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    contactController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          ContactValueKey: contactController.text,
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

    for (var controller in _ContactViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ContactViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ContactViewTextEditingControllers.clear();
    _ContactViewFocusNodes.clear();
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

  String? get contactValue => this.formValueMap[ContactValueKey] as String?;

  set contactValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ContactValueKey: value}),
    );

    if (_ContactViewTextEditingControllers.containsKey(ContactValueKey)) {
      _ContactViewTextEditingControllers[ContactValueKey]?.text = value ?? '';
    }
  }

  bool get hasContact =>
      this.formValueMap.containsKey(ContactValueKey) &&
      (contactValue?.isNotEmpty ?? false);

  bool get hasContactValidationMessage =>
      this.fieldsValidationMessages[ContactValueKey]?.isNotEmpty ?? false;

  String? get contactValidationMessage =>
      this.fieldsValidationMessages[ContactValueKey];
}

extension Methods on FormStateHelper {
  setContactValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ContactValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    contactValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      ContactValueKey: getValidationMessage(ContactValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ContactViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ContactViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      ContactValueKey: getValidationMessage(ContactValueKey),
    });
