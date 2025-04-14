import '/backend/schema/enums/enums.dart';
import '/components/images_upload/images_upload_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_profile_widget.dart' show CreateProfileWidget;
import 'package:flutter/material.dart';

class CreateProfileModel extends FlutterFlowModel<CreateProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for ImagesUpload component.
  late ImagesUploadModel imagesUploadModel;
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  // State field(s) for RelationType widget.
  List<String>? relationTypeValue;
  FormFieldController<List<String>>? relationTypeValueController;
  // State field(s) for gender widget.
  FocusNode? genderFocusNode;
  TextEditingController? genderTextController;
  String? Function(BuildContext, String?)? genderTextControllerValidator;
  // State field(s) for Preferences widget.
  FocusNode? preferencesFocusNode;
  TextEditingController? preferencesTextController;
  String? Function(BuildContext, String?)? preferencesTextControllerValidator;
  // State field(s) for Education widget.
  FocusNode? educationFocusNode;
  TextEditingController? educationTextController;
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
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for i_like widget.
  FocusNode? iLikeFocusNode;
  TextEditingController? iLikeTextController;
  String? Function(BuildContext, String?)? iLikeTextControllerValidator;
  // Stores action output result for [Custom Action - relations2Enums] action in Button widget.
  List<RelationPreference>? relationsEnum;

  @override
  void initState(BuildContext context) {
    imagesUploadModel = createModel(context, () => ImagesUploadModel());
  }

  @override
  void dispose() {
    imagesUploadModel.dispose();
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    ageFocusNode?.dispose();
    ageTextController?.dispose();

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

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    iLikeFocusNode?.dispose();
    iLikeTextController?.dispose();
  }
}
