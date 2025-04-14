import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'swupable_tile_model.dart';
export 'swupable_tile_model.dart';

/// i want to make swipeable stack that shows tile of the Liked Activity in
/// list and upon swipe up it moves to next elemt in list and there should be
/// only onle visible on screen stm
class SwupableTileWidget extends StatefulWidget {
  const SwupableTileWidget({super.key});

  @override
  State<SwupableTileWidget> createState() => _SwupableTileWidgetState();
}

class _SwupableTileWidgetState extends State<SwupableTileWidget> {
  late SwupableTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwupableTileModel());

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
      width: double.infinity,
      height: 400.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: 300.0,
              height: 350.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                    spreadRadius: 0.0,
                  )
                ],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1578589301857-8c662e4bfe99?w=500&h=500',
                        width: 268.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      'Hiking Adventure',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: FlutterFlowTheme.of(context).error,
                          size: 24.0,
                        ),
                        Text(
                          'Liked Activity',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Figtree',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                    Text(
                      'Enjoy breathtaking views on this challenging mountain trail.',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Figtree',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
