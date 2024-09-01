import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'exclusivity_type_card_cc_widget.dart' show ExclusivityTypeCardCcWidget;
import 'package:flutter/material.dart';

class ExclusivityTypeCardCcModel
    extends FlutterFlowModel<ExclusivityTypeCardCcWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Exclusivity_cc widget.
  FormFieldController<List<String>>? exclusivityCcValueController;
  List<String>? get exclusivityCcValues => exclusivityCcValueController?.value;
  set exclusivityCcValues(List<String>? val) =>
      exclusivityCcValueController?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
