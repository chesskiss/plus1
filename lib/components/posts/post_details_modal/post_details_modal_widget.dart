import '/archive_pages/v4to6/activity_type_card/activity_type_card_widget.dart';
import '/archive_pages/v4to6/dress_code_card/dress_code_card_widget.dart';
import '/archive_pages/v4to6/exclusivity_type_card/exclusivity_type_card_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'post_details_modal_model.dart';
export 'post_details_modal_model.dart';

class PostDetailsModalWidget extends StatefulWidget {
  const PostDetailsModalWidget({
    super.key,
    required this.postParam,
  });

  final DocumentReference? postParam;

  @override
  State<PostDetailsModalWidget> createState() => _PostDetailsModalWidgetState();
}

class _PostDetailsModalWidgetState extends State<PostDetailsModalWidget> {
  late PostDetailsModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostDetailsModalModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PostRecord>(
      stream: PostRecord.getDocument(widget.postParam!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }

        final containerPostRecord = snapshot.data!;

        return Container(
          width: double.infinity,
          height: double.infinity,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.8,
          ),
          decoration: BoxDecoration(
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
            gradient: LinearGradient(
              colors: [Colors.white, Color(0xFFF0F0F0)],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: GestureDetector(
                      onVerticalDragDown: (details) async {
                        logFirebaseEvent(
                            'POST_DETAILS_MODAL_Container_tufjdihg_ON');
                        // Close
                        logFirebaseEvent('Container_Close');
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 60.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: Text(
                                  containerPostRecord.title,
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 4.0),
                        child: Text(
                          containerPostRecord.description,
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.exclusivityTypeCardModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ExclusivityTypeCardWidget(
                          exclusivityTypes: containerPostRecord.exclusivityType,
                        ),
                      ),
                      if (containerPostRecord.location != null)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.4,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.rectangle,
                                ),
                                child: Builder(builder: (context) {
                                  final _googleMapMarker =
                                      containerPostRecord.location;
                                  return FlutterFlowGoogleMap(
                                    controller: _model.googleMapsController,
                                    onCameraIdle: (latLng) =>
                                        _model.googleMapsCenter = latLng,
                                    initialLocation: _model.googleMapsCenter ??=
                                        containerPostRecord.location!,
                                    markers: [
                                      if (_googleMapMarker != null)
                                        FlutterFlowMarker(
                                          _googleMapMarker.serialize(),
                                          _googleMapMarker,
                                        ),
                                    ],
                                    markerColor: GoogleMarkerColor.violet,
                                    mapType: MapType.normal,
                                    style: GoogleMapStyle.standard,
                                    initialZoom: 14.0,
                                    allowInteraction: true,
                                    allowZoom: true,
                                    showZoomControls: true,
                                    showLocation: true,
                                    showCompass: false,
                                    showMapToolbar: false,
                                    showTraffic: false,
                                    centerMapOnMarkerTap: true,
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                      wrapWithModel(
                        model: _model.activityTypeCardModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ActivityTypeCardWidget(
                          activityType: containerPostRecord.activityType,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.dressCodeCardModel,
                        updateCallback: () => safeSetState(() {}),
                        child: DressCodeCardWidget(
                          dressCode: containerPostRecord.dressCode,
                        ),
                      ),
                      if (containerPostRecord.flexibleDates)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'The dates for this event are ',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                TextSpan(
                                  text: 'flexible',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontStyle: FontStyle.italic,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      if ((containerPostRecord.startDate != null) ||
                          (containerPostRecord.endDate != null))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                constraints: BoxConstraints(
                                  minWidth: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width,
                                    90.0,
                                  ),
                                  maxWidth: double.infinity,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.45,
                                  child: custom_widgets.DateRangeCalendar(
                                    width: double.infinity,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.45,
                                    startDate: containerPostRecord.startDate,
                                    endDate: containerPostRecord.endDate,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if ((containerPostRecord.startTime != null) ||
                          (containerPostRecord.endTime != null))
                        Padding(
                          padding: EdgeInsets.all(6.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: containerPostRecord.startTime != null
                                      ? 'From   '
                                      : '',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                TextSpan(
                                  text: containerPostRecord.startTime != null
                                      ? dateTimeFormat(
                                          "jm", containerPostRecord.startTime!)
                                      : '',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                TextSpan(
                                  text: containerPostRecord.endTime != null
                                      ? '   Until   '
                                      : '',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                TextSpan(
                                  text: containerPostRecord.endTime != null
                                      ? dateTimeFormat(
                                          "jm", containerPostRecord.endTime!)
                                      : '',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontStyle: FontStyle.italic,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      Container(
                        width: 100.0,
                        height: MediaQuery.sizeOf(context).height * 0.03,
                        decoration: BoxDecoration(),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Posted on  ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            dateTimeFormat(
                                "d/M/y", containerPostRecord.timePosted!),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
