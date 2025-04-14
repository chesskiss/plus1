import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'post_interested_widget.dart' show PostInterestedWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class PostInterestedModel extends FlutterFlowModel<PostInterestedWidget> {
  ///  Local state fields for this page.
  /// Users that the Auth user didn't swipe yet AND liked the post
  List<DocumentReference> newInterestedUsers = [];
  void addToNewInterestedUsers(DocumentReference item) =>
      newInterestedUsers.add(item);
  void removeFromNewInterestedUsers(DocumentReference item) =>
      newInterestedUsers.remove(item);
  void removeAtIndexFromNewInterestedUsers(int index) =>
      newInterestedUsers.removeAt(index);
  void insertAtIndexInNewInterestedUsers(int index, DocumentReference item) =>
      newInterestedUsers.insert(index, item);
  void updateNewInterestedUsersAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      newInterestedUsers[index] = updateFn(newInterestedUsers[index]);

  /// where we are at the stack
  int? index = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Stores action output result for [Custom Action - isBlocked] action in SwipeableStack widget.
  bool? blocked;
  // Stores action output result for [Backend Call - Create Document] action in SwipeableStack widget.
  ChatRecord? chatmaked;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}
}
