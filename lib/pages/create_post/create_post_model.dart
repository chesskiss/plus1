import '/backend/schema/enums/enums.dart';
import '/components/image_upload/image_upload_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_post_widget.dart' show CreatePostWidget;
import 'package:flutter/material.dart';

class CreatePostModel extends FlutterFlowModel<CreatePostWidget> {
  ///  Local state fields for this page.

  List<String> nothing = [];
  void addToNothing(String item) => nothing.add(item);
  void removeFromNothing(String item) => nothing.remove(item);
  void removeAtIndexFromNothing(int index) => nothing.removeAt(index);
  void insertAtIndexInNothing(int index, String item) =>
      nothing.insert(index, item);
  void updateNothingAtIndex(int index, Function(String) updateFn) =>
      nothing[index] = updateFn(nothing[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for ImageUpload component.
  late ImageUploadModel imageUploadModel;
  // State field(s) for EventName widget.
  FocusNode? eventNameFocusNode;
  TextEditingController? eventNameTextController;
  String? Function(BuildContext, String?)? eventNameTextControllerValidator;
  String? _eventNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Exclusivity_cc widget.
  FormFieldController<List<String>>? exclusivityCcValueController;
  List<String>? get exclusivityCcValues => exclusivityCcValueController?.value;
  set exclusivityCcValues(List<String>? val) =>
      exclusivityCcValueController?.value = val;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for ActivityType_cc widget.
  FormFieldController<List<String>>? activityTypeCcValueController;
  List<String>? get activityTypeCcValues =>
      activityTypeCcValueController?.value;
  set activityTypeCcValues(List<String>? val) =>
      activityTypeCcValueController?.value = val;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  DateTime? datePicked4;
  // Stores action output result for [Custom Action - activityTypes2Enums] action in Button widget.
  List<ActivityType>? activityEnums;
  // Stores action output result for [Custom Action - exclusiveTypes2Enums] action in Button widget.
  List<Exclusivity>? exclusivtyEnums;

  @override
  void initState(BuildContext context) {
    imageUploadModel = createModel(context, () => ImageUploadModel());
    eventNameTextControllerValidator = _eventNameTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
  }

  @override
  void dispose() {
    imageUploadModel.dispose();
    eventNameFocusNode?.dispose();
    eventNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
