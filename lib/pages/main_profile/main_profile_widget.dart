import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/chat/empty_state_simple/empty_state_simple_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/posts/main_profile_post/main_profile_post_widget.dart';
import '/components/posts/user_post/user_post_widget.dart';
import '/components/user_list/user_list_widget.dart';
import '/components/web_components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'main_profile_model.dart';
export 'main_profile_model.dart';

class MainProfileWidget extends StatefulWidget {
  const MainProfileWidget({super.key});

  static String routeName = 'mainProfile';
  static String routePath = '/mainProfile';

  @override
  State<MainProfileWidget> createState() => _MainProfileWidgetState();
}

class _MainProfileWidgetState extends State<MainProfileWidget>
    with TickerProviderStateMixin {
  late MainProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainProfileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'mainProfile'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MAIN_PROFILE_mainProfile_ON_INIT_STATE');
      logFirebaseEvent('mainProfile_update_page_state');
      _model.invitations = (currentUserDocument?.invitations.toList() ?? [])
          .where((e) => e.status == Status.accepted)
          .toList()
          .map((e) => e.sender)
          .withoutNulls
          .toList()
          .toList()
          .cast<DocumentReference>();
      _model.invitersAndMatches = (currentUserDocument?.matches.toList() ?? [])
          .toList()
          .cast<DocumentReference>();
      safeSetState(() {});
      logFirebaseEvent('mainProfile_update_page_state');
      _model.invitersAndMatches = functions
          .removeMultipleElementsFromList(
              _model.invitersAndMatches.toList(), _model.invitations.toList())!
          .toList()
          .cast<DocumentReference>();
      safeSetState(() {});
      logFirebaseEvent('mainProfile_update_page_state');
      _model.invitersAndMatches = functions
          .merge2userLists(
              _model.invitersAndMatches.toList(), _model.invitations.toList())!
          .toList()
          .cast<DocumentReference>();
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          wrapWithModel(
            model: _model.sideNavModel,
            updateCallback: () => safeSetState(() {}),
            child: SideNavWidget(
              selectedNav: 3,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 1070.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Container(
                                width: 300.0,
                                height: 64.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 32.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: Icon(
                                      Icons.star_half,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 44.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: Text(
                                        'Plus1',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge
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
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              constraints: BoxConstraints(
                                maxWidth: 870.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                0.85, 0.68),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(2.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        InkWell(
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
                                                            'MAIN_PROFILE_PAGE_Image_yavnk3ou_ON_TAP');
                                                        // ExpandImage
                                                        logFirebaseEvent(
                                                            'Image_ExpandImage');
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                (currentUserDocument
                                                                            ?.photos
                                                                            .toList() ??
                                                                        [])
                                                                    .firstOrNull!,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: (currentUserDocument
                                                                          ?.photos
                                                                          .toList() ??
                                                                      [])
                                                                  .firstOrNull!,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: (currentUserDocument
                                                                    ?.photos
                                                                    .toList() ??
                                                                [])
                                                            .firstOrNull!,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            (currentUserDocument
                                                                        ?.photos
                                                                        .toList() ??
                                                                    [])
                                                                .firstOrNull!,
                                                            width: 300.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'MAIN_PROFILE_PAGE_Column_wto1wo7n_ON_TAP');
                                                logFirebaseEvent(
                                                    'Column_navigate_to');

                                                context.pushNamed(
                                                  StrangerProfileWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'profile': serializeParam(
                                                      currentUserReference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      currentUserDisplayName,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            letterSpacing: 0.0,
                                                          ),
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 8.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'MAIN_PROFILE_SETTINGS__PROFILE_BTN_ON_TA');
                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamed(
                                          EditSettingsWidget.routeName,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .bottomToTop,
                                              duration:
                                                  Duration(milliseconds: 250),
                                            ),
                                          },
                                        );
                                      },
                                      text: 'Settings & Profile',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment(0.0, 0),
                                          child: TabBar(
                                            isScrollable: true,
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Figtree',
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                            unselectedLabelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Figtree',
                                                      letterSpacing: 0.0,
                                                    ),
                                            indicatorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            indicatorWeight: 2.0,
                                            tabs: [
                                              Tab(
                                                text: 'My activities',
                                              ),
                                              Tab(
                                                text: 'Chats',
                                              ),
                                              Tab(
                                                text: 'Saved Events',
                                              ),
                                            ],
                                            controller: _model.tabBarController,
                                            onTap: (i) async {
                                              [
                                                () async {},
                                                () async {
                                                  logFirebaseEvent(
                                                      'MAIN_PROFILE_PAGE_Tab_ewxurlel_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Tab_backend_call');

                                                  await currentUserReference!
                                                      .update(
                                                          createUserRecordData(
                                                    profileNotification: false,
                                                  ));
                                                },
                                                () async {}
                                              ][i]();
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            controller: _model.tabBarController,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 32.0),
                                                child: StreamBuilder<
                                                    List<PostRecord>>(
                                                  stream: queryPostRecord(
                                                    queryBuilder:
                                                        (postRecord) =>
                                                            postRecord
                                                                .where(
                                                                  'op',
                                                                  isEqualTo:
                                                                      currentUserReference,
                                                                )
                                                                .where(
                                                                  'deleted',
                                                                  isEqualTo:
                                                                      false,
                                                                ),
                                                  ),
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
                                                    List<PostRecord>
                                                        socialFeedPostRecordList =
                                                        snapshot.data!;
                                                    if (socialFeedPostRecordList
                                                        .isEmpty) {
                                                      return Center(
                                                        child: Image.asset(
                                                          'assets/images/emptyPosts@2x.png',
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.5,
                                                          height: 400.0,
                                                        ),
                                                      );
                                                    }

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          socialFeedPostRecordList
                                                              .length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 1.0),
                                                      itemBuilder: (context,
                                                          socialFeedIndex) {
                                                        final socialFeedPostRecord =
                                                            socialFeedPostRecordList[
                                                                socialFeedIndex];
                                                        return MainProfilePostWidget(
                                                          key: Key(
                                                              'Keyamd_${socialFeedIndex}_of_${socialFeedPostRecordList.length}'),
                                                          post:
                                                              socialFeedPostRecord
                                                                  .reference,
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  final matches = _model
                                                      .invitersAndMatches
                                                      .toList();
                                                  if (matches.isEmpty) {
                                                    return Center(
                                                      child:
                                                          EmptyStateSimpleWidget(
                                                        icon: Icon(
                                                          Icons.groups_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 72.0,
                                                        ),
                                                        title: 'No Friends',
                                                        body:
                                                            'You don\'t have any friends... Yet ;)',
                                                      ),
                                                    );
                                                  }

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: matches.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 1.0),
                                                    itemBuilder: (context,
                                                        matchesIndex) {
                                                      final matchesItem =
                                                          matches[matchesIndex];
                                                      return UserListWidget(
                                                        key: Key(
                                                            'Keye69_${matchesIndex}_of_${matches.length}'),
                                                        match: matchesItem,
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    StreamBuilder<
                                                        List<PostRecord>>(
                                                      stream: queryPostRecord(
                                                        queryBuilder: (postRecord) =>
                                                            postRecord
                                                                .where(
                                                                  'deleted',
                                                                  isEqualTo:
                                                                      false,
                                                                )
                                                                .where(
                                                                  'saves',
                                                                  arrayContains:
                                                                      currentUserReference,
                                                                )
                                                                .orderBy(
                                                                    'timePosted',
                                                                    descending:
                                                                        true),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        List<PostRecord>
                                                            listViewPostRecordList =
                                                            snapshot.data!;

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewPostRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewPostRecord =
                                                                listViewPostRecordList[
                                                                    listViewIndex];
                                                            return UserPostWidget(
                                                              key: Key(
                                                                  'Keyntz_${listViewIndex}_of_${listViewPostRecordList.length}'),
                                                              post:
                                                                  listViewPostRecord
                                                                      .reference,
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavBarWidget(
                      tab: TabEnums.Profile,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
