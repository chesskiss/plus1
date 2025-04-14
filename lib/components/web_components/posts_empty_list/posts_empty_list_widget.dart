import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'posts_empty_list_model.dart';
export 'posts_empty_list_model.dart';

class PostsEmptyListWidget extends StatefulWidget {
  const PostsEmptyListWidget({
    super.key,
    String? title,
    String? description,
    this.post,
  })  : this.title = title ?? 'No Posts',
        this.description = description ??
            'It seems that there are no posts here. Check back later to see the latest stuff going on!';

  final String title;
  final String description;

  /// The post containing the interested users
  final PostRecord? post;

  @override
  State<PostsEmptyListWidget> createState() => _PostsEmptyListWidgetState();
}

class _PostsEmptyListWidgetState extends State<PostsEmptyListWidget> {
  late PostsEmptyListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostsEmptyListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.photo_library_outlined,
          color: FlutterFlowTheme.of(context).primary,
          size: 90.0,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(32.0, 8.0, 32.0, 0.0),
          child: Text(
            widget.description,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Figtree',
                  letterSpacing: 0.0,
                ),
          ),
        ),
        if (widget.post != null)
          Padding(
            padding: EdgeInsets.all(16.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('POSTS_EMPTY_LIST_COMP_Reset_ON_TAP');
                // CorrectNumList
                logFirebaseEvent('Reset_CorrectNumList');
                _model.removableUsers = functions
                    .removeMultipleElementsFromList(
                        widget.post!.likes.toList(),
                        (currentUserDocument?.matches.toList() ?? [])
                            .toList())!
                    .toList()
                    .cast<DocumentReference>();
                safeSetState(() {});
                // RemoveLikesFromSwipes
                logFirebaseEvent('Reset_RemoveLikesFromSwipes');

                await currentUserReference!.update({
                  ...mapToFirestore(
                    {
                      'swiped': functions.removeMultipleElementsFromList(
                          (currentUserDocument?.swiped.toList() ?? [])
                              .toList(),
                          _model.removableUsers.toList()),
                    },
                  ),
                });
                if (!(currentUserDocument?.matches.toList() ?? [])
                    .contains(widget.post?.op)) {
                  // RemoveOPFromSwipes
                  logFirebaseEvent('Reset_RemoveOPFromSwipes');

                  await currentUserReference!.update({
                    ...mapToFirestore(
                      {
                        'swiped': FieldValue.arrayRemove([widget.post?.op]),
                      },
                    ),
                  });
                }
              },
              text: 'Reset users',
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Figtree',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
      ],
    );
  }
}
