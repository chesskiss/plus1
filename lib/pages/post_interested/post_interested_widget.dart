import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat/match_prompt/match_prompt_widget.dart';
import '/components/web_components/posts_empty_list/posts_empty_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'post_interested_model.dart';
export 'post_interested_model.dart';

/// People who ar interested in a particular event.
class PostInterestedWidget extends StatefulWidget {
  const PostInterestedWidget({
    super.key,
    required this.post,
  });

  final PostRecord? post;

  static String routeName = 'PostInterested';
  static String routePath = '/postInterested';

  @override
  State<PostInterestedWidget> createState() => _PostInterestedWidgetState();
}

class _PostInterestedWidgetState extends State<PostInterestedWidget> {
  late PostInterestedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostInterestedModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PostInterested'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('POST_INTERESTED_PostInterested_ON_INIT_S');
      // setState2likes
      logFirebaseEvent('PostInterested_setState2likes');
      _model.newInterestedUsers =
          widget.post!.likes.toList().cast<DocumentReference>();
      safeSetState(() {});
      // addOP
      logFirebaseEvent('PostInterested_addOP');
      _model.insertAtIndexInNewInterestedUsers(0, widget.post!.op!);
      safeSetState(() {});
      // RemoveSwipedUsers
      logFirebaseEvent('PostInterested_RemoveSwipedUsers');
      _model.newInterestedUsers = functions
          .removeMultipleElementsFromList(_model.newInterestedUsers.toList(),
              (currentUserDocument?.swiped.toList() ?? []).toList())!
          .toList()
          .cast<DocumentReference>();
      safeSetState(() {});
      // RemoveMatches
      logFirebaseEvent('PostInterested_RemoveMatches');
      _model.newInterestedUsers = functions
          .removeMultipleElementsFromList(_model.newInterestedUsers.toList(),
              (currentUserDocument?.matches.toList() ?? []).toList())!
          .toList()
          .cast<DocumentReference>();
      safeSetState(() {});
      // RemoveAuth
      logFirebaseEvent('PostInterested_RemoveAuth');
      _model.removeFromNewInterestedUsers(currentUserReference!);
      safeSetState(() {});
      // RemoveBlockedUsersAuth
      logFirebaseEvent('PostInterested_RemoveBlockedUsersAuth');
      _model.newInterestedUsers = functions
          .removeMultipleElementsFromList(_model.newInterestedUsers.toList(),
              (currentUserDocument?.blockUsers.toList() ?? []).toList())!
          .toList()
          .cast<DocumentReference>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  'Users who liked the post',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Logo design',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    hoverColor: FlutterFlowTheme.of(context).tertiary,
                    icon: Icon(
                      Icons.arrow_forward,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'POST_INTERESTED_arrow_forward_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                    },
                  ),
                ),
              ),
            ].divide(SizedBox(width: 5.0)),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) => Builder(
              builder: (context) {
                final newInterested = _model.newInterestedUsers.toList();
                if (newInterested.isEmpty) {
                  return PostsEmptyListWidget(
                    title: 'No more people here',
                    description:
                        'You went through all the people who are interested in this event! Wait a bit for more to join',
                    post: widget.post,
                  );
                }

                return FlutterFlowSwipeableStack(
                  onSwipeFn: (index) {},
                  onLeftSwipe: (index) async {
                    logFirebaseEvent(
                        'POST_INTERESTED_SwipeableStack_77c94yfu_');
                    final newInterestedItem = newInterested[index];
                    logFirebaseEvent('SwipeableStack_backend_call');

                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'swiped': FieldValue.arrayUnion([newInterestedItem]),
                          'following':
                              FieldValue.arrayRemove([newInterestedItem]),
                        },
                      ),
                    });
                    logFirebaseEvent('SwipeableStack_backend_call');

                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'followers':
                              FieldValue.arrayRemove([currentUserReference]),
                        },
                      ),
                    });
                  },
                  onRightSwipe: (index) async {
                    logFirebaseEvent(
                        'POST_INTERESTED_SwipeableStack_77c94yfu_');
                    final newInterestedItem = newInterested[index];
                    // i++
                    logFirebaseEvent('SwipeableStack_i');
                    _model.index = _model.index! + 1;
                    logFirebaseEvent('SwipeableStack_backend_call');
                    unawaited(
                      () async {
                        await newInterestedItem.update({
                          ...mapToFirestore(
                            {
                              'followers':
                                  FieldValue.arrayUnion([currentUserReference]),
                            },
                          ),
                        });
                      }(),
                    );
                    // add2swiped&following
                    logFirebaseEvent('SwipeableStack_add2swipedfollowing');
                    unawaited(
                      () async {
                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'swiped':
                                  FieldValue.arrayUnion([newInterestedItem]),
                              'following':
                                  FieldValue.arrayUnion([newInterestedItem]),
                            },
                          ),
                        });
                      }(),
                    );
                    // isBlocked
                    logFirebaseEvent('SwipeableStack_isBlocked');
                    _model.blocked = await actions.isBlocked(
                      currentUserReference!,
                      newInterestedItem,
                    );
                    if (!_model.blocked! &&
                        (currentUserDocument?.followers.toList() ?? [])
                            .contains(newInterestedItem)) {
                      // addAuthMatch
                      logFirebaseEvent('SwipeableStack_addAuthMatch');
                      unawaited(
                        () async {
                          await newInterestedItem.update({
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
                        }(),
                      );
                      // addUserMatch
                      logFirebaseEvent('SwipeableStack_addUserMatch');
                      unawaited(
                        () async {
                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'matches':
                                    FieldValue.arrayUnion([newInterestedItem]),
                              },
                            ),
                          });
                        }(),
                      );
                      // create chat
                      logFirebaseEvent('SwipeableStack_createchat');

                      var chatRecordReference = ChatRecord.collection.doc();
                      await chatRecordReference.set({
                        ...createChatRecordData(
                          lastMessage: '\"\"',
                          userA: newInterestedItem,
                          userB: currentUserReference,
                          groupChatId: random_data.randomInteger(0, 100000),
                          email: currentUserEmail,
                          displayName: currentUserDisplayName,
                          photoUrl: currentUserPhoto,
                          uid: currentUserUid,
                          phoneNumber: currentPhoneNumber,
                        ),
                        ...mapToFirestore(
                          {
                            'last_message_seen_by': [currentUserReference],
                            'last_message_sent_by': [currentUserReference],
                            'created_time': FieldValue.serverTimestamp(),
                            'users': functions.merge2Users(
                                newInterestedItem, currentUserReference!),
                          },
                        ),
                      });
                      _model.chatmaked = ChatRecord.getDocumentFromData({
                        ...createChatRecordData(
                          lastMessage: '\"\"',
                          userA: newInterestedItem,
                          userB: currentUserReference,
                          groupChatId: random_data.randomInteger(0, 100000),
                          email: currentUserEmail,
                          displayName: currentUserDisplayName,
                          photoUrl: currentUserPhoto,
                          uid: currentUserUid,
                          phoneNumber: currentPhoneNumber,
                        ),
                        ...mapToFirestore(
                          {
                            'last_message_seen_by': [currentUserReference],
                            'last_message_sent_by': [currentUserReference],
                            'created_time': DateTime.now(),
                            'users': functions.merge2Users(
                                newInterestedItem, currentUserReference!),
                          },
                        ),
                      }, chatRecordReference);
                      // match
                      logFirebaseEvent('SwipeableStack_match');
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(dialogContext).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: MatchPromptWidget(
                                user: newInterestedItem,
                                chat: _model.chatmaked!,
                              ),
                            ),
                          );
                        },
                      );
                    }
                    if (_model.newInterestedUsers.length <= _model.index!) {
                      logFirebaseEvent('SwipeableStack_update_page_state');
                      _model.newInterestedUsers = [];
                      safeSetState(() {});
                    }

                    safeSetState(() {});
                  },
                  onUpSwipe: (index) {},
                  onDownSwipe: (index) {},
                  itemBuilder: (context, newInterestedIndex) {
                    final newInterestedItem = newInterested[newInterestedIndex];
                    return StreamBuilder<UserRecord>(
                      stream: UserRecord.getDocument(newInterestedItem),
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

                        final stackUserRecord = snapshot.data!;

                        return Stack(
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'POST_INTERESTED_Image_m7126nio_ON_TAP');
                                logFirebaseEvent('Image_navigate_to');

                                context.pushNamed(
                                  StrangerProfileWidget.routeName,
                                  queryParameters: {
                                    'profile': serializeParam(
                                      newInterestedItem,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  stackUserRecord.photos.firstOrNull!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            if (stackUserRecord.reference == widget.post?.op)
                              Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'OP',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FlutterFlowIconButton(
                                    borderRadius: 30.0,
                                    buttonSize:
                                        MediaQuery.sizeOf(context).width * 0.15,
                                    fillColor: Color(0xFFE84F4F),
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'POST_INTERESTED_arrow_back_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_swipeable_stack');
                                      _model.swipeableStackController
                                          .swipeLeft();
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderRadius: 20.0,
                                    buttonSize:
                                        MediaQuery.sizeOf(context).width * 0.15,
                                    fillColor: Color(0xFF4FE852),
                                    icon: Icon(
                                      Icons.favorite,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'POST_INTERESTED_PAGE_favorite_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_swipeable_stack');
                                      _model.swipeableStackController
                                          .swipeRight();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  itemCount: newInterested.length,
                  controller: _model.swipeableStackController,
                  loop: false,
                  cardDisplayCount: 3,
                  scale: 0.9,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
