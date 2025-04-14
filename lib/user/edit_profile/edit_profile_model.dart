import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  Local state fields for this page.

  List<String> images = [];
  void addToImages(String item) => images.add(item);
  void removeFromImages(String item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, String item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(String) updateFn) =>
      images[index] = updateFn(images[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
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
  // State field(s) for RelationType widget.
  List<String>? relationTypeValue;
  FormFieldController<List<String>>? relationTypeValueController;
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
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // Stores action output result for [Custom Action - relations2Enums] action in Save_Button widget.
  List<RelationPreference>? relationsEnum;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
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
