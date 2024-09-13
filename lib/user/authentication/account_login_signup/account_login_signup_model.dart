import '/flutter_flow/flutter_flow_util.dart';
import 'account_login_signup_widget.dart' show AccountLoginSignupWidget;
import 'package:flutter/material.dart';

class AccountLoginSignupModel
    extends FlutterFlowModel<AccountLoginSignupWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for signEmailAddress widget.
  FocusNode? signEmailAddressFocusNode;
  TextEditingController? signEmailAddressTextController;
  String? Function(BuildContext, String?)?
      signEmailAddressTextControllerValidator;
  // State field(s) for signPassword widget.
  FocusNode? signPasswordFocusNode;
  TextEditingController? signPasswordTextController;
  late bool signPasswordVisibility;
  String? Function(BuildContext, String?)? signPasswordTextControllerValidator;
  // State field(s) for signPasswordConfirm widget.
  FocusNode? signPasswordConfirmFocusNode;
  TextEditingController? signPasswordConfirmTextController;
  late bool signPasswordConfirmVisibility;
  String? Function(BuildContext, String?)?
      signPasswordConfirmTextControllerValidator;
  // State field(s) for logEmailAddress widget.
  FocusNode? logEmailAddressFocusNode;
  TextEditingController? logEmailAddressTextController;
  String? Function(BuildContext, String?)?
      logEmailAddressTextControllerValidator;
  // State field(s) for logPassword widget.
  FocusNode? logPasswordFocusNode;
  TextEditingController? logPasswordTextController;
  late bool logPasswordVisibility;
  String? Function(BuildContext, String?)? logPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    signPasswordVisibility = false;
    signPasswordConfirmVisibility = false;
    logPasswordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    signEmailAddressFocusNode?.dispose();
    signEmailAddressTextController?.dispose();

    signPasswordFocusNode?.dispose();
    signPasswordTextController?.dispose();

    signPasswordConfirmFocusNode?.dispose();
    signPasswordConfirmTextController?.dispose();

    logEmailAddressFocusNode?.dispose();
    logEmailAddressTextController?.dispose();

    logPasswordFocusNode?.dispose();
    logPasswordTextController?.dispose();
  }
}
