import '/components/web_components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_swipes_v1_widget.dart' show ProfileSwipesV1Widget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class ProfileSwipesV1Model extends FlutterFlowModel<ProfileSwipesV1Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for Side_nav component.
  late SideNavModel sideNavModel;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {
    sideNavModel.dispose();
  }
}
