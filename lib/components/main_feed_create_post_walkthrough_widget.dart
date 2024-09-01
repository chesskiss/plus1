import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'main_feed_create_post_walkthrough_model.dart';
export 'main_feed_create_post_walkthrough_model.dart';

class MainFeedCreatePostWalkthroughWidget extends StatefulWidget {
  const MainFeedCreatePostWalkthroughWidget({super.key});

  @override
  State<MainFeedCreatePostWalkthroughWidget> createState() =>
      _MainFeedCreatePostWalkthroughWidgetState();
}

class _MainFeedCreatePostWalkthroughWidgetState
    extends State<MainFeedCreatePostWalkthroughWidget> {
  late MainFeedCreatePostWalkthroughModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainFeedCreatePostWalkthroughModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'and you can  also create an event yourself!',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                  ),
            ),
          ].divide(const SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
