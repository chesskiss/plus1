import '/archive_pages/v4to6/exclusivity_mainfeed_row/exclusivity_mainfeed_row_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/posts/post_details_modal/post_details_modal_widget.dart';
import '/components/posts/post_images/post_images_widget.dart';
import '/components/posts/social_icons/social_icons_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'shared_events_type_post_model.dart';
export 'shared_events_type_post_model.dart';

/// acrhive
///
class SharedEventsTypePostWidget extends StatefulWidget {
  const SharedEventsTypePostWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
  });

  final String? parameter1;
  final DocumentReference? parameter2;
  final List<String>? parameter3;
  final List<Exclusivity>? parameter4;

  @override
  State<SharedEventsTypePostWidget> createState() =>
      _SharedEventsTypePostWidgetState();
}

class _SharedEventsTypePostWidgetState
    extends State<SharedEventsTypePostWidget> {
  late SharedEventsTypePostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SharedEventsTypePostModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 670.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              color: FlutterFlowTheme.of(context).alternate,
              offset: Offset(
                0.0,
                1.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'SHARED_EVENTS_TYPE_POST_Row_qlbc0ukk_ON_');
                      logFirebaseEvent('Row_navigate_to');

                      context.pushNamed(PostDetailsV1Widget.routeName);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SHARED_EVENTS_TYPE_POST_Column_8sq730dp_');
                                // ShowPostDetails
                                logFirebaseEvent('Column_ShowPostDetails');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: PostDetailsModalWidget(
                                        postParam: widget.parameter2!,
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                if ((currentUserDocument?.postClicked
                                                .toList() ??
                                            [])
                                        .contains(widget.parameter2) ==
                                    true) {
                                  logFirebaseEvent('Column_backend_call');

                                  await currentUserReference!
                                      .update(createUserRecordData(
                                    clickedTime: getCurrentTimestamp,
                                  ));
                                  return;
                                } else {
                                  logFirebaseEvent('Column_backend_call');

                                  await currentUserReference!.update({
                                    ...createUserRecordData(
                                      clickedTime: getCurrentTimestamp,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'Post_clicked': FieldValue.arrayUnion(
                                            [widget.parameter2]),
                                      },
                                    ),
                                  });
                                  return;
                                }
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Text(
                                      widget.parameter1!,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 25.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: wrapWithModel(
                model: _model.postImagesModel,
                updateCallback: () => safeSetState(() {}),
                child: PostImagesWidget(
                  postImages: widget.parameter3!,
                  heightPrecentage: 0.7,
                ),
              ),
            ),
            wrapWithModel(
              model: _model.socialIconsModel,
              updateCallback: () => safeSetState(() {}),
              child: SocialIconsWidget(
                post: widget.parameter2!,
              ),
            ),
            if (false)
              wrapWithModel(
                model: _model.exclusivityMainfeedRowModel,
                updateCallback: () => safeSetState(() {}),
                child: ExclusivityMainfeedRowWidget(
                  exclusivityType: widget.parameter4!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
