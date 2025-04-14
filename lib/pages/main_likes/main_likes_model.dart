import '/backend/backend.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'main_likes_widget.dart' show MainLikesWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class MainLikesModel extends FlutterFlowModel<MainLikesWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> likes = [];
  void addToLikes(DocumentReference item) => likes.add(item);
  void removeFromLikes(DocumentReference item) => likes.remove(item);
  void removeAtIndexFromLikes(int index) => likes.removeAt(index);
  void insertAtIndexInLikes(int index, DocumentReference item) =>
      likes.insert(index, item);
  void updateLikesAtIndex(int index, Function(DocumentReference) updateFn) =>
      likes[index] = updateFn(likes[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Stores action output result for [Backend Call - Create Document] action in SwipeableStack widget.
  ChatRecord? chatmaked;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }

  /// Action blocks.
  Future fetchfollowers(BuildContext context) async {}
}
