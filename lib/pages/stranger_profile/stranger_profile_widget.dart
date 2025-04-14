import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat/match_prompt/match_prompt_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'stranger_profile_model.dart';
export 'stranger_profile_model.dart';

class StrangerProfileWidget extends StatefulWidget {
  const StrangerProfileWidget({
    super.key,
    required this.profile,
  });

  final DocumentReference? profile;

  static String routeName = 'strangerProfile';
  static String routePath = '/strangerProfile';

  @override
  State<StrangerProfileWidget> createState() => _StrangerProfileWidgetState();
}

class _StrangerProfileWidgetState extends State<StrangerProfileWidget>
    with TickerProviderStateMixin {
  late StrangerProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StrangerProfileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'strangerProfile'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('STRANGER_PROFILE_strangerProfile_ON_INIT');
      logFirebaseEvent('strangerProfile_update_page_state');
      _model.like = (currentUserDocument?.following.toList() ?? [])
          .contains(widget.profile);
      safeSetState(() {});
    });

    animationsMap.addAll({
      'toggleIconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(2.0, 2.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -1.0),
            end: Offset(0.0, -1.0),
          ),
        ],
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserRecord>(
      stream: UserRecord.getDocument(widget.profile!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final strangerProfileUserRecord = snapshot.data!;

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
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('STRANGER_PROFILE_arrow_back_rounded_ICN_');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                strangerProfileUserRecord.displayName,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Open Sans',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 1.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          1.0,
                                        ),
                                        spreadRadius: 0.0,
                                      )
                                    ],
                                  ),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: FlutterFlowMediaDisplay(
                                      path: strangerProfileUserRecord
                                          .photos.firstOrNull!,
                                      imageBuilder: (path) => ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          path,
                                          width: 300.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.5,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      videoPlayerBuilder: (path) =>
                                          FlutterFlowVideoPlayer(
                                        path: path,
                                        width: 300.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.5,
                                        autoPlay: false,
                                        looping: true,
                                        showControls: true,
                                        allowFullScreen: true,
                                        allowPlaybackSpeedMenu: false,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (false)
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 63.0,
                                  icon: Icon(
                                    Icons.keyboard_control,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 50.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Visibility(
                                visible: strangerProfileUserRecord
                                            .shortDescription !=
                                        '',
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            'Short bio',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: Text(
                                            strangerProfileUserRecord
                                                .shortDescription,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    color: Color(0x33000000),
                                    offset: Offset(
                                      0.0,
                                      1.0,
                                    ),
                                    spreadRadius: 0.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (strangerProfileUserRecord.education !=
                                            '')
                                      Material(
                                        color: Colors.transparent,
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.school,
                                          ),
                                          title: Text(
                                            strangerProfileUserRecord.education,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          dense: false,
                                        ),
                                      ),
                                    if (strangerProfileUserRecord
                                        .relationship.isNotEmpty)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 30.0, 0.0),
                                              child: Icon(
                                                Icons.people_alt,
                                                color: Color(0xFF8C8C8C),
                                                size: 24.0,
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final relationship =
                                                    strangerProfileUserRecord
                                                        .relationship
                                                        .toList();

                                                return Wrap(
                                                  spacing: 10.0,
                                                  runSpacing: 5.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.vertical,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: List.generate(
                                                      relationship.length,
                                                      (relationshipIndex) {
                                                    final relationshipItem =
                                                        relationship[
                                                            relationshipIndex];
                                                    return Text(
                                                      relationshipItem.name,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (strangerProfileUserRecord.preferences !=
                                            '')
                                      Material(
                                        color: Colors.transparent,
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.favorite,
                                          ),
                                          title: Text(
                                            strangerProfileUserRecord
                                                .preferences,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          dense: false,
                                        ),
                                      ),
                                    if (strangerProfileUserRecord.gender != '')
                                      Material(
                                        color: Colors.transparent,
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.transgender_sharp,
                                          ),
                                          title: Text(
                                            strangerProfileUserRecord.gender,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          dense: false,
                                        ),
                                      ),
                                    Material(
                                      color: Colors.transparent,
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.cake,
                                        ),
                                        title: Text(
                                          strangerProfileUserRecord.age
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        tileColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        dense: false,
                                      ),
                                    ),
                                    if ((strangerProfileUserRecord.height !=
                                            null) &&
                                        (strangerProfileUserRecord.height.ft >
                                            2))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 30.0, 0.0),
                                              child: Icon(
                                                Icons.height,
                                                color: Color(0xFF8C8C8C),
                                                size: 24.0,
                                              ),
                                            ),
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        strangerProfileUserRecord
                                                            .height.ft
                                                            .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: '\"',
                                                    style: TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        strangerProfileUserRecord
                                                            .height.inch
                                                            .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (strangerProfileUserRecord.location !=
                                            '')
                                      Material(
                                        color: Colors.transparent,
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.location_pin,
                                          ),
                                          title: Text(
                                            strangerProfileUserRecord.location,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          dense: false,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if ((strangerProfileUserRecord.photos.length >= 2) &&
                              (strangerProfileUserRecord.photos
                                          .elementAtOrNull(1) !=
                                      null &&
                                  strangerProfileUserRecord.photos
                                          .elementAtOrNull(1) !=
                                      ''))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 1.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        1.0,
                                      ),
                                      spreadRadius: 0.0,
                                    )
                                  ],
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'STRANGER_PROFILE_Image_4gu26zb7_ON_TAP');
                                      logFirebaseEvent('Image_expand_image');
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.network(
                                              strangerProfileUserRecord.photos
                                                  .elementAtOrNull(strangerProfileUserRecord
                                                                  .photos
                                                                  .elementAtOrNull(
                                                                      1) !=
                                                              null &&
                                                          strangerProfileUserRecord
                                                                  .photos
                                                                  .elementAtOrNull(
                                                                      1) !=
                                                              ''
                                                      ? 1
                                                      : 2)!,
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: strangerProfileUserRecord
                                                .photos
                                                .elementAtOrNull(strangerProfileUserRecord
                                                                .photos
                                                                .elementAtOrNull(
                                                                    1) !=
                                                            null &&
                                                        strangerProfileUserRecord
                                                                .photos
                                                                .elementAtOrNull(
                                                                    1) !=
                                                            ''
                                                    ? 1
                                                    : 2)!,
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: strangerProfileUserRecord.photos
                                          .elementAtOrNull(
                                              strangerProfileUserRecord.photos
                                                              .elementAtOrNull(
                                                                  1) !=
                                                          null &&
                                                      strangerProfileUserRecord
                                                              .photos
                                                              .elementAtOrNull(
                                                                  1) !=
                                                          ''
                                                  ? 1
                                                  : 2)!,
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          strangerProfileUserRecord.photos
                                              .elementAtOrNull(strangerProfileUserRecord
                                                              .photos
                                                              .elementAtOrNull(
                                                                  1) !=
                                                          null &&
                                                      strangerProfileUserRecord
                                                              .photos
                                                              .elementAtOrNull(
                                                                  1) !=
                                                          ''
                                                  ? 1
                                                  : 2)!,
                                          width: 300.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.5,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Visibility(
                                visible:
                                    strangerProfileUserRecord.iLike != '',
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            'I like...',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: Text(
                                            strangerProfileUserRecord.iLike,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (strangerProfileUserRecord.photos.length >= 3)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 1.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        1.0,
                                      ),
                                      spreadRadius: 0.0,
                                    )
                                  ],
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'STRANGER_PROFILE_Image_jthiqvx6_ON_TAP');
                                        logFirebaseEvent('Image_expand_image');
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.network(
                                                (currentUserDocument?.photos
                                                            .toList() ??
                                                        [])
                                                    .lastOrNull!,
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: (currentUserDocument?.photos
                                                          .toList() ??
                                                      [])
                                                  .lastOrNull!,
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: (currentUserDocument?.photos
                                                    .toList() ??
                                                [])
                                            .lastOrNull!,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            (currentUserDocument?.photos
                                                        .toList() ??
                                                    [])
                                                .lastOrNull!,
                                            width: 300.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.5,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (strangerProfileUserRecord.reference.id !=
                              currentUserReference?.id)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 1.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        1.0,
                                      ),
                                      spreadRadius: 0.0,
                                    )
                                  ],
                                ),
                                child: Builder(
                                  builder: (context) {
                                    if (!(currentUserDocument?.blockUsers
                                                .toList() ??
                                            [])
                                        .contains(strangerProfileUserRecord
                                            .reference)) {
                                      return Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'STRANGER_PROFILE_PAGE_Block_ON_TAP');
                                            logFirebaseEvent(
                                                'Block_alert_dialog');
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Block confirmation'),
                                                          content: Text(
                                                              'Are you sure you want to block this user? This will unmatch you if you were matched. '),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Confirm'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              logFirebaseEvent(
                                                  'Block_backend_call');

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'matches':
                                                        FieldValue.arrayRemove([
                                                      strangerProfileUserRecord
                                                          .reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                              logFirebaseEvent(
                                                  'Block_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'You blocked @${strangerProfileUserRecord.displayName}',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                              logFirebaseEvent(
                                                  'Block_backend_call');

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'Block_Users':
                                                        FieldValue.arrayUnion([
                                                      strangerProfileUserRecord
                                                          .reference
                                                    ]),
                                                    'block_uid':
                                                        FieldValue.arrayUnion([
                                                      strangerProfileUserRecord
                                                          .uid
                                                    ]),
                                                  },
                                                ),
                                              });
                                            } else {
                                              return;
                                            }
                                          },
                                          text: 'Block',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Figtree',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'STRANGER_PROFILE_PAGE_Unblock_ON_TAP');
                                            logFirebaseEvent(
                                                'Unblock_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'You unblocked @${strangerProfileUserRecord.displayName}',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            logFirebaseEvent(
                                                'Unblock_backend_call');

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'Block_Users':
                                                      FieldValue.arrayRemove([
                                                    strangerProfileUserRecord
                                                        .reference
                                                  ]),
                                                  'block_uid':
                                                      FieldValue.arrayRemove([
                                                    strangerProfileUserRecord
                                                        .uid
                                                  ]),
                                                },
                                              ),
                                            });
                                          },
                                          text: 'Unblock',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Figtree',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          if (strangerProfileUserRecord.reference.id !=
                              currentUserReference?.id)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 1.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        1.0,
                                      ),
                                      spreadRadius: 0.0,
                                    )
                                  ],
                                ),
                                child: Builder(
                                  builder: (context) {
                                    if (!strangerProfileUserRecord.reports
                                        .contains(currentUserReference)) {
                                      return Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'STRANGER_PROFILE_PAGE_REPORT_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await strangerProfileUserRecord
                                                .reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'reports':
                                                      FieldValue.arrayUnion([
                                                    currentUserReference
                                                  ]),
                                                },
                                              ),
                                            });
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'You reported @${strangerProfileUserRecord.displayName}',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          },
                                          text: 'Report',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Figtree',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'STRANGER_PROFILE_REPORTED_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await strangerProfileUserRecord
                                                .reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'reports':
                                                      FieldValue.arrayRemove([
                                                    currentUserReference
                                                  ]),
                                                },
                                              ),
                                            });
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Rporting of @${strangerProfileUserRecord.displayName} was canceled',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          },
                                          text: 'Reported',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Figtree',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (widget.profile?.id != currentUserReference?.id)
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Builder(
                          builder: (context) => Padding(
                            padding: EdgeInsets.all(60.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'STRANGER_PROFILE_Container_l4vlfols_ON_T');
                                logFirebaseEvent('Container_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('start'),
                                      content: Text(_model.like.toString()),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                logFirebaseEvent('Container_widget_animation');
                                if (animationsMap[
                                        'toggleIconOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap[
                                          'toggleIconOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                if ((currentUserDocument?.following.toList() ??
                                        [])
                                    .contains(widget.profile)) {
                                  logFirebaseEvent('Container_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('debug 1'),
                                        content: Text(strangerProfileUserRecord
                                            .matches
                                            .contains(currentUserReference)
                                            .toString()),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text(_model.like.toString()),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (strangerProfileUserRecord.matches
                                      .contains(currentUserReference)) {
                                    // unmatch?
                                    logFirebaseEvent('Container_unmatch');
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Are you sure you want to unmatch?'),
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
                                      // remopfollowing
                                      logFirebaseEvent(
                                          'Container_remopfollowing');

                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'following':
                                                FieldValue.arrayRemove([
                                              strangerProfileUserRecord
                                                  .reference
                                            ]),
                                            'matches': FieldValue.arrayRemove([
                                              strangerProfileUserRecord
                                                  .reference
                                            ]),
                                          },
                                        ),
                                      });
                                      // removeFollower
                                      logFirebaseEvent(
                                          'Container_removeFollower');

                                      await strangerProfileUserRecord.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'followers': FieldValue.arrayRemove(
                                                [currentUserReference]),
                                            'matches': FieldValue.arrayRemove(
                                                [currentUserReference]),
                                          },
                                        ),
                                      });
                                    } else {
                                      logFirebaseEvent(
                                          'Container_update_page_state');
                                      _model.like = !_model.like;
                                      safeSetState(() {});
                                    }
                                  } else {
                                    // remopfollowing
                                    logFirebaseEvent(
                                        'Container_remopfollowing');

                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'following': FieldValue.arrayRemove([
                                            strangerProfileUserRecord.reference
                                          ]),
                                        },
                                      ),
                                    });
                                    // removeFollower
                                    logFirebaseEvent(
                                        'Container_removeFollower');

                                    await strangerProfileUserRecord.reference
                                        .update({
                                      ...mapToFirestore(
                                        {
                                          'followers': FieldValue.arrayRemove(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                  }
                                } else {
                                  // Debug
                                  logFirebaseEvent('Container_Debug');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('checkpoint 0'),
                                        content: Text(_model.like.toString()),
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
                                  // addfollowing
                                  logFirebaseEvent('Container_addfollowing');

                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'following': FieldValue.arrayUnion([
                                          strangerProfileUserRecord.reference
                                        ]),
                                      },
                                    ),
                                  });
                                  // Debug
                                  logFirebaseEvent('Container_Debug');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('checkpoint 1'),
                                        content: Text(currentUserReference!.id),
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
                                  // addfollower2User
                                  logFirebaseEvent(
                                      'Container_addfollower2User');

                                  await widget.profile!.update({
                                    ...mapToFirestore(
                                      {
                                        'followers': FieldValue.arrayUnion(
                                            [currentUserReference]),
                                      },
                                    ),
                                  });
                                  // Debug
                                  logFirebaseEvent('Container_Debug');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('checkpoint 1'),
                                        content: Text(strangerProfileUserRecord
                                            .following
                                            .contains(currentUserReference)
                                            .toString()),
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
                                  if (strangerProfileUserRecord.following
                                      .contains(currentUserReference)) {
                                    // Debug
                                    logFirebaseEvent('Container_Debug');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('checkpoint 4'),
                                          content:
                                              Text(currentUserReference!.id),
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
                                    // addMatch2Auth
                                    logFirebaseEvent('Container_addMatch2Auth');

                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'matches': FieldValue.arrayUnion([
                                            strangerProfileUserRecord.reference
                                          ]),
                                        },
                                      ),
                                    });
                                    // Debug
                                    logFirebaseEvent('Container_Debug');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('checkpoint 5'),
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
                                    // addMatch2User
                                    logFirebaseEvent('Container_addMatch2User');

                                    await strangerProfileUserRecord.reference
                                        .update({
                                      ...mapToFirestore(
                                        {
                                          'matches': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                    // Debug
                                    logFirebaseEvent('Container_Debug');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('checkpoint 6'),
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
                                    // create chat
                                    logFirebaseEvent('Container_createchat');

                                    var chatRecordReference =
                                        ChatRecord.collection.doc();
                                    await chatRecordReference.set({
                                      ...createChatRecordData(
                                        lastMessage: '\"\"',
                                        userA:
                                            strangerProfileUserRecord.reference,
                                        userB: currentUserReference,
                                        groupChatId: random_data.randomInteger(
                                            0, 100000),
                                        email: currentUserEmail,
                                        displayName: currentUserDisplayName,
                                        photoUrl: currentUserPhoto,
                                        uid: currentUserUid,
                                        phoneNumber: currentPhoneNumber,
                                        lastMessageTime: getCurrentTimestamp,
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
                                              widget.profile!,
                                              currentUserReference!),
                                        },
                                      ),
                                    });
                                    _model.chatmaked =
                                        ChatRecord.getDocumentFromData({
                                      ...createChatRecordData(
                                        lastMessage: '\"\"',
                                        userA:
                                            strangerProfileUserRecord.reference,
                                        userB: currentUserReference,
                                        groupChatId: random_data.randomInteger(
                                            0, 100000),
                                        email: currentUserEmail,
                                        displayName: currentUserDisplayName,
                                        photoUrl: currentUserPhoto,
                                        uid: currentUserUid,
                                        phoneNumber: currentPhoneNumber,
                                        lastMessageTime: getCurrentTimestamp,
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
                                              widget.profile!,
                                              currentUserReference!),
                                        },
                                      ),
                                    }, chatRecordReference);
                                    // Debug
                                    logFirebaseEvent('Container_Debug');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('checkpoint 7'),
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
                                    logFirebaseEvent('Container_match');
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
                                              user: strangerProfileUserRecord
                                                  .reference,
                                              chat: _model.chatmaked!,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    // Debug
                                    logFirebaseEvent('Container_Debug');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('checkpoint false'),
                                          content: Text(
                                              strangerProfileUserRecord
                                                  .following
                                                  .contains(
                                                      currentUserReference)
                                                  .toString()),
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
                                  }
                                }

                                safeSetState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Builder(
                                  builder: (context) => ToggleIcon(
                                    onPressed: () async {
                                      safeSetState(
                                          () => _model.like = !_model.like);
                                      logFirebaseEvent(
                                          'STRANGER_PROFILE_ToggleIcon_e6kyiclb_ON_');
                                      logFirebaseEvent(
                                          'ToggleIcon_widget_animation');
                                      if (animationsMap[
                                              'toggleIconOnActionTriggerAnimation'] !=
                                          null) {
                                        animationsMap[
                                                'toggleIconOnActionTriggerAnimation']!
                                            .controller
                                            .forward(from: 0.0)
                                            .whenComplete(animationsMap[
                                                    'toggleIconOnActionTriggerAnimation']!
                                                .controller
                                                .reverse);
                                      }
                                      if ((currentUserDocument?.following
                                                  .toList() ??
                                              [])
                                          .contains(widget.profile)) {
                                        if (strangerProfileUserRecord.matches
                                            .contains(currentUserReference)) {
                                          // unmatch?
                                          logFirebaseEvent(
                                              'ToggleIcon_unmatch');
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Are you sure you want to unmatch?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                                Text('Confirm'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            // remopfollowing
                                            logFirebaseEvent(
                                                'ToggleIcon_remopfollowing');

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'following':
                                                      FieldValue.arrayRemove([
                                                    strangerProfileUserRecord
                                                        .reference
                                                  ]),
                                                  'matches':
                                                      FieldValue.arrayRemove([
                                                    strangerProfileUserRecord
                                                        .reference
                                                  ]),
                                                },
                                              ),
                                            });
                                            // removeFollower
                                            logFirebaseEvent(
                                                'ToggleIcon_removeFollower');

                                            await strangerProfileUserRecord
                                                .reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'followers':
                                                      FieldValue.arrayRemove([
                                                    currentUserReference
                                                  ]),
                                                  'matches':
                                                      FieldValue.arrayRemove([
                                                    currentUserReference
                                                  ]),
                                                },
                                              ),
                                            });
                                          } else {
                                            logFirebaseEvent(
                                                'ToggleIcon_update_page_state');
                                            _model.like = !_model.like;
                                            safeSetState(() {});
                                          }
                                        } else {
                                          // remopfollowing
                                          logFirebaseEvent(
                                              'ToggleIcon_remopfollowing');

                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'following':
                                                    FieldValue.arrayRemove([
                                                  strangerProfileUserRecord
                                                      .reference
                                                ]),
                                              },
                                            ),
                                          });
                                          // removeFollower
                                          logFirebaseEvent(
                                              'ToggleIcon_removeFollower');

                                          await strangerProfileUserRecord
                                              .reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'followers':
                                                    FieldValue.arrayRemove(
                                                        [currentUserReference]),
                                              },
                                            ),
                                          });
                                        }
                                      } else {
                                        // addfollowing
                                        logFirebaseEvent(
                                            'ToggleIcon_addfollowing');

                                        await currentUserReference!.update({
                                          ...mapToFirestore(
                                            {
                                              'following':
                                                  FieldValue.arrayUnion([
                                                strangerProfileUserRecord
                                                    .reference
                                              ]),
                                            },
                                          ),
                                        });
                                        // addfollower2User
                                        logFirebaseEvent(
                                            'ToggleIcon_addfollower2User');

                                        await widget.profile!.update({
                                          ...mapToFirestore(
                                            {
                                              'followers':
                                                  FieldValue.arrayUnion(
                                                      [currentUserReference]),
                                            },
                                          ),
                                        });
                                        if (strangerProfileUserRecord.following
                                            .contains(currentUserReference)) {
                                          // addMatch2Auth
                                          logFirebaseEvent(
                                              'ToggleIcon_addMatch2Auth');

                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'matches':
                                                    FieldValue.arrayUnion([
                                                  strangerProfileUserRecord
                                                      .reference
                                                ]),
                                              },
                                            ),
                                          });
                                          // addMatch2User
                                          logFirebaseEvent(
                                              'ToggleIcon_addMatch2User');

                                          await strangerProfileUserRecord
                                              .reference
                                              .update({
                                            ...createUserRecordData(
                                              profileNotification: true,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'matches':
                                                    FieldValue.arrayUnion(
                                                        [currentUserReference]),
                                              },
                                            ),
                                          });
                                          // create chat
                                          logFirebaseEvent(
                                              'ToggleIcon_createchat');

                                          var chatRecordReference =
                                              ChatRecord.collection.doc();
                                          await chatRecordReference.set({
                                            ...createChatRecordData(
                                              lastMessage: '\"\"',
                                              userA: strangerProfileUserRecord
                                                  .reference,
                                              userB: currentUserReference,
                                              groupChatId: random_data
                                                  .randomInteger(0, 100000),
                                              email: currentUserEmail,
                                              displayName:
                                                  currentUserDisplayName,
                                              photoUrl: currentUserPhoto,
                                              uid: currentUserUid,
                                              phoneNumber: currentPhoneNumber,
                                              lastMessageTime:
                                                  getCurrentTimestamp,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'last_message_seen_by': [
                                                  currentUserReference
                                                ],
                                                'last_message_sent_by': [
                                                  currentUserReference
                                                ],
                                                'created_time': FieldValue
                                                    .serverTimestamp(),
                                                'users': functions.merge2Users(
                                                    widget.profile!,
                                                    currentUserReference!),
                                              },
                                            ),
                                          });
                                          _model.chatmakedIcon =
                                              ChatRecord.getDocumentFromData({
                                            ...createChatRecordData(
                                              lastMessage: '\"\"',
                                              userA: strangerProfileUserRecord
                                                  .reference,
                                              userB: currentUserReference,
                                              groupChatId: random_data
                                                  .randomInteger(0, 100000),
                                              email: currentUserEmail,
                                              displayName:
                                                  currentUserDisplayName,
                                              photoUrl: currentUserPhoto,
                                              uid: currentUserUid,
                                              phoneNumber: currentPhoneNumber,
                                              lastMessageTime:
                                                  getCurrentTimestamp,
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
                                                    widget.profile!,
                                                    currentUserReference!),
                                              },
                                            ),
                                          }, chatRecordReference);
                                          // match
                                          logFirebaseEvent('ToggleIcon_match');
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: MatchPromptWidget(
                                                    user:
                                                        strangerProfileUserRecord
                                                            .reference,
                                                    chat: _model.chatmaked!,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      }

                                      safeSetState(() {});
                                    },
                                    value: _model.like,
                                    onIcon: Icon(
                                      Icons.favorite,
                                      color: Color(0xFFEF212C),
                                      size: 50.0,
                                    ),
                                    offIcon: Icon(
                                      Icons.favorite_border,
                                      color: Color(0xFFEF212C),
                                      size: 50.0,
                                    ),
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'toggleIconOnActionTriggerAnimation']!,
                                  ),
                                ),
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
      },
    );
  }
}
