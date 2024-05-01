// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String NameValueKey = 'name';
const String CountryValueKey = 'country';
const String LinksValueKey = 'links';
const String AboutMeValueKey = 'aboutMe';

final Map<String, TextEditingController>
    _EditProfileDialogTextEditingControllers = {};

final Map<String, FocusNode> _EditProfileDialogFocusNodes = {};

final Map<String, String? Function(String?)?>
    _EditProfileDialogTextValidations = {
  NameValueKey: null,
  CountryValueKey: null,
  LinksValueKey: null,
  AboutMeValueKey: null,
};

mixin $EditProfileDialog {
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get countryController =>
      _getFormTextEditingController(CountryValueKey);
  TextEditingController get linksController =>
      _getFormTextEditingController(LinksValueKey);
  TextEditingController get aboutMeController =>
      _getFormTextEditingController(AboutMeValueKey);

  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get countryFocusNode => _getFormFocusNode(CountryValueKey);
  FocusNode get linksFocusNode => _getFormFocusNode(LinksValueKey);
  FocusNode get aboutMeFocusNode => _getFormFocusNode(AboutMeValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_EditProfileDialogTextEditingControllers.containsKey(key)) {
      return _EditProfileDialogTextEditingControllers[key]!;
    }

    _EditProfileDialogTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _EditProfileDialogTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_EditProfileDialogFocusNodes.containsKey(key)) {
      return _EditProfileDialogFocusNodes[key]!;
    }
    _EditProfileDialogFocusNodes[key] = FocusNode();
    return _EditProfileDialogFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    nameController.addListener(() => _updateFormData(model));
    countryController.addListener(() => _updateFormData(model));
    linksController.addListener(() => _updateFormData(model));
    aboutMeController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    countryController.addListener(() => _updateFormData(model));
    linksController.addListener(() => _updateFormData(model));
    aboutMeController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          NameValueKey: nameController.text,
          CountryValueKey: countryController.text,
          LinksValueKey: linksController.text,
          AboutMeValueKey: aboutMeController.text,
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

    for (var controller in _EditProfileDialogTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _EditProfileDialogFocusNodes.values) {
      focusNode.dispose();
    }

    _EditProfileDialogTextEditingControllers.clear();
    _EditProfileDialogFocusNodes.clear();
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

  String? get nameValue => this.formValueMap[NameValueKey] as String?;
  String? get countryValue => this.formValueMap[CountryValueKey] as String?;
  String? get linksValue => this.formValueMap[LinksValueKey] as String?;
  String? get aboutMeValue => this.formValueMap[AboutMeValueKey] as String?;

  set nameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NameValueKey: value}),
    );

    if (_EditProfileDialogTextEditingControllers.containsKey(NameValueKey)) {
      _EditProfileDialogTextEditingControllers[NameValueKey]?.text =
          value ?? '';
    }
  }

  set countryValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CountryValueKey: value}),
    );

    if (_EditProfileDialogTextEditingControllers.containsKey(CountryValueKey)) {
      _EditProfileDialogTextEditingControllers[CountryValueKey]?.text =
          value ?? '';
    }
  }

  set linksValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LinksValueKey: value}),
    );

    if (_EditProfileDialogTextEditingControllers.containsKey(LinksValueKey)) {
      _EditProfileDialogTextEditingControllers[LinksValueKey]?.text =
          value ?? '';
    }
  }

  set aboutMeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AboutMeValueKey: value}),
    );

    if (_EditProfileDialogTextEditingControllers.containsKey(AboutMeValueKey)) {
      _EditProfileDialogTextEditingControllers[AboutMeValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasName =>
      this.formValueMap.containsKey(NameValueKey) &&
      (nameValue?.isNotEmpty ?? false);
  bool get hasCountry =>
      this.formValueMap.containsKey(CountryValueKey) &&
      (countryValue?.isNotEmpty ?? false);
  bool get hasLinks =>
      this.formValueMap.containsKey(LinksValueKey) &&
      (linksValue?.isNotEmpty ?? false);
  bool get hasAboutMe =>
      this.formValueMap.containsKey(AboutMeValueKey) &&
      (aboutMeValue?.isNotEmpty ?? false);

  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasCountryValidationMessage =>
      this.fieldsValidationMessages[CountryValueKey]?.isNotEmpty ?? false;
  bool get hasLinksValidationMessage =>
      this.fieldsValidationMessages[LinksValueKey]?.isNotEmpty ?? false;
  bool get hasAboutMeValidationMessage =>
      this.fieldsValidationMessages[AboutMeValueKey]?.isNotEmpty ?? false;

  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get countryValidationMessage =>
      this.fieldsValidationMessages[CountryValueKey];
  String? get linksValidationMessage =>
      this.fieldsValidationMessages[LinksValueKey];
  String? get aboutMeValidationMessage =>
      this.fieldsValidationMessages[AboutMeValueKey];
}

extension Methods on FormStateHelper {
  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setCountryValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CountryValueKey] = validationMessage;
  setLinksValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LinksValueKey] = validationMessage;
  setAboutMeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AboutMeValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    nameValue = '';
    countryValue = '';
    linksValue = '';
    aboutMeValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      CountryValueKey: getValidationMessage(CountryValueKey),
      LinksValueKey: getValidationMessage(LinksValueKey),
      AboutMeValueKey: getValidationMessage(AboutMeValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _EditProfileDialogTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _EditProfileDialogTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      CountryValueKey: getValidationMessage(CountryValueKey),
      LinksValueKey: getValidationMessage(LinksValueKey),
      AboutMeValueKey: getValidationMessage(AboutMeValueKey),
    });
