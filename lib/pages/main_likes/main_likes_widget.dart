import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/chat/match_prompt/match_prompt_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/web_components/posts_empty_list/posts_empty_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'main_likes_model.dart';
export 'main_likes_model.dart';

/// i added coloumn widget ,also fetch all  the Swuapable Tile from
/// Autenticated user's  follower feild
class MainLikesWidget extends StatefulWidget {
  const MainLikesWidget({super.key});

  static String routeName = 'mainLikes';
  static String routePath = '/mainLikes';

  @override
  State<MainLikesWidget> createState() => _MainLikesWidgetState();
}

class _MainLikesWidgetState extends State<MainLikesWidget> {
  late MainLikesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainLikesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'mainLikes'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MAIN_LIKES_PAGE_mainLikes_ON_INIT_STATE');
      // RemoveSwipedUsers
      logFirebaseEvent('mainLikes_RemoveSwipedUsers');
      _model.likes = functions
          .removeMultipleElementsFromList(
              (currentUserDocument?.followers.toList() ?? []).toList(),
              (currentUserDocument?.matches.toList() ?? []).toList())!
          .toList()
          .cast<DocumentReference>();
      safeSetState(() {});
      // RemoveSwipedUsers
      logFirebaseEvent('mainLikes_RemoveSwipedUsers');
      _model.likes = functions
          .removeMultipleElementsFromList(_model.likes.toList(),
              (currentUserDocument?.swiped.toList() ?? []).toList())!
          .toList()
          .cast<DocumentReference>();
      safeSetState(() {});
      // RemoveBlockedUsersAuth
      logFirebaseEvent('mainLikes_RemoveBlockedUsersAuth');
      _model.likes = functions
          .removeMultipleElementsFromList(_model.likes.toList(),
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Likes',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'Outfit',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
        ),
        body: Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Stack(
            alignment: AlignmentDirectional(0.0, 1.0),
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 1070.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) => Builder(
                              builder: (context) {
                                final usersLikeMe = _model.likes.toList();
                                if (usersLikeMe.isEmpty) {
                                  return PostsEmptyListWidget(
                                    title: 'No more likes at the moment',
                                    description:
                                        'Check out more events or create some to see more people here!',
                                  );
                                }

                                return FlutterFlowSwipeableStack(
                                  onSwipeFn: (index) {},
                                  onLeftSwipe: (index) async {
                                    logFirebaseEvent(
                                        'MAIN_LIKES_SwipeableStack_u1vccobq_ON_LE');
                                    final usersLikeMeItem = usersLikeMe[index];
                                    // add2swipes
                                    logFirebaseEvent(
                                        'SwipeableStack_add2swipes');

                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'swiped': FieldValue.arrayUnion(
                                              [usersLikeMeItem]),
                                        },
                                      ),
                                    });
                                  },
                                  onRightSwipe: (index) async {
                                    logFirebaseEvent(
                                        'MAIN_LIKES_SwipeableStack_u1vccobq_ON_RI');
                                    final usersLikeMeItem = usersLikeMe[index];
                                    // AuthChange
                                    logFirebaseEvent(
                                        'SwipeableStack_AuthChange');

                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'swiped': FieldValue.arrayUnion(
                                              [usersLikeMeItem]),
                                          'matches': FieldValue.arrayUnion(
                                              [usersLikeMeItem]),
                                          'following': FieldValue.arrayUnion(
                                              [usersLikeMeItem]),
                                        },
                                      ),
                                    });
                                    // addAuthMatch
                                    logFirebaseEvent(
                                        'SwipeableStack_addAuthMatch');

                                    await usersLikeMeItem.update({
                                      ...createUserRecordData(
                                        profileNotification: true,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'matches': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                          'followers': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                    // create chat
                                    logFirebaseEvent(
                                        'SwipeableStack_createchat');

                                    var chatRecordReference =
                                        ChatRecord.collection.doc();
                                    await chatRecordReference.set({
                                      ...createChatRecordData(
                                        lastMessage: '\"\"',
                                        userA: usersLikeMeItem,
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
                                              usersLikeMeItem,
                                              currentUserReference!),
                                        },
                                      ),
                                    });
                                    _model.chatmaked =
                                        ChatRecord.getDocumentFromData({
                                      ...createChatRecordData(
                                        lastMessage: '\"\"',
                                        userA: usersLikeMeItem,
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
                                              usersLikeMeItem,
                                              currentUserReference!),
                                        },
                                      ),
                                    }, chatRecordReference);
                                    // chat init
                                    logFirebaseEvent('SwipeableStack_chatinit');

                                    await _model.chatmaked!.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'users': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                    // match
                                    logFirebaseEvent('SwipeableStack_match');
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
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: MatchPromptWidget(
                                              user: usersLikeMeItem,
                                              chat: _model.chatmaked!,
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    safeSetState(() {});
                                  },
                                  onUpSwipe: (index) {},
                                  onDownSwipe: (index) {},
                                  itemBuilder: (context, usersLikeMeIndex) {
                                    final usersLikeMeItem =
                                        usersLikeMe[usersLikeMeIndex];
                                    return StreamBuilder<UserRecord>(
                                      stream: UserRecord.getDocument(
                                          usersLikeMeItem),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
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

                                        final stackUserRecord = snapshot.data!;

                                        return Stack(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              constraints: BoxConstraints(
                                                maxHeight:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.5,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'MAIN_LIKES_MediaDisplay_5rufonam_ON_TAP');
                                                  logFirebaseEvent(
                                                      'MediaDisplay_navigate_to');

                                                  context.pushNamed(
                                                    StrangerProfileWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'profile': serializeParam(
                                                        usersLikeMeItem,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: FlutterFlowMediaDisplay(
                                                  path: stackUserRecord
                                                      .photos.firstOrNull!,
                                                  imageBuilder: (path) =>
                                                      ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      path,
                                                      fit: BoxFit.scaleDown,
                                                    ),
                                                  ),
                                                  videoPlayerBuilder: (path) =>
                                                      FlutterFlowVideoPlayer(
                                                    path: path,
                                                    autoPlay: false,
                                                    looping: true,
                                                    showControls: true,
                                                    allowFullScreen: false,
                                                    allowPlaybackSpeedMenu:
                                                        false,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderRadius: 30.0,
                                                    buttonSize:
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .width *
                                                            0.15,
                                                    fillColor:
                                                        Color(0xFFE84F4F),
                                                    icon: Icon(
                                                      Icons.arrow_back,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'MAIN_LIKES_PAGE_arrow_back_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_swipeable_stack');
                                                      _model
                                                          .swipeableStackController
                                                          .swipeLeft();
                                                    },
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderRadius: 20.0,
                                                    buttonSize:
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .width *
                                                            0.15,
                                                    fillColor:
                                                        Color(0xFF4FE852),
                                                    icon: Icon(
                                                      Icons.favorite,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'MAIN_LIKES_PAGE_favorite_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_swipeable_stack');
                                                      _model
                                                          .swipeableStackController
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
                                  itemCount: usersLikeMe.length,
                                  controller: _model.swipeableStackController,
                                  loop: false,
                                  cardDisplayCount: 3,
                                  scale: 0.9,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavBarWidget(
                    tab: TabEnums.Likes,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
