import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

/// Customized nav bar with invitations and notifications
class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
    required this.tab,
  });

  /// Which tab are we in
  final TabEnums? tab;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NAV_BAR_COMP_NavBar_ON_INIT_STATE');
      logFirebaseEvent('NavBar_wait__delay');
      await Future.delayed(const Duration(milliseconds: 1000));
      // RemoveSwipedUsers
      logFirebaseEvent('NavBar_RemoveSwipedUsers');
      _model.likes = functions
          .removeMultipleElementsFromList(
              (currentUserDocument?.followers.toList() ?? []).toList(),
              (currentUserDocument?.swiped.toList() ?? []).toList())!
          .toList()
          .cast<DocumentReference>();
      safeSetState(() {});
      // Removematched Users
      logFirebaseEvent('NavBar_RemovematchedUsers');
      _model.likes = functions
          .removeMultipleElementsFromList(_model.likes.toList(),
              (currentUserDocument?.matches.toList() ?? []).toList())!
          .toList()
          .cast<DocumentReference>();
      safeSetState(() {});
      // RemoveBlockedUsersAuth
      logFirebaseEvent('NavBar_RemoveBlockedUsersAuth');
      _model.likes = functions
          .removeMultipleElementsFromList(_model.likes.toList(),
              (currentUserDocument?.blockUsers.toList() ?? []).toList())!
          .toList()
          .cast<DocumentReference>();
      safeSetState(() {});
      // bool
      logFirebaseEvent('NavBar_bool');
      _model.newFollowers = _model.likes.length > 0;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                -2.0,
              ),
              spreadRadius: 0.0,
            )
          ],
        ),
        child: Builder(
          builder: (context) {
            if ((currentUserDocument?.invitations.toList() ?? []).isNotEmpty) {
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            if ((currentUserDocument?.invitations.toList() ??
                                    [])
                                .where((e) =>
                                    (e.status == Status.pending) ||
                                    (e.status == null))
                                .toList()
                                .isNotEmpty)
                              Align(
                                alignment: AlignmentDirectional(0.8, 0.0),
                                child: Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).error,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: Colors.transparent,
                              icon: Icon(
                                Icons.mail,
                                color: widget.tab == TabEnums.Invitations
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'NAV_BAR_COMP_invitationsTab_ON_TAP');
                                logFirebaseEvent('invitationsTab_navigate_to');

                                context.pushNamed(InvitationsWidget.routeName);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            if (_model.newFollowers)
                              Align(
                                alignment: AlignmentDirectional(0.8, 0.0),
                                child: Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).error,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: Colors.transparent,
                              icon: Icon(
                                Icons.favorite,
                                color: widget.tab == TabEnums.Likes
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'NAV_BAR_COMP_LikesTab_ON_TAP');
                                logFirebaseEvent('LikesTab_navigate_to');

                                context.pushNamed(MainLikesWidget.routeName);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: Colors.transparent,
                      icon: Icon(
                        Icons.home,
                        color: widget.tab == TabEnums.Home
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('NAV_BAR_COMP_HomeTab_ON_TAP');
                        logFirebaseEvent('HomeTab_navigate_to');

                        context.pushNamed(MainFeedWidget.routeName);
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            if (valueOrDefault<bool>(
                                currentUserDocument?.profileNotification,
                                false))
                              Align(
                                alignment: AlignmentDirectional(0.8, 0.0),
                                child: Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).error,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: Colors.transparent,
                              icon: Icon(
                                Icons.person,
                                color: widget.tab == TabEnums.Profile
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'NAV_BAR_COMP_mainProfileTab_ON_TAP');
                                logFirebaseEvent('mainProfileTab_navigate_to');

                                context.pushNamed(MainProfileWidget.routeName);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            if (_model.newFollowers)
                              Align(
                                alignment: AlignmentDirectional(0.8, 0.0),
                                child: Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).error,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: Colors.transparent,
                              icon: Icon(
                                Icons.favorite,
                                color: widget.tab == TabEnums.Likes
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'NAV_BAR_COMP_LikesTab_ON_TAP');
                                logFirebaseEvent('LikesTab_navigate_to');

                                context.goNamed(MainLikesWidget.routeName);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: Colors.transparent,
                      icon: Icon(
                        Icons.home,
                        color: widget.tab == TabEnums.Home
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('NAV_BAR_COMP_HomeTab_ON_TAP');
                        logFirebaseEvent('HomeTab_navigate_to');

                        context.pushNamed(MainFeedWidget.routeName);
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            if (valueOrDefault<bool>(
                                currentUserDocument?.profileNotification,
                                false))
                              Align(
                                alignment: AlignmentDirectional(0.8, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 10.0,
                                    height: 10.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).error,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: Colors.transparent,
                              icon: Icon(
                                Icons.person,
                                color: widget.tab == TabEnums.Profile
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'NAV_BAR_COMP_mainProfileTab_ON_TAP');
                                logFirebaseEvent('mainProfileTab_navigate_to');

                                context.pushNamed(MainProfileWidget.routeName);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
