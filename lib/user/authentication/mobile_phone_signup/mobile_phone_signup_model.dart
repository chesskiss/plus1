import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mobile_phone_signup_widget.dart' show MobilePhoneSignupWidget;
import 'package:flutter/material.dart';

class MobilePhoneSignupModel extends FlutterFlowModel<MobilePhoneSignupWidget> {
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
