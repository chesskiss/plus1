import '/archive_pages/v4to6/exclusivity_mainfeed_row/exclusivity_mainfeed_row_widget.dart';
import '/components/posts/post_images/post_images_widget.dart';
import '/components/posts/social_icons/social_icons_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_post_widget.dart' show UserPostWidget;
import 'package:flutter/material.dart';

class UserPostModel extends FlutterFlowModel<UserPostWidget> {
  ///  Local state fields for this component.
  /// position of the post on the X axis
  double? deltaX = 0.0;

  /// starting position on X
  double? startPosition = 0.0;

  /// completed the swipe
  bool completed = true;

  /// ending position on X
  double? endPosition = 0.0;

  /// check if ended swipe
  bool dragEnded = false;

  /// Used to set the bg color right before the drag starts
  bool dragStarted = false;

  /// List of ppl who liked the post to calc their num
  List<DocumentReference> list2NumLikes = [];
  void addToList2NumLikes(DocumentReference item) => list2NumLikes.add(item);
  void removeFromList2NumLikes(DocumentReference item) =>
      list2NumLikes.remove(item);
  void removeAtIndexFromList2NumLikes(int index) =>
      list2NumLikes.removeAt(index);
  void insertAtIndexInList2NumLikes(int index, DocumentReference item) =>
      list2NumLikes.insert(index, item);
  void updateList2NumLikesAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      list2NumLikes[index] = updateFn(list2NumLikes[index]);

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
