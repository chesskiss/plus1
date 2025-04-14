import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/posts/post_details_modal/post_details_modal_widget.dart';
import '/components/posts/post_images/post_images_widget.dart';
import '/components/posts/post_menu/post_menu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'main_profile_post_model.dart';
export 'main_profile_post_model.dart';

/// Post component as shown on mainProfile, with options to delete, etc.
class MainProfilePostWidget extends StatefulWidget {
  const MainProfilePostWidget({
    super.key,
    required this.post,
  });

  final DocumentReference? post;

  @override
  State<MainProfilePostWidget> createState() => _MainProfilePostWidgetState();
}

class _MainProfilePostWidgetState extends State<MainProfilePostWidget> {
  late MainProfilePostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainProfilePostModel());

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

          final userPostPostRecord = snapshot.data!;

          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
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
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'MAIN_PROFILE_POST_Container_11m3orto_ON_');
                    // PostModal
                    logFirebaseEvent('PostImages_PostModal');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: PostDetailsModalWidget(
                            postParam: widget.post!,
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: wrapWithModel(
                    model: _model.postImagesModel,
                    updateCallback: () => safeSetState(() {}),
                    child: PostImagesWidget(
                      postImages: userPostPostRecord.photos,
                      heightPrecentage: 0.4,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'MAIN_PROFILE_POST_Text_tbm8vrya_ON_TAP');
                          logFirebaseEvent('Text_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: PostDetailsModalWidget(
                                  postParam: widget.post!,
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Text(
                          userPostPostRecord.title.maybeHandleOverflow(
                            maxChars: 25,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ToggleIcon(
                              onPressed: () async {
                                final likesElement = currentUserReference;
                                final likesUpdate = userPostPostRecord.likes
                                        .contains(likesElement)
                                    ? FieldValue.arrayRemove([likesElement])
                                    : FieldValue.arrayUnion([likesElement]);
                                await userPostPostRecord.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'likes': likesUpdate,
                                    },
                                  ),
                                });
                              },
                              value: userPostPostRecord.likes
                                  .contains(currentUserReference),
                              onIcon: Icon(
                                Icons.favorite_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 25.0,
                              ),
                              offIcon: Icon(
                                Icons.favorite_border,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 25.0,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'MAIN_PROFILE_POST_Text_hndjft6a_ON_TAP');
                                logFirebaseEvent('Text_navigate_to');

                                context.pushNamed(MainLikesWidget.routeName);
                              },
                              child: Text(
                                userPostPostRecord.likes.length.toString(),
                                style: FlutterFlowTheme.of(context)
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
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        buttonSize: 46.0,
                        icon: Icon(
                          Icons.keyboard_control,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 25.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'MAIN_PROFILE_POST_keyboard_control_ICN_O');
                          logFirebaseEvent('IconButton_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: PostMenuWidget(
                                  post: userPostPostRecord.reference,
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
