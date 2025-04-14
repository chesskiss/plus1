import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stranger_profile_widget.dart' show StrangerProfileWidget;
import 'package:flutter/material.dart';

class StrangerProfileModel extends FlutterFlowModel<StrangerProfileWidget> {
  ///  Local state fields for this page.
  /// A buffer to toggle the icon only after all actions have been completed.
  bool like = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatRecord? chatmaked;
  // Stores action output result for [Backend Call - Create Document] action in ToggleIcon widget.
  ChatRecord? chatmakedIcon;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
