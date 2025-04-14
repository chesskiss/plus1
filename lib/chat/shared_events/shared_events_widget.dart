import '/backend/backend.dart';
import '/components/posts/user_post/user_post_widget.dart';
import '/components/web_components/posts_empty_list/posts_empty_list_widget.dart';
import '/components/web_components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'shared_events_model.dart';
export 'shared_events_model.dart';

/// Has all the events both users plan to go together
class SharedEventsWidget extends StatefulWidget {
  const SharedEventsWidget({
    super.key,
    required this.users,
  });

  final List<DocumentReference>? users;

  static String routeName = 'shared_events';
  static String routePath = '/sharedEvents';

  @override
  State<SharedEventsWidget> createState() => _SharedEventsWidgetState();
}

class _SharedEventsWidgetState extends State<SharedEventsWidget> {
  late SharedEventsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SharedEventsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'shared_events'});
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
              logFirebaseEvent('SHARED_EVENTS_arrow_back_rounded_ICN_ON_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Shared Events',
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
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.sideNavModel,
                updateCallback: () => safeSetState(() {}),
                child: SideNavWidget(
                  selectedNav: 1,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 1070.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                      child: StreamBuilder<List<PostRecord>>(
                        stream: queryPostRecord(
                          queryBuilder: (postRecord) =>
                              postRecord.where(Filter.or(
                            Filter(
                              'op',
                              isEqualTo: widget.users?.firstOrNull,
                            ),
                            filterArrayContainsAny('likes', widget.users),
                            Filter(
                              'op',
                              isEqualTo: widget.users?.lastOrNull,
                            ),
                          )),
                        ),
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
                          List<PostRecord> socialFeedPostRecordList =
                              snapshot.data!;
                          if (socialFeedPostRecordList.isEmpty) {
                            return Center(
                              child: Container(
                                width: 330.0,
                                height: 330.0,
                                child: PostsEmptyListWidget(),
                              ),
                            );
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: socialFeedPostRecordList.length,
                            itemBuilder: (context, socialFeedIndex) {
                              final socialFeedPostRecord =
                                  socialFeedPostRecordList[socialFeedIndex];
                              return UserPostWidget(
                                key: Key(
                                    'Key9dh_${socialFeedIndex}_of_${socialFeedPostRecordList.length}'),
                                post: socialFeedPostRecord.reference,
                              );
                            },
                          );
                        },
                      ),
                    ),
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
