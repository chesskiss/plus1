import '/backend/schema/enums/enums.dart';
import '/components/image_upload/image_upload_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_post_widget.dart' show EditPostWidget;
import 'package:flutter/material.dart';

class EditPostModel extends FlutterFlowModel<EditPostWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - enums2activityType] action in editPost widget.
  List<String>? activityStrings;
  // Stores action output result for [Custom Action - enums2exclusivity] action in editPost widget.
  List<String>? exclusivityStrings;
  // Stores action output result for [Custom Action - enums2dressCode] action in editPost widget.
  List<String>? dressCodeStrings;
  // Model for ImageUpload component.
  late ImageUploadModel imageUploadModel;
  // State field(s) for EventName widget.
  FocusNode? eventNameFocusNode;
  TextEditingController? eventNameTextController;
  String? Function(BuildContext, String?)? eventNameTextControllerValidator;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for Exclusivity_cc widget.
  FormFieldController<List<String>>? exclusivityCcValueController;
  List<String>? get exclusivityCcValues => exclusivityCcValueController?.value;
  set exclusivityCcValues(List<String>? val) =>
      exclusivityCcValueController?.value = val;
  // State field(s) for DressCode_cc widget.
  FormFieldController<List<String>>? dressCodeCcValueController;
  List<String>? get dressCodeCcValues => dressCodeCcValueController?.value;
  set dressCodeCcValues(List<String>? val) =>
      dressCodeCcValueController?.value = val;
  // State field(s) for SponsorshipTile widget.
  bool? sponsorshipTileValue;
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
  // Stores action output result for [Custom Action - dressCode2Enums] action in Button widget.
  List<DressCode>? dressCodeEnums;

  @override
  void initState(BuildContext context) {
    imageUploadModel = createModel(context, () => ImageUploadModel());
  }

  @override
  void dispose() {
    imageUploadModel.dispose();
    eventNameFocusNode?.dispose();
    eventNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }

  /// Action blocks.
  Future test(BuildContext context) async {}
}
