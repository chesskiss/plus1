import '/archive_pages/v4to6/exclusivity_mainfeed_row/exclusivity_mainfeed_row_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/posts/post_details_modal/post_details_modal_widget.dart';
import '/components/posts/post_images/post_images_widget.dart';
import '/components/posts/social_icons/social_icons_widget.dart';
import '/feedback/report_menu/report_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'user_post_model.dart';
export 'user_post_model.dart';

/// Swipable event post with titles, profiles pointer, and social icons
class UserPostWidget extends StatefulWidget {
  const UserPostWidget({
    super.key,
    required this.post,
  });

  /// Post doc ref
  final DocumentReference? post;

  @override
  State<UserPostWidget> createState() => _UserPostWidgetState();
}

class _UserPostWidgetState extends State<UserPostWidget>
    with TickerProviderStateMixin {
  late UserPostModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserPostModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: null,
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: FFAppState().walkthrough
          ? (MediaQuery.sizeOf(context).height * 0.5)
          : (MediaQuery.sizeOf(context).height * 0.7),
      decoration: BoxDecoration(),
      child: StreamBuilder<PostRecord>(
        stream: PostRecord.getDocument(widget.post!),
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

          final stackPostRecord = snapshot.data!;

          return GestureDetector(
            onHorizontalDragStart: (details) async {
              logFirebaseEvent('USER_POST_Stack_7qskqotb_ON_HORIZONTAL_D');
              logFirebaseEvent('Stack_update_component_state');
              _model.dragStarted = true;
              safeSetState(() {});
            },
            child: Stack(
              children: [
                if (_model.dragStarted)
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFEF212C),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.people,
                          color: FlutterFlowTheme.of(context).info,
                          size: 50.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                GestureDetector(
                  onHorizontalDragUpdate: (details) async {
                    logFirebaseEvent(
                        'USER_POST_userPost_ON_HORIZONTAL_DRAG_UP');
                    if (details.localPosition.dx > _model.startPosition!) {
                      logFirebaseEvent('userPost_update_component_state');
                      _model.dragEnded = false;
                      _model.startPosition = 0.0;
                      _model.dragStarted = true;
                      safeSetState(() {});
                      logFirebaseEvent('userPost_widget_animation');
                      if (animationsMap['containerOnActionTriggerAnimation'] !=
                          null) {
                        await animationsMap[
                                'containerOnActionTriggerAnimation']!
                            .controller
                            .forward(from: 0.0);
                      }
                      logFirebaseEvent('userPost_update_component_state');
                      _model.dragEnded = true;
                      _model.dragStarted = false;
                      safeSetState(() {});
                      if ((stackPostRecord.likes.length == 0) ||
                          (stackPostRecord.likes
                                  .contains(currentUserReference) &&
                              (stackPostRecord.likes.length == 1))) {
                        logFirebaseEvent('userPost_navigate_to');

                        context.pushNamed(
                          StrangerProfileWidget.routeName,
                          queryParameters: {
                            'profile': serializeParam(
                              stackPostRecord.op,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        logFirebaseEvent('userPost_navigate_to');

                        context.pushNamed(
                          PostInterestedWidget.routeName,
                          queryParameters: {
                            'post': serializeParam(
                              stackPostRecord,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'post': stackPostRecord,
                          },
                        );
                      }
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 1.0),
                          child: Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 8.0, 12.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      if ((stackPostRecord.likes.length == 0) ||
                                          (stackPostRecord.likes.contains(
                                                  currentUserReference) &&
                                              (stackPostRecord.likes.length ==
                                                  1)) ||
                                          ((stackPostRecord.likes.length ==
                                                  1) &&
                                              stackPostRecord.likes.contains(
                                                  stackPostRecord.op)) ||
                                          ((stackPostRecord.likes.length ==
                                                  2) &&
                                              stackPostRecord.likes.contains(
                                                  stackPostRecord.op) &&
                                              stackPostRecord.likes.contains(
                                                  currentUserReference)))
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'USER_POST_COMP_SingleUser_profile_ON_TAP');
                                            logFirebaseEvent(
                                                'SingleUser_profile_navigate_to');

                                            context.pushNamed(
                                              StrangerProfileWidget.routeName,
                                              queryParameters: {
                                                'profile': serializeParam(
                                                  stackPostRecord.op,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: 52.0,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(2.0),
                                              child: StreamBuilder<UserRecord>(
                                                stream: UserRecord.getDocument(
                                                    stackPostRecord.op!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }

                                                  final imageUserRecord =
                                                      snapshot.data!;

                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      imageUserRecord
                                                          .photos.firstOrNull!,
                                                      width: 300.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (!((stackPostRecord.likes.length ==
                                              0) ||
                                          (stackPostRecord.likes.contains(
                                                  currentUserReference) &&
                                              (stackPostRecord.likes.length ==
                                                  1)) ||
                                          ((stackPostRecord.likes.length ==
                                                  1) &&
                                              stackPostRecord.likes.contains(
                                                  stackPostRecord.op)) ||
                                          ((stackPostRecord.likes.length ==
                                                  2) &&
                                              stackPostRecord.likes.contains(
                                                  stackPostRecord.op) &&
                                              stackPostRecord.likes.contains(
                                                  currentUserReference))))
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'USER_POST_COMP_MultiUserProfiles_ON_TAP');
                                            // setNumList
                                            logFirebaseEvent(
                                                'MultiUserProfiles_setNumList');
                                            _model.list2NumLikes =
                                                stackPostRecord.likes
                                                    .toList()
                                                    .cast<DocumentReference>();
                                            safeSetState(() {});
                                            // CorrectNumList
                                            logFirebaseEvent(
                                                'MultiUserProfiles_CorrectNumList');
                                            _model.removeFromList2NumLikes(
                                                currentUserReference!);
                                            safeSetState(() {});
                                            // CorrectNumList
                                            logFirebaseEvent(
                                                'MultiUserProfiles_CorrectNumList');
                                            _model.addToList2NumLikes(
                                                stackPostRecord.op!);
                                            safeSetState(() {});
                                            // CorrectNumList
                                            logFirebaseEvent(
                                                'MultiUserProfiles_CorrectNumList');
                                            _model.list2NumLikes = functions
                                                .removeMultipleElementsFromList(
                                                    _model.list2NumLikes
                                                        .toList(),
                                                    (currentUserDocument?.swiped
                                                                .toList() ??
                                                            [])
                                                        .toList())!
                                                .toList()
                                                .cast<DocumentReference>();
                                            safeSetState(() {});
                                            if (_model.list2NumLikes.length >
                                                1) {
                                              // CorrectNumList
                                              logFirebaseEvent(
                                                  'MultiUserProfiles_CorrectNumList');
                                              _model.removeFromList2NumLikes(
                                                  currentUserReference!);
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'MultiUserProfiles_navigate_to');

                                              context.pushNamed(
                                                PostInterestedWidget.routeName,
                                                queryParameters: {
                                                  'post': serializeParam(
                                                    stackPostRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'post': stackPostRecord,
                                                },
                                              );
                                            } else {
                                              logFirebaseEvent(
                                                  'MultiUserProfiles_navigate_to');

                                              context.pushNamed(
                                                StrangerProfileWidget.routeName,
                                                queryParameters: {
                                                  'profile': serializeParam(
                                                    stackPostRecord.op,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }
                                          },
                                          child: Container(
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 4.0, 12.0, 4.0),
                                              child: Container(
                                                width: 54.0,
                                                height: 44.0,
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 1.0),
                                                      child: Container(
                                                        width: 32.0,
                                                        height: 32.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  2.0),
                                                          child: StreamBuilder<
                                                              UserRecord>(
                                                            stream: UserRecord
                                                                .getDocument(
                                                                    stackPostRecord
                                                                        .op!),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }

                                                              final imageUserRecord =
                                                                  snapshot
                                                                      .data!;

                                                              return ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              300),
                                                                  fadeOutDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              300),
                                                                  imageUrl:
                                                                      imageUserRecord
                                                                          .photos
                                                                          .firstOrNull!,
                                                                  width: 44.0,
                                                                  height: 44.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Container(
                                                        width: 32.0,
                                                        height: 32.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  2.0),
                                                          child: StreamBuilder<
                                                              UserRecord>(
                                                            stream: UserRecord
                                                                .getDocument(
                                                                    stackPostRecord
                                                                        .likes
                                                                        .firstOrNull!),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }

                                                              final imageUserRecord =
                                                                  snapshot
                                                                      .data!;

                                                              return ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  imageUserRecord
                                                                      .photos
                                                                      .firstOrNull!,
                                                                  width: 44.0,
                                                                  height: 44.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              );
                                                            },
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
                                    ],
                                  ),
                                  Flexible(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'USER_POST_COMP_Container_gnqe0i0a_ON_TAP');
                                          if (loggedIn) {
                                            logFirebaseEvent(
                                                'Container_google_analytics_event');
                                            logFirebaseEvent(
                                              'post_details',
                                              parameters: {
                                                'post': widget.post,
                                                'user': currentUserReference,
                                                'time': getCurrentTimestamp,
                                              },
                                            );
                                            // PostModal
                                            logFirebaseEvent(
                                                'Container_PostModal');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: PostDetailsModalWidget(
                                                    postParam: widget.post!,
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            if ((currentUserDocument
                                                            ?.postClicked
                                                            .toList() ??
                                                        [])
                                                    .contains(widget.post) ==
                                                true) {
                                              logFirebaseEvent(
                                                  'Container_backend_call');

                                              await currentUserReference!
                                                  .update(createUserRecordData(
                                                clickedTime:
                                                    getCurrentTimestamp,
                                              ));
                                              return;
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_backend_call');

                                              await currentUserReference!
                                                  .update({
                                                ...createUserRecordData(
                                                  clickedTime:
                                                      getCurrentTimestamp,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'Post_clicked':
                                                        FieldValue.arrayUnion(
                                                            [widget.post]),
                                                  },
                                                ),
                                              });
                                              return;
                                            }
                                          } else {
                                            return;
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: AutoSizeText(
                                              stackPostRecord.title
                                                  .maybeHandleOverflow(
                                                maxChars: 20,
                                                replacement: '…',
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              minFontSize: 15.0,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (false)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'USER_POST_COMP_Column_qxyjglx0_ON_TAP');
                                          // PostModal
                                          logFirebaseEvent('Column_PostModal');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: PostDetailsModalWidget(
                                                  postParam: widget.post!,
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                if (stackPostRecord.sponsored) {
                                                  return Text(
                                                    'Sponsored',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  );
                                                } else if (stackPostRecord
                                                    .partialSponsorship) {
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Semi',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Figtree',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Text(
                                                        'Sponsored',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Figtree',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  return Container(
                                                    width: 0.0,
                                                    height: 0.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'USER_POST_COMP_Icon_8abs3k3e_ON_TAP');
                                        // report post
                                        logFirebaseEvent('Icon_reportpost');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: ReportMenuWidget(
                                                post: widget.post!,
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Icon(
                                        Icons.keyboard_control,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 28.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: wrapWithModel(
                                        model: _model.postImagesModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: PostImagesWidget(
                                          postImages: stackPostRecord.photos,
                                          heightPrecentage: 0.7,
                                        ),
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.socialIconsModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: SocialIconsWidget(
                                        post: stackPostRecord.reference,
                                      ),
                                    ),
                                    if (stackPostRecord.likes.length > 0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            7.0, 0.0, 0.0, 9.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'USER_POST_COMP_Row_nnawvifp_ON_TAP');
                                            // setNumList
                                            logFirebaseEvent('Row_setNumList');
                                            _model.list2NumLikes =
                                                stackPostRecord.likes
                                                    .toList()
                                                    .cast<DocumentReference>();
                                            safeSetState(() {});
                                            // CorrectNumList
                                            logFirebaseEvent(
                                                'Row_CorrectNumList');
                                            _model.removeFromList2NumLikes(
                                                currentUserReference!);
                                            safeSetState(() {});
                                            // CorrectNumList
                                            logFirebaseEvent(
                                                'Row_CorrectNumList');
                                            _model.addToList2NumLikes(
                                                stackPostRecord.op!);
                                            safeSetState(() {});
                                            // CorrectNumList
                                            logFirebaseEvent(
                                                'Row_CorrectNumList');
                                            _model.list2NumLikes = functions
                                                .removeMultipleElementsFromList(
                                                    _model.list2NumLikes
                                                        .toList(),
                                                    (currentUserDocument?.swiped
                                                                .toList() ??
                                                            [])
                                                        .toList())!
                                                .toList()
                                                .cast<DocumentReference>();
                                            safeSetState(() {});
                                            if (_model.list2NumLikes.length >
                                                1) {
                                              // CorrectNumList
                                              logFirebaseEvent(
                                                  'Row_CorrectNumList');
                                              _model.removeFromList2NumLikes(
                                                  currentUserReference!);
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Row_navigate_to');

                                              context.pushNamed(
                                                PostInterestedWidget.routeName,
                                                queryParameters: {
                                                  'post': serializeParam(
                                                    stackPostRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'post': stackPostRecord,
                                                },
                                              );
                                            } else {
                                              logFirebaseEvent(
                                                  'Row_navigate_to');

                                              context.pushNamed(
                                                StrangerProfileWidget.routeName,
                                                queryParameters: {
                                                  'profile': serializeParam(
                                                    stackPostRecord.op,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: stackPostRecord
                                                          .likes.length
                                                          .toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Figtree',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    TextSpan(
                                                      text: ' Likes',
                                                      style: TextStyle(),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: StreamBuilder<UserRecord>(
                                        stream: UserRecord.getDocument(
                                            stackPostRecord.op!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          final rowUserRecord = snapshot.data!;

                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        7.0, 0.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'USER_POST_COMP_RichText_6ctheguf_ON_TAP');
                                                    logFirebaseEvent(
                                                        'RichText_navigate_to');

                                                    context.pushNamed(
                                                      StrangerProfileWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'profile':
                                                            serializeParam(
                                                          stackPostRecord.op,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: rowUserRecord
                                                              .displayName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Figtree',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: '  ',
                                                          style: TextStyle(),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Figtree',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'USER_POST_COMP_Text_8l5iu0ss_ON_TAP');
                                                    if (loggedIn) {
                                                      logFirebaseEvent(
                                                          'Text_google_analytics_event');
                                                      logFirebaseEvent(
                                                        'post_details',
                                                        parameters: {
                                                          'post':
                                                              stackPostRecord
                                                                  .reference,
                                                          'user':
                                                              currentUserReference,
                                                          'time':
                                                              getCurrentTimestamp,
                                                        },
                                                      );
                                                      // PostModal
                                                      logFirebaseEvent(
                                                          'Text_PostModal');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                PostDetailsModalWidget(
                                                              postParam:
                                                                  stackPostRecord
                                                                      .reference,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

                                                      if ((currentUserDocument
                                                                      ?.postClicked
                                                                      .toList() ??
                                                                  [])
                                                              .contains(
                                                                  stackPostRecord
                                                                      .reference) ==
                                                          true) {
                                                        logFirebaseEvent(
                                                            'Text_backend_call');

                                                        await currentUserReference!
                                                            .update(
                                                                createUserRecordData(
                                                          clickedTime:
                                                              getCurrentTimestamp,
                                                        ));
                                                        return;
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Text_backend_call');

                                                        await currentUserReference!
                                                            .update({
                                                          ...createUserRecordData(
                                                            clickedTime:
                                                                getCurrentTimestamp,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'Post_clicked':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                stackPostRecord
                                                                    .reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        return;
                                                      }
                                                    } else {
                                                      return;
                                                    }
                                                  },
                                                  child: AutoSizeText(
                                                    stackPostRecord.description
                                                        .maybeHandleOverflow(
                                                      maxChars: 30,
                                                      replacement: '…',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    minFontSize: 15.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          7.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'USER_POST_COMP_Row_cgmqc3dg_ON_TAP');
                                          if (loggedIn) {
                                            logFirebaseEvent(
                                                'Row_google_analytics_event');
                                            logFirebaseEvent(
                                              'post_details',
                                              parameters: {
                                                'post':
                                                    stackPostRecord.reference,
                                                'user': currentUserReference,
                                                'time': getCurrentTimestamp,
                                              },
                                            );
                                            // PostModal
                                            logFirebaseEvent('Row_PostModal');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: PostDetailsModalWidget(
                                                    postParam: stackPostRecord
                                                        .reference,
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            if ((currentUserDocument
                                                            ?.postClicked
                                                            .toList() ??
                                                        [])
                                                    .contains(stackPostRecord
                                                        .reference) ==
                                                true) {
                                              logFirebaseEvent(
                                                  'Row_backend_call');

                                              await currentUserReference!
                                                  .update(createUserRecordData(
                                                clickedTime:
                                                    getCurrentTimestamp,
                                              ));
                                              return;
                                            } else {
                                              logFirebaseEvent(
                                                  'Row_backend_call');

                                              await currentUserReference!
                                                  .update({
                                                ...createUserRecordData(
                                                  clickedTime:
                                                      getCurrentTimestamp,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'Post_clicked':
                                                        FieldValue.arrayUnion([
                                                      stackPostRecord.reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                              return;
                                            }
                                          } else {
                                            return;
                                          }
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (dateTimeFormat(
                                                        "relative",
                                                        stackPostRecord
                                                            .startDate) !=
                                                    '')
                                              Text(
                                                dateTimeFormat("relative",
                                                    stackPostRecord.startDate!),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (false)
                          wrapWithModel(
                            model: _model.exclusivityMainfeedRowModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ExclusivityMainfeedRowWidget(
                              exclusivityType: stackPostRecord.exclusivityType,
                            ),
                          ),
                      ],
                    ),
                  ),
                ).animateOnActionTrigger(
                  animationsMap['containerOnActionTriggerAnimation']!,
                  effects: [
                    MoveEffect(
                      curve: Curves.easeInOut,
                      delay: 0.0.ms,
                      duration: 600.0.ms,
                      begin: Offset(0.0, 0.0),
                      end: Offset(_model.dragEnded ? 0.0 : 100.0, 0.0),
                    ),
                    ScaleEffect(
                      curve: Curves.easeInOut,
                      delay: 0.0.ms,
                      duration: 600.0.ms,
                      begin: Offset(1.0, 1.0),
                      end: Offset(1.0, _model.dragEnded ? 1.0 : 0.9),
                    ),
                    FadeEffect(
                      curve: Curves.easeInOut,
                      delay: 0.0.ms,
                      duration: 600.0.ms,
                      begin: 1.0,
                      end: _model.dragEnded ? 1.0 : 0.375,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
