import '/flutter_flow/flutter_flow_util.dart';
import '/updated_chat/chat_options/chat_options_widget.dart';
import '/updated_chat/user_list_small/user_list_small_widget.dart';
import 'chat_details_overlay_widget.dart' show ChatDetailsOverlayWidget;
import 'package:flutter/material.dart';

class ChatDetailsOverlayModel
    extends FlutterFlowModel<ChatDetailsOverlayWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for user_ListSmall dynamic component.
  late FlutterFlowDynamicModels<UserListSmallModel> userListSmallModels;
  // Model for chatOptions component.
  late ChatOptionsModel chatOptionsModel;

  @override
  void initState(BuildContext context) {
    userListSmallModels = FlutterFlowDynamicModels(() => UserListSmallModel());
    chatOptionsModel = createModel(context, () => ChatOptionsModel());
  }

  @override
  void dispose() {
    userListSmallModels.dispose();
    chatOptionsModel.dispose();
  }
}
