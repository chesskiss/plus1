import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'user_list_small_model.dart';
export 'user_list_small_model.dart';

class UserListSmallWidget extends StatefulWidget {
  const UserListSmallWidget({
    super.key,
    this.userRef,
    this.action,
    this.chatRef,
  });

  final UserRecord? userRef;
  final Future Function()? action;
  final DocumentReference? chatRef;

  @override
  State<UserListSmallWidget> createState() => _UserListSmallWidgetState();
}

class _UserListSmallWidgetState extends State<UserListSmallWidget> {
  late UserListSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserListSmallModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ChatRecord>(
      stream: ChatRecord.getDocument(widget.chatRef!),
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

        final iuserChatRecord = snapshot.data!;

        return MouseRegion(
          opaque: false,
          cursor: MouseCursor.defer ?? MouseCursor.defer,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 150),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: _model.iuserHovered
                  ? FlutterFlowTheme.of(context).primaryBackground
                  : FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            widget.userRef!.photos.firstOrNull!,
                            width: 32.0,
                            height: 32.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 8.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.userRef?.displayName,
                                  'Ghost User',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (currentUserReference == widget.userRef?.reference)
                        Container(
                          height: 32.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent1,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Text(
                                'ME',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (widget.userRef?.reference != currentUserReference)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: AutoSizeText(
                            'Rate match',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: RatingBar.builder(
                          onRatingUpdate: (newValue) async {
                            safeSetState(
                                () => _model.ratingBarValue = newValue);
                            logFirebaseEvent(
                                'USER_LIST_SMALL_RatingBar_c87xfh2q_ON_TA');
                            if (widget.userRef?.reference !=
                                currentUserReference) {
                              if (widget.userRef?.reference ==
                                  iuserChatRecord.userA) {
                                logFirebaseEvent('RatingBar_backend_call');

                                await widget.chatRef!
                                    .update(createChatRecordData(
                                  ratingUserA: updateRatingStruct(
                                    RatingStruct(
                                      user: widget.userRef?.reference,
                                      rating: _model.ratingBarValue?.round(),
                                    ),
                                    clearUnsetFields: false,
                                  ),
                                ));
                              } else {
                                logFirebaseEvent('RatingBar_backend_call');

                                await widget.chatRef!
                                    .update(createChatRecordData(
                                  ratingUserB: updateRatingStruct(
                                    RatingStruct(
                                      user: widget.userRef?.reference,
                                      rating: _model.ratingBarValue?.round(),
                                    ),
                                    clearUnsetFields: false,
                                  ),
                                ));
                              }

                              logFirebaseEvent('RatingBar_backend_call');

                              await widget.userRef!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'rating': FieldValue.arrayUnion([
                                      getRatingFirestoreData(
                                        updateRatingStruct(
                                          RatingStruct(
                                            user: currentUserReference,
                                            rating:
                                                _model.ratingBarValue?.round(),
                                            time: getCurrentTimestamp,
                                          ),
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                  },
                                ),
                              });
                            }
                          },
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rounded,
                            color: FlutterFlowTheme.of(context).tertiary,
                          ),
                          direction: Axis.horizontal,
                          initialRating: _model.ratingBarValue ??= widget
                                      .userRef?.reference ==
                                  iuserChatRecord.ratingUserA.user
                              ? iuserChatRecord.ratingUserA.rating.toDouble()
                              : iuserChatRecord.ratingUserB.rating.toDouble(),
                          unratedColor: FlutterFlowTheme.of(context).accent3,
                          itemCount: 5,
                          itemSize: 40.0,
                          glowColor: FlutterFlowTheme.of(context).tertiary,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          onEnter: ((event) async {
            safeSetState(() => _model.iuserHovered = true);
          }),
          onExit: ((event) async {
            safeSetState(() => _model.iuserHovered = false);
          }),
        );
      },
    );
  }
}
