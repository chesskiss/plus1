import '/archive_pages/v1/post_details_base_v1/post_details_base_v1_widget.dart';
import '/components/web_components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_details_v1_widget.dart' show PostDetailsV1Widget;
import 'package:flutter/material.dart';

class PostDetailsV1Model extends FlutterFlowModel<PostDetailsV1Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for Side_nav component.
  late SideNavModel sideNavModel;
  // Model for post_Details_base_v1 component.
  late PostDetailsBaseV1Model postDetailsBaseV1Model;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    postDetailsBaseV1Model =
        createModel(context, () => PostDetailsBaseV1Model());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    postDetailsBaseV1Model.dispose();
  }
}
