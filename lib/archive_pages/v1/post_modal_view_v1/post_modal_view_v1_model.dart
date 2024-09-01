import '/archive_pages/v1/post_details_base_v1/post_details_base_v1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_modal_view_v1_widget.dart' show PostModalViewV1Widget;
import 'package:flutter/material.dart';

class PostModalViewV1Model extends FlutterFlowModel<PostModalViewV1Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for post_Details_base_v1 component.
  late PostDetailsBaseV1Model postDetailsBaseV1Model;

  @override
  void initState(BuildContext context) {
    postDetailsBaseV1Model =
        createModel(context, () => PostDetailsBaseV1Model());
  }

  @override
  void dispose() {
    postDetailsBaseV1Model.dispose();
  }
}
