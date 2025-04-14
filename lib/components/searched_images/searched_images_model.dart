import '/flutter_flow/flutter_flow_util.dart';
import 'searched_images_widget.dart' show SearchedImagesWidget;
import 'package:flutter/material.dart';

class SearchedImagesModel extends FlutterFlowModel<SearchedImagesWidget> {
  ///  Local state fields for this component.
  /// Images the user selects to be presented on the post
  List<String> selectedImages = [];
  void addToSelectedImages(String item) => selectedImages.add(item);
  void removeFromSelectedImages(String item) => selectedImages.remove(item);
  void removeAtIndexFromSelectedImages(int index) =>
      selectedImages.removeAt(index);
  void insertAtIndexInSelectedImages(int index, String item) =>
      selectedImages.insert(index, item);
  void updateSelectedImagesAtIndex(int index, Function(String) updateFn) =>
      selectedImages[index] = updateFn(selectedImages[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
