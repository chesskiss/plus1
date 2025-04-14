import '/archive_pages/v4to6/exclusivity_mainfeed_row/exclusivity_mainfeed_row_widget.dart';
import '/components/posts/post_images/post_images_widget.dart';
import '/components/posts/social_icons/social_icons_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shared_events_type_post_widget.dart' show SharedEventsTypePostWidget;
import 'package:flutter/material.dart';

class SharedEventsTypePostModel
    extends FlutterFlowModel<SharedEventsTypePostWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PostImages component.
  late PostImagesModel postImagesModel;
  // Model for social_Icons component.
  late SocialIconsModel socialIconsModel;
  // Model for exclusivity_Mainfeed_row component.
  late ExclusivityMainfeedRowModel exclusivityMainfeedRowModel;

  @override
  void initState(BuildContext context) {
    postImagesModel = createModel(context, () => PostImagesModel());
    socialIconsModel = createModel(context, () => SocialIconsModel());
    exclusivityMainfeedRowModel =
        createModel(context, () => ExclusivityMainfeedRowModel());
  }

  @override
  void dispose() {
    postImagesModel.dispose();
    socialIconsModel.dispose();
    exclusivityMainfeedRowModel.dispose();
  }
}
