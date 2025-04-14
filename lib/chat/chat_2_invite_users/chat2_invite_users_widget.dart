import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/chat/empty_state_simple/empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'chat2_invite_users_model.dart';
export 'chat2_invite_users_model.dart';

class Chat2InviteUsersWidget extends StatefulWidget {
  const Chat2InviteUsersWidget({
    super.key,
    this.chatRef,
    this.filiteredUsers,
  });

  final ChatRecord? chatRef;

  /// Returned result after searching
  final List<UserRecord>? filiteredUsers;

  static String routeName = 'chat_2_InviteUsers';
  static String routePath = '/chat2InviteUsers';

  @override
  State<Chat2InviteUsersWidget> createState() => _Chat2InviteUsersWidgetState();
}

class _Chat2InviteUsersWidgetState extends State<Chat2InviteUsersWidget> {
  late Chat2InviteUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Chat2InviteUsersModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'chat_2_InviteUsers'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_2_INVITE_USERS_chat_2_InviteUsers_O');
      if (widget.chatRef != null) {
        // addChatUsers_ToList
        logFirebaseEvent('chat_2_InviteUsers_addChatUsers_ToList');
        _model.friendsList =
            widget.chatRef!.users.toList().cast<DocumentReference>();
        safeSetState(() {});
        logFirebaseEvent('chat_2_InviteUsers_update_page_state');
        _model.strangers = functions
            .removeMultipleElementsFromList(
                widget.filiteredUsers!
                    .map((e) => e.reference)
                    .toList()
                    .toList(),
                (currentUserDocument?.matches.toList() ?? []).toList())!
            .toList()
            .cast<DocumentReference>();
        safeSetState(() {});
        logFirebaseEvent('chat_2_InviteUsers_update_page_state');
        _model.matchedUsers = functions
            .removeMultipleElementsFromList(
                widget.filiteredUsers!
                    .map((e) => e.reference)
                    .toList()
                    .toList(),
                _model.strangers.toList())!
            .toList()
            .cast<DocumentReference>();
        safeSetState(() {});
      }
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
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invite Friends',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Outfit',
                      letterSpacing: 0.0,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  'Select users from below to start a chat.',
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Figtree',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 4.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderRadius: 12.0,
                borderWidth: 1.0,
                buttonSize: 44.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('CHAT_2_INVITE_USERS_close_rounded_ICN_ON');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.safePop();
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 670.0,
            ),
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Invite Friends',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    'Select users from below to start a chat.',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Figtree',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 12.0, 4.0),
                              child: FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderRadius: 12.0,
                                borderWidth: 1.0,
                                buttonSize: 44.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'CHAT_2_INVITE_USERS_close_rounded_ICN_ON');
                                  logFirebaseEvent('IconButton_navigate_back');
                                  context.safePop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 0.0, 0.0),
                              child: Text(
                                'Invite Friends',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 0.0, 0.0),
                            child: Text(
                              ((_model.friendsList.length)).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 12.0, 0.0, 0.0),
                            child: Text(
                              'Selected',
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
                    if (_model.matchedUsers
                            .where((e) => !_model.blockedAuthUser.contains(e))
                            .toList()
                            .length >
                        0)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final filteredUsers = _model.matchedUsers
                                  .where((e) =>
                                      !_model.blockedAuthUser.contains(e))
                                  .toList();
                              if (filteredUsers.isEmpty) {
                                return Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.25,
                                  child: EmptyStateSimpleWidget(
                                    icon: Icon(
                                      Icons.groups_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 90.0,
                                    ),
                                    title: 'No matched users',
                                    body: 'No matched users with that name',
                                  ),
                                );
                              }

                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CHAT_2_INVITE_USERS_Matchedusers_ON_TAP');
                                  logFirebaseEvent(
                                      'Matchedusers_firestore_query');
                                  _model.blockedAuthMatched =
                                      await queryUserRecordOnce(
                                    queryBuilder: (userRecord) =>
                                        userRecord.where(
                                      'Block_Users',
                                      arrayContains: currentUserReference,
                                    ),
                                  );
                                  logFirebaseEvent(
                                      'Matchedusers_update_page_state');
                                  _model.blockedAuthUser = _model.blockedAuth!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                child: ListView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    160.0,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: filteredUsers.length,
                                  itemBuilder: (context, filteredUsersIndex) {
                                    final filteredUsersItem =
                                        filteredUsers[filteredUsersIndex];
                                    return Visibility(
                                      visible: (filteredUsersItem !=
                                              widget.chatRef?.userA) &&
                                          (filteredUsersItem !=
                                              widget.chatRef?.userB),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 8.0),
                                        child: StreamBuilder<UserRecord>(
                                          stream: UserRecord.getDocument(
                                              filteredUsersItem),
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

                                            final containerUserRecord =
                                                snapshot.data!;

                                            return Container(
                                              width: 100.0,
                                              height: 70.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 44.0,
                                                      height: 44.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(2.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        200),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        200),
                                                            imageUrl:
                                                                containerUserRecord
                                                                    .photos
                                                                    .firstOrNull!,
                                                            width: 44.0,
                                                            height: 44.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: Theme(
                                                        data: ThemeData(
                                                          unselectedWidgetColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                        ),
                                                        child: CheckboxListTile(
                                                          value: _model
                                                                      .checkboxListTileValueMap1[
                                                                  filteredUsersItem] ??=
                                                              _model.friendsList
                                                                  .contains(
                                                                      containerUserRecord
                                                                          .reference),
                                                          onChanged:
                                                              (newValue) async {
                                                            safeSetState(() =>
                                                                _model.checkboxListTileValueMap1[
                                                                        filteredUsersItem] =
                                                                    newValue!);
                                                            if (newValue!) {
                                                              logFirebaseEvent(
                                                                  'CHAT_2_INVITE_USERS_CheckboxListTile_n6i');
                                                              logFirebaseEvent(
                                                                  'CheckboxListTile_update_page_state');
                                                              _model.addToFriendsList(
                                                                  filteredUsersItem);
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'CHAT_2_INVITE_USERS_CheckboxListTile_n6i');
                                                              logFirebaseEvent(
                                                                  'CheckboxListTile_update_page_state');
                                                              _model.removeFromFriendsList(
                                                                  filteredUsersItem);
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          title: Text(
                                                            containerUserRecord
                                                                .displayName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Figtree',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  lineHeight:
                                                                      2.0,
                                                                ),
                                                          ),
                                                          tileColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          checkColor:
                                                              Colors.white,
                                                          dense: false,
                                                          controlAffinity:
                                                              ListTileControlAffinity
                                                                  .trailing,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Invite users you haven\'t matched with',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final filteredUsers = _model.strangers
                                .where(
                                    (e) => !_model.blockedAuthUser.contains(e))
                                .toList();
                            if (filteredUsers.isEmpty) {
                              return EmptyStateSimpleWidget(
                                icon: Icon(
                                  Icons.groups_outlined,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 90.0,
                                ),
                                title: 'No unmatched users',
                                body: 'No unmatched users with that name',
                              );
                            }

                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'CHAT_2_INVITE_USERS_Strangers_ON_TAP');
                                logFirebaseEvent('Strangers_firestore_query');
                                _model.blockedAuth = await queryUserRecordOnce(
                                  queryBuilder: (userRecord) =>
                                      userRecord.where(
                                    'Block_Users',
                                    arrayContains: currentUserReference,
                                  ),
                                );
                                logFirebaseEvent('Strangers_update_page_state');
                                _model.blockedAuthUser = _model.blockedAuth!
                                    .map((e) => e.reference)
                                    .toList()
                                    .cast<DocumentReference>();
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                              child: ListView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  160.0,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: filteredUsers.length,
                                itemBuilder: (context, filteredUsersIndex) {
                                  final filteredUsersItem =
                                      filteredUsers[filteredUsersIndex];
                                  return Visibility(
                                    visible: (filteredUsersItem !=
                                            widget.chatRef?.userA) &&
                                        (filteredUsersItem !=
                                            widget.chatRef?.userB),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 8.0),
                                      child: StreamBuilder<UserRecord>(
                                        stream: UserRecord.getDocument(
                                            filteredUsersItem),
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

                                          final containerUserRecord =
                                              snapshot.data!;

                                          return Container(
                                            width: 100.0,
                                            height: 70.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 44.0,
                                                    height: 44.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      200),
                                                          fadeOutDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      200),
                                                          imageUrl:
                                                              containerUserRecord
                                                                  .photos
                                                                  .firstOrNull!,
                                                          width: 44.0,
                                                          height: 44.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Builder(
                                                    builder: (context) {
                                                      if ((containerUserRecord
                                                                  .invitations
                                                                  .where((e) =>
                                                                      e.sender
                                                                          ?.id ==
                                                                      currentUserReference
                                                                          ?.id)
                                                                  .toList()
                                                                  .length ==
                                                              0) ||
                                                          (containerUserRecord
                                                                  .invitations
                                                                  .where((e) =>
                                                                      (e.sender
                                                                              ?.id ==
                                                                          currentUserReference
                                                                              ?.id) &&
                                                                      (e.status ==
                                                                          Status
                                                                              .accepted))
                                                                  .toList()
                                                                  .length >
                                                              0)) {
                                                        return Material(
                                                          color: Colors
                                                              .transparent,
                                                          child: Theme(
                                                            data: ThemeData(
                                                              unselectedWidgetColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                            ),
                                                            child:
                                                                CheckboxListTile(
                                                              value: _model
                                                                          .checkboxListTileValueMap2[
                                                                      filteredUsersItem] ??=
                                                                  _model
                                                                      .friendsList
                                                                      .contains(
                                                                          containerUserRecord
                                                                              .reference),
                                                              onChanged:
                                                                  (newValue) async {
                                                                safeSetState(() =>
                                                                    _model.checkboxListTileValueMap2[
                                                                            filteredUsersItem] =
                                                                        newValue!);
                                                                if (newValue!) {
                                                                  logFirebaseEvent(
                                                                      'CHAT_2_INVITE_USERS_CheckboxListTile_1kx');
                                                                  logFirebaseEvent(
                                                                      'CheckboxListTile_update_page_state');
                                                                  _model.addToInvitations(
                                                                      filteredUsersItem);
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'CHAT_2_INVITE_USERS_CheckboxListTile_1kx');
                                                                  logFirebaseEvent(
                                                                      'CheckboxListTile_update_page_state');
                                                                  _model.addToInvitations(
                                                                      filteredUsersItem);
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              title: Text(
                                                                containerUserRecord
                                                                    .displayName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Figtree',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      lineHeight:
                                                                          2.0,
                                                                    ),
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              checkColor:
                                                                  Colors.white,
                                                              dense: false,
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .trailing,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  6.0),
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: containerUserRecord
                                                                      .displayName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Figtree',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      ' has already been invited once. Please wait for their response.',
                                                                  style:
                                                                      TextStyle(),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Figtree',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 140.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).accent4,
                          FlutterFlowTheme.of(context).secondaryBackground
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'CHAT_2_INVITE_USERS_SEND_INVITES_BTN_ON_');
                          if (_model.friendsList.length >= 1) {
                            await Future.wait([
                              Future(() async {
                                // updateChat
                                logFirebaseEvent('Button_updateChat');

                                await widget.chatRef!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'users': _model.friendsList,
                                    },
                                  ),
                                });
                                // updateChat
                                logFirebaseEvent('Button_updateChat');
                                _model.updatedChatThread =
                                    await queryChatRecordOnce(
                                  queryBuilder: (chatRecord) =>
                                      chatRecord.where(
                                    'group_chat_id',
                                    isEqualTo: widget.chatRef?.groupChatId,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                              }),
                              Future(() async {
                                while (_model.inv < _model.invitations.length) {
                                  logFirebaseEvent('Button_backend_call');

                                  await _model.invitations
                                      .elementAtOrNull(_model.inv)!
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'invitations': FieldValue.arrayUnion([
                                          getInvitationFirestoreData(
                                            updateInvitationStruct(
                                              InvitationStruct(
                                                chat:
                                                    widget.chatRef?.reference,
                                                sender: currentUserReference,
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
                                  // i++
                                  logFirebaseEvent('Button_i');
                                  _model.inv = _model.inv + 1;
                                  safeSetState(() {});
                                }
                              }),
                            ]);
                            logFirebaseEvent('Button_navigate_to');
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                              Chat2DetailsWidget.routeName,
                              queryParameters: {
                                'chatRef': serializeParam(
                                  _model.updatedChatThread,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'chatRef': _model.updatedChatThread,
                              },
                            );

                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Invites sent',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 3000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          } else {
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'You must select at least one other user to start a chat.',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Figtree',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                duration: Duration(milliseconds: 3000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                              ),
                            );
                          }

                          safeSetState(() {});
                        },
                        text: widget.chatRef != null
                            ? 'Add to Chat'
                            : 'Send Invites',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Figtree',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
