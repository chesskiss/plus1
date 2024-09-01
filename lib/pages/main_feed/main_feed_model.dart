import '/components/web_components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_feed_widget.dart' show MainFeedWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class MainFeedModel extends FlutterFlowModel<MainFeedWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? mainFeedController;
  // Model for Side_nav component.
  late SideNavModel sideNavModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    mainFeedController?.finish();
    sideNavModel.dispose();
  }
}
