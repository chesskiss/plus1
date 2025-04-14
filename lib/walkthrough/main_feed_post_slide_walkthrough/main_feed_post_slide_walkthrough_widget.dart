import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'main_feed_post_slide_walkthrough_model.dart';
export 'main_feed_post_slide_walkthrough_model.dart';

/// Explanation on post swipe
class MainFeedPostSlideWalkthroughWidget extends StatefulWidget {
  const MainFeedPostSlideWalkthroughWidget({super.key});

  @override
  State<MainFeedPostSlideWalkthroughWidget> createState() =>
      _MainFeedPostSlideWalkthroughWidgetState();
}

class _MainFeedPostSlideWalkthroughWidgetState
    extends State<MainFeedPostSlideWalkthroughWidget>
    with TickerProviderStateMixin {
  late MainFeedPostSlideWalkthroughModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainFeedPostSlideWalkthroughModel());

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 1000.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(66.0, 0.0),
          ),
        ],
      ),
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
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
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                child: Text(
                  'Swpe right to see who\'s interested!',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).tertiary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Icon(
                Icons.double_arrow,
                color: FlutterFlowTheme.of(context).tertiary,
                size: 60.0,
              ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
