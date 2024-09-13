import '/archive_pages/v1/post_details_base_v1/post_details_base_v1_widget.dart';
import '/backend/backend.dart';
import '/components/web_components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'post_details_v1_model.dart';
export 'post_details_v1_model.dart';

class PostDetailsV1Widget extends StatefulWidget {
  const PostDetailsV1Widget({
    super.key,
    this.postParam,
  });

  final PostRecord? postParam;

  @override
  State<PostDetailsV1Widget> createState() => _PostDetailsV1WidgetState();
}

class _PostDetailsV1WidgetState extends State<PostDetailsV1Widget> {
  late PostDetailsV1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostDetailsV1Model());

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
        mainAxisSize: MainAxisSize.min,
        children: [
          wrapWithModel(
            model: _model.sideNavModel,
            updateCallback: () => safeSetState(() {}),
            child: const SideNavWidget(
              selectedNav: 1,
            ),
          ),
          Expanded(
            child: Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: wrapWithModel(
                model: _model.postDetailsBaseV1Model,
                updateCallback: () => safeSetState(() {}),
                updateOnChange: true,
                child: PostDetailsBaseV1Widget(
                  postRef: widget.postParam!.reference,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
