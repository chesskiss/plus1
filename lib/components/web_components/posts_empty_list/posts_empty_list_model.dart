import '/flutter_flow/flutter_flow_util.dart';
import 'posts_empty_list_widget.dart' show PostsEmptyListWidget;
import 'package:flutter/material.dart';

class PostsEmptyListModel extends FlutterFlowModel<PostsEmptyListWidget> {
  ///  Local state fields for this component.
  /// Users we can remove from swipes, which excludes matches.
  List<DocumentReference> removableUsers = [];
  void addToRemovableUsers(DocumentReference item) => removableUsers.add(item);
  void removeFromRemovableUsers(DocumentReference item) =>
      removableUsers.remove(item);
  void removeAtIndexFromRemovableUsers(int index) =>
      removableUsers.removeAt(index);
  void insertAtIndexInRemovableUsers(int index, DocumentReference item) =>
      removableUsers.insert(index, item);
  void updateRemovableUsersAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      removableUsers[index] = updateFn(removableUsers[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
