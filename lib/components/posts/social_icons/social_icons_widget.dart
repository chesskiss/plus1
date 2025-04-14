import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat/match_prompt/match_prompt_widget.dart';
import '/components/posts/post_details_modal/post_details_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'social_icons_model.dart';
export 'social_icons_model.dart';

/// "Try it" and "save for later" buttons.
///
/// Will be toggled if user already clicked on them in the past, and upon
/// clicking will add to remove activity from the proper list.
class SocialIconsWidget extends StatefulWidget {
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 8.0, 0.0),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 41.0,
                    height: 41.0,
                    child: Stack(
                      children: [
                        Builder(
                          builder: (context) => ToggleIcon(
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
                              logFirebaseEvent(
                                  'SOCIAL_ICONS_ToggleIcon_ky8iwfnk_ON_TOGG');
                              var _shouldSetState = false;
                              if (loggedIn &&
                                  (socialIconsPostRecord.op !=
                                      currentUserReference)) {
                                if (socialIconsPostRecord.likes
                                    .contains(currentUserReference)) {
                                  // RemoveFromPostLikersList
                                  logFirebaseEvent(
                                      'ToggleIcon_RemoveFromPostLikersList');

                                  await widget.post!.update({
                                    ...mapToFirestore(
                                      {
                                        'likes': FieldValue.arrayRemove(
                                            [currentUserReference]),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('ToggleIcon_backend_call');

                                  await socialIconsPostRecord.op!.update({
                                    ...mapToFirestore(
                                      {
                                        'followers': FieldValue.arrayRemove(
                                            [currentUserReference]),
                                      },
                                    ),
                                  });
                                  // remopfollowing
                                  logFirebaseEvent('ToggleIcon_remopfollowing');

                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'likedPosts': FieldValue.arrayRemove(
                                            [widget.post]),
                                        'following': FieldValue.arrayRemove(
                                            [socialIconsPostRecord.op]),
                                      },
                                    ),
                                  });
                                  if ((currentUserDocument?.matches.toList() ??
                                          [])
                                      .contains(socialIconsPostRecord.op)) {
                                    // unmatch?
                                    logFirebaseEvent('ToggleIcon_unmatch');
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Would you also like to unmatch from the user?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      // remopmatchAuth
                                      logFirebaseEvent(
                                          'ToggleIcon_remopmatchAuth');

                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'matches': FieldValue.arrayRemove(
                                                [socialIconsPostRecord.op]),
                                          },
                                        ),
                                      });
                                      // removematchOP
                                      logFirebaseEvent(
                                          'ToggleIcon_removematchOP');

                                      await socialIconsPostRecord.op!.update({
                                        ...mapToFirestore(
                                          {
                                            'matches': FieldValue.arrayRemove(
                                                [currentUserReference]),
                                          },
                                        ),
                                      });
                                    }
                                  }
                                } else {
                                  // AddToPostLikersList
                                  logFirebaseEvent(
                                      'ToggleIcon_AddToPostLikersList');

                                  await widget.post!.update({
                                    ...mapToFirestore(
                                      {
                                        'likes': FieldValue.arrayUnion(
                                            [currentUserReference]),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('ToggleIcon_backend_call');

                                  await socialIconsPostRecord.op!.update({
                                    ...mapToFirestore(
                                      {
                                        'followers': FieldValue.arrayUnion(
                                            [currentUserReference]),
                                      },
                                    ),
                                  });
                                  // remopfollowing
                                  logFirebaseEvent('ToggleIcon_remopfollowing');

                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'likedPosts': FieldValue.arrayUnion(
                                            [widget.post]),
                                        'following': FieldValue.arrayUnion(
                                            [socialIconsPostRecord.op]),
                                      },
                                    ),
                                  });
                                  if ((currentUserDocument?.followers
                                                  .toList() ??
                                              [])
                                          .contains(socialIconsPostRecord.op) &&
                                      !(currentUserDocument?.matches
                                                  .toList() ??
                                              [])
                                          .contains(socialIconsPostRecord.op)) {
                                    // addMatch
                                    logFirebaseEvent('ToggleIcon_addMatch');

                                    await socialIconsPostRecord.op!.update({
                                      ...createUserRecordData(
                                        profileNotification: true,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'matches': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                    // addMatchAuth
                                    logFirebaseEvent('ToggleIcon_addMatchAuth');

                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'matches': FieldValue.arrayUnion(
                                              [socialIconsPostRecord.op]),
                                        },
                                      ),
                                    });
                                    // create chat
                                    logFirebaseEvent('ToggleIcon_createchat');

                                    var chatRecordReference =
                                        ChatRecord.collection.doc();
                                    await chatRecordReference.set({
                                      ...createChatRecordData(
                                        lastMessage: '\"\"',
                                        userA: socialIconsPostRecord.op,
                                        userB: currentUserReference,
                                        groupChatId: random_data.randomInteger(
                                            0, 100000),
                                        email: currentUserEmail,
                                        displayName: currentUserDisplayName,
                                        photoUrl: currentUserPhoto,
                                        uid: currentUserUid,
                                        phoneNumber: currentPhoneNumber,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'last_message_seen_by': [
                                            currentUserReference
                                          ],
                                          'last_message_sent_by': [
                                            currentUserReference
                                          ],
                                          'created_time':
                                              FieldValue.serverTimestamp(),
                                          'users': functions.merge2Users(
                                              currentUserReference!,
                                              socialIconsPostRecord.op!),
                                        },
                                      ),
                                    });
                                    _model.chatmaked =
                                        ChatRecord.getDocumentFromData({
                                      ...createChatRecordData(
                                        lastMessage: '\"\"',
                                        userA: socialIconsPostRecord.op,
                                        userB: currentUserReference,
                                        groupChatId: random_data.randomInteger(
                                            0, 100000),
                                        email: currentUserEmail,
                                        displayName: currentUserDisplayName,
                                        photoUrl: currentUserPhoto,
                                        uid: currentUserUid,
                                        phoneNumber: currentPhoneNumber,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'last_message_seen_by': [
                                            currentUserReference
                                          ],
                                          'last_message_sent_by': [
                                            currentUserReference
                                          ],
                                          'created_time': DateTime.now(),
                                          'users': functions.merge2Users(
                                              currentUserReference!,
                                              socialIconsPostRecord.op!),
                                        },
                                      ),
                                    }, chatRecordReference);
                                    _shouldSetState = true;
                                    logFirebaseEvent('ToggleIcon_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('checkpoint'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    // match
                                    logFirebaseEvent('ToggleIcon_match');
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: MatchPromptWidget(
                                            user: socialIconsPostRecord.op!,
                                            chat: _model.chatmaked!,
                                          ),
                                        );
                                      },
                                    );
                                  }
                                }

                                logFirebaseEvent(
                                    'ToggleIcon_google_analytics_event');
                                logFirebaseEvent(
                                  'Like_clicked',
                                  parameters: {
                                    'User': currentUserReference,
                                    'Time': getCurrentTimestamp,
                                    'Post': widget.post,
                                    'Like_added': socialIconsPostRecord.likes
                                        .contains(currentUserReference),
                                  },
                                );
                              } else {
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              if (_shouldSetState) safeSetState(() {});
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
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Try it',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Figtree',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 3.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'SOCIAL_ICONS_COMP_Icon_xh38wnqz_ON_TAP');
                        if (loggedIn) {
                          logFirebaseEvent('Icon_google_analytics_event');
                          logFirebaseEvent(
                            'post_details',
                            parameters: {
                              'post': socialIconsPostRecord.reference,
                              'user': currentUserReference,
                              'time': getCurrentTimestamp,
                            },
                          );
                          // PostModal
                          logFirebaseEvent('Icon_PostModal');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: PostDetailsModalWidget(
                                  postParam: socialIconsPostRecord.reference,
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));

                          if ((currentUserDocument?.postClicked.toList() ?? [])
                                  .contains(widget.post) ==
                              true) {
                            logFirebaseEvent('Icon_backend_call');

                            await currentUserReference!
                                .update(createUserRecordData(
                              clickedTime: getCurrentTimestamp,
                            ));
                            return;
                          } else {
                            logFirebaseEvent('Icon_backend_call');

                            await currentUserReference!.update({
                              ...createUserRecordData(
                                clickedTime: getCurrentTimestamp,
                              ),
                              ...mapToFirestore(
                                {
                                  'Post_clicked':
                                      FieldValue.arrayUnion([widget.post]),
                                },
                              ),
                            });
                            return;
                          }
                        } else {
                          return;
                        }
                      },
                      child: Icon(
                        Icons.interests_sharp,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 25.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'SOCIAL_ICONS_COMP_more_details_ON_TAP');
                        if (loggedIn) {
                          logFirebaseEvent(
                              'more_details_google_analytics_event');
                          logFirebaseEvent(
                            'post_details',
                            parameters: {
                              'post': socialIconsPostRecord.reference,
                              'user': currentUserReference,
                              'time': getCurrentTimestamp,
                            },
                          );
                          // PostModal
                          logFirebaseEvent('more_details_PostModal');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: PostDetailsModalWidget(
                                  postParam: socialIconsPostRecord.reference,
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));

                          if ((currentUserDocument?.postClicked.toList() ?? [])
                                  .contains(widget.post) ==
                              true) {
                            logFirebaseEvent('more_details_backend_call');

                            await currentUserReference!
                                .update(createUserRecordData(
                              clickedTime: getCurrentTimestamp,
                            ));
                            return;
                          } else {
                            logFirebaseEvent('more_details_backend_call');

                            await currentUserReference!.update({
                              ...createUserRecordData(
                                clickedTime: getCurrentTimestamp,
                              ),
                              ...mapToFirestore(
                                {
                                  'Post_clicked':
                                      FieldValue.arrayUnion([widget.post]),
                                },
                              ),
                            });
                            return;
                          }
                        } else {
                          return;
                        }
                      },
                      child: Text(
                        'See more',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Figtree',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: ToggleIcon(
                        onPressed: () async {
                          final savesElement = currentUserReference;
                          final savesUpdate =
                              socialIconsPostRecord.saves.contains(savesElement)
                                  ? FieldValue.arrayRemove([savesElement])
                                  : FieldValue.arrayUnion([savesElement]);
                          await socialIconsPostRecord.reference.update({
                            ...mapToFirestore(
                              {
                                'saves': savesUpdate,
                              },
                            ),
                          });
                          logFirebaseEvent(
                              'SOCIAL_ICONS_ToggleIcon_4d21it29_ON_TOGG');
                          if (loggedIn) {
                            if (socialIconsPostRecord.saves
                                .contains(currentUserReference)) {
                              // RemoveFromUserSavedList
                              logFirebaseEvent(
                                  'ToggleIcon_RemoveFromUserSavedList');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'savedPosts':
                                        FieldValue.arrayRemove([widget.post]),
                                  },
                                ),
                              });
                              // RemoveFromPostSavedList
                              logFirebaseEvent(
                                  'ToggleIcon_RemoveFromPostSavedList');

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
                              logFirebaseEvent('ToggleIcon_AddToUserSavedList');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'savedPosts':
                                        FieldValue.arrayUnion([widget.post]),
                                  },
                                ),
                              });
                              // AddToPostSavedList
                              logFirebaseEvent('ToggleIcon_AddToPostSavedList');

                              await widget.post!.update({
                                ...mapToFirestore(
                                  {
                                    'saves': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                            }

                            logFirebaseEvent(
                                'ToggleIcon_google_analytics_event');
                            logFirebaseEvent(
                              'Save_clicked',
                              parameters: {
                                'User': currentUserReference,
                                'Time': getCurrentTimestamp,
                                'Post': widget.post,
                                'Save_added': socialIconsPostRecord.saves
                                    .contains(currentUserReference),
                              },
                            );
                          }
                        },
                        value: socialIconsPostRecord.saves
                            .contains(currentUserReference),
                        onIcon: FaIcon(
                          FontAwesomeIcons.solidBookmark,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 25.0,
                        ),
                        offIcon: Icon(
                          Icons.bookmark_border,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 25.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
