import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'o_p_tverify_page_widget.dart' show OPTverifyPageWidget;
import 'package:flutter/material.dart';

class OPTverifyPageModel extends FlutterFlowModel<OPTverifyPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
