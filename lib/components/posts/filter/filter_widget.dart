import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'filter_model.dart';
export 'filter_model.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  late FilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FILTER_COMP_filter_ON_INIT_STATE');
      logFirebaseEvent('filter_update_component_state');
      _model.hasAccess = true;
      _model.noAccess = true;
      _model.close = true;
      _model.fancy = true;
      _model.casual = true;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('FILTER_COMP_Column_x0n9gk71_ON_TAP');
          // Close
          logFirebaseEvent('Column_Close');
          Navigator.pop(context);
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 44.0),
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 570.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent1,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 90.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Dress Code',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          'Activity Type',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          'Exclusivity',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: FlutterFlowCheckboxGroup(
                                        options: DressCode.values
                                            .map((e) => e.name)
                                            .toList(),
                                        onChanged: (val) => safeSetState(() =>
                                            _model.checkboxGroupValues1 = val),
                                        controller: _model
                                                .checkboxGroupValueController1 ??=
                                            FormFieldController<List<String>>(
                                          List.from([
                                                'Has tickets, exclusive acces, or sponsorship',
                                                'Doesn\'t  have tickets, exclusive acces, or sponsorship',
                                                'Not too far',
                                                'fancy dress code (semi-formal + )',
                                                'regular dress code (busniess - )'
                                              ] ??
                                              []),
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        checkColor:
                                            FlutterFlowTheme.of(context).info,
                                        checkboxBorderColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                        checkboxBorderRadius:
                                            BorderRadius.circular(4.0),
                                        initialized:
                                            _model.checkboxGroupValues1 != null,
                                      ),
                                    ),
                                    Expanded(
                                      child: FlutterFlowCheckboxGroup(
                                        options: ActivityType.values
                                            .map((e) => e.name)
                                            .toList(),
                                        onChanged: (val) => safeSetState(() =>
                                            _model.checkboxGroupValues2 = val),
                                        controller: _model
                                                .checkboxGroupValueController2 ??=
                                            FormFieldController<List<String>>(
                                          List.from([
                                                'regular dress code (busniess - )'
                                              ] ??
                                              []),
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        checkColor:
                                            FlutterFlowTheme.of(context).info,
                                        checkboxBorderColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                        checkboxBorderRadius:
                                            BorderRadius.circular(4.0),
                                        initialized:
                                            _model.checkboxGroupValues2 != null,
                                      ),
                                    ),
                                    Expanded(
                                      child: FlutterFlowCheckboxGroup(
                                        options: Exclusivity.values
                                            .map((e) => e.name)
                                            .toList(),
                                        onChanged: (val) => safeSetState(() =>
                                            _model.checkboxGroupValues3 = val),
                                        controller: _model
                                                .checkboxGroupValueController3 ??=
                                            FormFieldController<List<String>>(
                                          List.from([
                                                'Has tickets, exclusive acces, or sponsorship',
                                                'Doesn\'t  have tickets, exclusive acces, or sponsorship',
                                                'Not too far',
                                                'fancy dress code (semi-formal + )',
                                                'regular dress code (busniess - )'
                                              ] ??
                                              []),
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        checkColor:
                                            FlutterFlowTheme.of(context).info,
                                        checkboxBorderColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                        checkboxBorderRadius:
                                            BorderRadius.circular(4.0),
                                        initialized:
                                            _model.checkboxGroupValues3 != null,
                                      ),
                                    ),
                                  ],
                                ),
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                  ),
                                  child: Checkbox(
                                    value: _model.sponsoredValue ??= false,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.sponsoredValue = newValue!);
                                    },
                                    side: BorderSide(
                                      width: 2,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
