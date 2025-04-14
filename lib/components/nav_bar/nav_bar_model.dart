import '/flutter_flow/flutter_flow_util.dart';
import 'nav_bar_widget.dart' show NavBarWidget;
import 'package:flutter/material.dart';

class NavBarModel extends FlutterFlowModel<NavBarWidget> {
  ///  Local state fields for this component.
  /// That are note swiped or mateched
  bool newFollowers = false;

  /// The list of new followers
  List<DocumentReference> likes = [];
  void addToLikes(DocumentReference item) => likes.add(item);
  void removeFromLikes(DocumentReference item) => likes.remove(item);
  void removeAtIndexFromLikes(int index) => likes.removeAt(index);
  void insertAtIndexInLikes(int index, DocumentReference item) =>
      likes.insert(index, item);
  void updateLikesAtIndex(int index, Function(DocumentReference) updateFn) =>
      likes[index] = updateFn(likes[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
