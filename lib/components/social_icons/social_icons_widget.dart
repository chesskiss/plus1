import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'social_icons_model.dart';
export 'social_icons_model.dart';

class SocialIconsWidget extends StatefulWidget {
  /// "Try it" and "save for later" buttons.  Will be toggled if user already
  /// clicked on them in the past, and upon clicking will add to remove activity
  /// from the proper list.
  const SocialIconsWidget({
    super.key,
    required this.post,
  });

  final DocumentReference? post;

  @override
  State<SocialIconsWidget> createState() => _SocialIconsWidgetState();
}

class _SocialIconsWidgetState extends State<SocialIconsWidget> {
  late SocialIconsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialIconsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 0.0),
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

          final socialIconsPostRecord = snapshot.data!;

          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 41.0,
                      height: 41.0,
                      child: Stack(
                        children: [
                          ToggleIcon(
                            onPressed: () async {
                              final likesElement = currentUserReference;
                              final likesUpdate = socialIconsPostRecord.likes
                                      .contains(likesElement)
                                  ? FieldValue.arrayRemove([likesElement])
                                  : FieldValue.arrayUnion([likesElement]);
                              await socialIconsPostRecord.reference.update({
                                ...mapToFirestore(
                                  {
                                    'likes': likesUpdate,
                                  },
                                ),
                              });
                              if (socialIconsPostRecord.likes
                                  .contains(currentUserReference)) {
                                // RemoveFromUserLikedList

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'likedPosts': FieldValue.arrayRemove(
                                          [widget.post]),
                                    },
                                  ),
                                });
                                // RemoveFromPostLikersList

                                await widget.post!.update({
                                  ...mapToFirestore(
                                    {
                                      'likes': FieldValue.arrayRemove(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              } else {
                                // AddToUserLikedList

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'likedPosts':
                                          FieldValue.arrayUnion([widget.post]),
                                    },
                                  ),
                                });
                                // AddToPostLikersList

                                await widget.post!.update({
                                  ...mapToFirestore(
                                    {
                                      'likes': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              }
                            },
                            value: socialIconsPostRecord.likes
                                .contains(currentUserReference),
                            onIcon: Icon(
                              Icons.favorite,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 25.0,
                            ),
                            offIcon: Icon(
                              Icons.favorite_border,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 25.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Try it',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 41.0,
                    height: 41.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: ToggleIcon(
                            onPressed: () async {
                              final savesElement = currentUserReference;
                              final savesUpdate = socialIconsPostRecord.saves
                                      .contains(savesElement)
                                  ? FieldValue.arrayRemove([savesElement])
                                  : FieldValue.arrayUnion([savesElement]);
                              await socialIconsPostRecord.reference.update({
                                ...mapToFirestore(
                                  {
                                    'saves': savesUpdate,
                                  },
                                ),
                              });
                              if (socialIconsPostRecord.saves
                                  .contains(currentUserReference)) {
                                // RemoveFromUserSavedList

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'savedPosts': FieldValue.arrayRemove(
                                          [widget.post]),
                                    },
                                  ),
                                });
                                // RemoveFromPostSavedList

                                await widget.post!.update({
                                  ...mapToFirestore(
                                    {
                                      'saves': FieldValue.arrayRemove(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              } else {
                                // AddToUserSavedList

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'savedPosts':
                                          FieldValue.arrayUnion([widget.post]),
                                    },
                                  ),
                                });
                                // AddToPostSavedList

                                await widget.post!.update({
                                  ...mapToFirestore(
                                    {
                                      'saves': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              }
                            },
                            value: socialIconsPostRecord.saves
                                .contains(currentUserReference),
                            onIcon: Icon(
                              Icons.check_box,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 25.0,
                            ),
                            offIcon: Icon(
                              Icons.check_box_outline_blank,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 25.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Save activity for later',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Figtree',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
