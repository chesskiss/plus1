import '/components/images_upload/images_upload_widget.dart';
import '/components/web_components/posts_empty_list/posts_empty_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_widget.dart' show TestWidget;
import 'package:flutter/material.dart';

class TestModel extends FlutterFlowModel<TestWidget> {
  ///  Local state fields for this page.

  String? search;

  ///  State fields for stateful widgets in this page.

  // Model for ImagesUpload component.
  late ImagesUploadModel imagesUploadModel;
  // Model for posts_emptyList component.
  late PostsEmptyListModel postsEmptyListModel;
  // State field(s) for Search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;

  @override
  void initState(BuildContext context) {
    imagesUploadModel = createModel(context, () => ImagesUploadModel());
    postsEmptyListModel = createModel(context, () => PostsEmptyListModel());
  }

  @override
  void dispose() {
    imagesUploadModel.dispose();
    postsEmptyListModel.dispose();
    searchFocusNode?.dispose();
    searchTextController?.dispose();
  }
}
