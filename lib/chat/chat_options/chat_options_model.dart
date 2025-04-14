import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_options_widget.dart' show ChatOptionsWidget;
import 'package:flutter/material.dart';

class ChatOptionsModel extends FlutterFlowModel<ChatOptionsWidget> {
  ///  Local state fields for this component.

  bool showDelete = false;

  /// email / sms content
  String message = 'Someone';

  ///  State fields for stateful widgets in this component.

  // State field(s) for SearchFriends widget.
  FocusNode? searchFriendsFocusNode;
  TextEditingController? searchFriendsTextController;
  String? Function(BuildContext, String?)? searchFriendsTextControllerValidator;
  List<UserRecord> simpleSearchResults = [];
  // State field(s) for inviteOutsiders widget.
  FocusNode? inviteOutsidersFocusNode;
  TextEditingController? inviteOutsidersTextController;
  String? Function(BuildContext, String?)?
      inviteOutsidersTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFriendsFocusNode?.dispose();
    searchFriendsTextController?.dispose();

    inviteOutsidersFocusNode?.dispose();
    inviteOutsidersTextController?.dispose();
  }
}
