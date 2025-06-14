// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String CardNumberValueKey = 'cardNumber';
const String ExpiryDateValueKey = 'expiryDate';
const String CvvValueKey = 'cvv';
const String WalletPinValueKey = 'walletPin';

final Map<String, TextEditingController> _AddCardViewTextEditingControllers =
    {};

final Map<String, FocusNode> _AddCardViewFocusNodes = {};

final Map<String, String? Function(String?)?> _AddCardViewTextValidations = {
  CardNumberValueKey: null,
  ExpiryDateValueKey: null,
  CvvValueKey: null,
  WalletPinValueKey: null,
};

mixin $AddCardView {
  TextEditingController get cardNumberController =>
      _getFormTextEditingController(CardNumberValueKey);
  TextEditingController get expiryDateController =>
      _getFormTextEditingController(ExpiryDateValueKey);
  TextEditingController get cvvController =>
      _getFormTextEditingController(CvvValueKey);
  TextEditingController get walletPinController =>
      _getFormTextEditingController(WalletPinValueKey);

  FocusNode get cardNumberFocusNode => _getFormFocusNode(CardNumberValueKey);
  FocusNode get expiryDateFocusNode => _getFormFocusNode(ExpiryDateValueKey);
  FocusNode get cvvFocusNode => _getFormFocusNode(CvvValueKey);
  FocusNode get walletPinFocusNode => _getFormFocusNode(WalletPinValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddCardViewTextEditingControllers.containsKey(key)) {
      return _AddCardViewTextEditingControllers[key]!;
    }

    _AddCardViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddCardViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddCardViewFocusNodes.containsKey(key)) {
      return _AddCardViewFocusNodes[key]!;
    }
    _AddCardViewFocusNodes[key] = FocusNode();
    return _AddCardViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    cardNumberController.addListener(() => _updateFormData(model));
    expiryDateController.addListener(() => _updateFormData(model));
    cvvController.addListener(() => _updateFormData(model));
    walletPinController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    cardNumberController.addListener(() => _updateFormData(model));
    expiryDateController.addListener(() => _updateFormData(model));
    cvvController.addListener(() => _updateFormData(model));
    walletPinController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          CardNumberValueKey: cardNumberController.text,
          ExpiryDateValueKey: expiryDateController.text,
          CvvValueKey: cvvController.text,
          WalletPinValueKey: walletPinController.text,
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

    for (var controller in _AddCardViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddCardViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddCardViewTextEditingControllers.clear();
    _AddCardViewFocusNodes.clear();
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

  String? get cardNumberValue =>
      this.formValueMap[CardNumberValueKey] as String?;
  String? get expiryDateValue =>
      this.formValueMap[ExpiryDateValueKey] as String?;
  String? get cvvValue => this.formValueMap[CvvValueKey] as String?;
  String? get walletPinValue => this.formValueMap[WalletPinValueKey] as String?;

  set cardNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CardNumberValueKey: value}),
    );

    if (_AddCardViewTextEditingControllers.containsKey(CardNumberValueKey)) {
      _AddCardViewTextEditingControllers[CardNumberValueKey]?.text =
          value ?? '';
    }
  }

  set expiryDateValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ExpiryDateValueKey: value}),
    );

    if (_AddCardViewTextEditingControllers.containsKey(ExpiryDateValueKey)) {
      _AddCardViewTextEditingControllers[ExpiryDateValueKey]?.text =
          value ?? '';
    }
  }

  set cvvValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CvvValueKey: value}),
    );

    if (_AddCardViewTextEditingControllers.containsKey(CvvValueKey)) {
      _AddCardViewTextEditingControllers[CvvValueKey]?.text = value ?? '';
    }
  }

  set walletPinValue(String? value) {
    this.setData(
      this.formValueMap..addAll({WalletPinValueKey: value}),
    );

    if (_AddCardViewTextEditingControllers.containsKey(WalletPinValueKey)) {
      _AddCardViewTextEditingControllers[WalletPinValueKey]?.text = value ?? '';
    }
  }

  bool get hasCardNumber =>
      this.formValueMap.containsKey(CardNumberValueKey) &&
      (cardNumberValue?.isNotEmpty ?? false);
  bool get hasExpiryDate =>
      this.formValueMap.containsKey(ExpiryDateValueKey) &&
      (expiryDateValue?.isNotEmpty ?? false);
  bool get hasCvv =>
      this.formValueMap.containsKey(CvvValueKey) &&
      (cvvValue?.isNotEmpty ?? false);
  bool get hasWalletPin =>
      this.formValueMap.containsKey(WalletPinValueKey) &&
      (walletPinValue?.isNotEmpty ?? false);

  bool get hasCardNumberValidationMessage =>
      this.fieldsValidationMessages[CardNumberValueKey]?.isNotEmpty ?? false;
  bool get hasExpiryDateValidationMessage =>
      this.fieldsValidationMessages[ExpiryDateValueKey]?.isNotEmpty ?? false;
  bool get hasCvvValidationMessage =>
      this.fieldsValidationMessages[CvvValueKey]?.isNotEmpty ?? false;
  bool get hasWalletPinValidationMessage =>
      this.fieldsValidationMessages[WalletPinValueKey]?.isNotEmpty ?? false;

  String? get cardNumberValidationMessage =>
      this.fieldsValidationMessages[CardNumberValueKey];
  String? get expiryDateValidationMessage =>
      this.fieldsValidationMessages[ExpiryDateValueKey];
  String? get cvvValidationMessage =>
      this.fieldsValidationMessages[CvvValueKey];
  String? get walletPinValidationMessage =>
      this.fieldsValidationMessages[WalletPinValueKey];
}

extension Methods on FormStateHelper {
  String? setCardNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CardNumberValueKey] = validationMessage;
  String? setExpiryDateValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ExpiryDateValueKey] = validationMessage;
  String? setCvvValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CvvValueKey] = validationMessage;
  String? setWalletPinValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[WalletPinValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    cardNumberValue = '';
    expiryDateValue = '';
    cvvValue = '';
    walletPinValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      CardNumberValueKey: getValidationMessage(CardNumberValueKey),
      ExpiryDateValueKey: getValidationMessage(ExpiryDateValueKey),
      CvvValueKey: getValidationMessage(CvvValueKey),
      WalletPinValueKey: getValidationMessage(WalletPinValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddCardViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddCardViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      CardNumberValueKey: getValidationMessage(CardNumberValueKey),
      ExpiryDateValueKey: getValidationMessage(ExpiryDateValueKey),
      CvvValueKey: getValidationMessage(CvvValueKey),
      WalletPinValueKey: getValidationMessage(WalletPinValueKey),
    });
