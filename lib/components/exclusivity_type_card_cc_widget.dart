import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'exclusivity_type_card_cc_model.dart';
export 'exclusivity_type_card_cc_model.dart';

class ExclusivityTypeCardCcWidget extends StatefulWidget {
  /// A conditional viewer showing only relevant exclusivity types using choice
  /// chips - could be used to gather exclusivity type input from the user.
  const ExclusivityTypeCardCcWidget({super.key});

  @override
  State<ExclusivityTypeCardCcWidget> createState() =>
      _ExclusivityTypeCardCcWidgetState();
}

class _ExclusivityTypeCardCcWidgetState
    extends State<ExclusivityTypeCardCcWidget> {
  late ExclusivityTypeCardCcModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExclusivityTypeCardCcModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 10.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    'Exclusivity Type',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Figtree',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: FlutterFlowChoiceChips(
                      options: const [
                        ChipData('Exclusive Access', Icons.diamond_outlined),
                        ChipData('Need a ticket', FontAwesomeIcons.ticketAlt),
                        ChipData('Sponsorship', Icons.attach_money),
                        ChipData('Public', Icons.people_alt)
                      ],
                      onChanged: (val) =>
                          safeSetState(() => _model.exclusivityCcValues = val),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: const Color(0x00000000),
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Figtree',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                        iconColor: FlutterFlowTheme.of(context).secondaryText,
                        iconSize: 24.0,
                        elevation: 0.0,
                        borderWidth: 2.0,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: const Color(0x00000000),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                        iconColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        iconSize: 18.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      chipSpacing: 6.0,
                      multiselect: true,
                      initialized: _model.exclusivityCcValues != null,
                      alignment: WrapAlignment.start,
                      controller: _model.exclusivityCcValueController ??=
                          FormFieldController<List<String>>(
                        [],
                      ),
                      wrapped: true,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
