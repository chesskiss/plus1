import '/components/image_upload/image_upload_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_profile_widget.dart' show CreateProfileWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateProfileModel extends FlutterFlowModel<CreateProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for ImageUpload component.
  late ImageUploadModel imageUploadModel;
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  String? _fullNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter the patients full name.';
    }

    return null;
  }

  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  String? _ageTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter an age for the patient.';
    }

    return null;
  }

  // State field(s) for RelationType_in widget.
  FocusNode? relationTypeInFocusNode;
  TextEditingController? relationTypeInTextController;
  final relationTypeInMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      relationTypeInTextControllerValidator;
  // State field(s) for RelationType widget.
  String? relationTypeValue;
  FormFieldController<String>? relationTypeValueController;
  // State field(s) for gender widget.
  FocusNode? genderFocusNode;
  TextEditingController? genderTextController;
  final genderMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? genderTextControllerValidator;
  // State field(s) for Preferences widget.
  FocusNode? preferencesFocusNode;
  TextEditingController? preferencesTextController;
  final preferencesMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? preferencesTextControllerValidator;
  // State field(s) for Education widget.
  FocusNode? educationFocusNode;
  TextEditingController? educationTextController;
  final educationMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? educationTextControllerValidator;
  // State field(s) for height widget.
  FocusNode? heightFocusNode1;
  TextEditingController? heightTextController1;
  String? Function(BuildContext, String?)? heightTextController1Validator;
  // State field(s) for height widget.
  FocusNode? heightFocusNode2;
  TextEditingController? heightTextController2;
  String? Function(BuildContext, String?)? heightTextController2Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode1;
  TextEditingController? descriptionTextController1;
  String? Function(BuildContext, String?)? descriptionTextController1Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode2;
  TextEditingController? descriptionTextController2;
  String? Function(BuildContext, String?)? descriptionTextController2Validator;

  @override
  void initState(BuildContext context) {
    imageUploadModel = createModel(context, () => ImageUploadModel());
    fullNameTextControllerValidator = _fullNameTextControllerValidator;
    ageTextControllerValidator = _ageTextControllerValidator;
  }

  @override
  void dispose() {
    imageUploadModel.dispose();
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    ageFocusNode?.dispose();
    ageTextController?.dispose();

    relationTypeInFocusNode?.dispose();
    relationTypeInTextController?.dispose();

    genderFocusNode?.dispose();
    genderTextController?.dispose();

    preferencesFocusNode?.dispose();
    preferencesTextController?.dispose();

    educationFocusNode?.dispose();
    educationTextController?.dispose();

    heightFocusNode1?.dispose();
    heightTextController1?.dispose();

    heightFocusNode2?.dispose();
    heightTextController2?.dispose();

    descriptionFocusNode1?.dispose();
    descriptionTextController1?.dispose();

    descriptionFocusNode2?.dispose();
    descriptionTextController2?.dispose();
  }
}
