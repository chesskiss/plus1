import '/components/posts/post_images/post_images_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_profile_post_widget.dart' show MainProfilePostWidget;
import 'package:flutter/material.dart';

class MainProfilePostModel extends FlutterFlowModel<MainProfilePostWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PostImages component.
  late PostImagesModel postImagesModel;

  @override
  void initState(BuildContext context) {
    postImagesModel = createModel(context, () => PostImagesModel());
  }

  @override
  void dispose() {
    postImagesModel.dispose();
  }
}
