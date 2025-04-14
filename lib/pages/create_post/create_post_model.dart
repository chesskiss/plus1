import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/images_upload/images_upload_widget.dart';
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

  bool vis = false;

  /// Since location is not Null by default, but it's 0,0, we need to set it to
  /// Null when creating the post.
  LatLng? initalLocation;

  /// The images selected by invoking the API search
  List<String> selectedSearchedImages = [];
  void addToSelectedSearchedImages(String item) =>
      selectedSearchedImages.add(item);
  void removeFromSelectedSearchedImages(String item) =>
      selectedSearchedImages.remove(item);
  void removeAtIndexFromSelectedSearchedImages(int index) =>
      selectedSearchedImages.removeAt(index);
  void insertAtIndexInSelectedSearchedImages(int index, String item) =>
      selectedSearchedImages.insert(index, item);
  void updateSelectedSearchedImagesAtIndex(
          int index, Function(String) updateFn) =>
      selectedSearchedImages[index] = updateFn(selectedSearchedImages[index]);

  /// FF doesn't reload components within so we need to make it invisible and
  /// invisble again..
  ///
  /// Stupid framework requires us to write a messy code.
  bool reloadImagesUpload = true;

  /// Used for reset
  DateTime? startDate;

  /// Used for reset
  DateTime? startTime;

  /// Used for reset
  DateTime? endDate;

  /// Used for reset
  DateTime? endTime;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for ImagesUpload component.
  late ImagesUploadModel imagesUploadModel;
  // State field(s) for input widget.
  FocusNode? inputFocusNode;
  TextEditingController? inputTextController;
  String? Function(BuildContext, String?)? inputTextControllerValidator;
  // Stores action output result for [Backend Call - API (Image search)] action in Search widget.
  ApiCallResponse? imagesearch;
  // Stores action output result for [Bottom Sheet - searched_images] action in Search widget.
  List<String>? selectedImages;
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
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for ActivityType_cc widget.
  FormFieldController<List<String>>? activityTypeCcValueController;
  List<String>? get activityTypeCcValues =>
      activityTypeCcValueController?.value;
  set activityTypeCcValues(List<String>? val) =>
      activityTypeCcValueController?.value = val;
  // State field(s) for DressCode_cc widget.
  FormFieldController<List<String>>? dressCodeCcValueController;
  List<String>? get dressCodeCcValues => dressCodeCcValueController?.value;
  set dressCodeCcValues(List<String>? val) =>
      dressCodeCcValueController?.value = val;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for FlexibleDates_Checkbox widget.
  bool? flexibleDatesCheckboxValue;
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
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostRecord? post;

  @override
  void initState(BuildContext context) {
    imagesUploadModel = createModel(context, () => ImagesUploadModel());
    eventNameTextControllerValidator = _eventNameTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
  }

  @override
  void dispose() {
    imagesUploadModel.dispose();
    inputFocusNode?.dispose();
    inputTextController?.dispose();

    eventNameFocusNode?.dispose();
    eventNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
