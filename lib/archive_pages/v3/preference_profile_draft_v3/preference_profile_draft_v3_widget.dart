import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'preference_profile_draft_v3_model.dart';
export 'preference_profile_draft_v3_model.dart';

class PreferenceProfileDraftV3Widget extends StatefulWidget {
  /// A conditional builder of the multichoice preference sturct
  const PreferenceProfileDraftV3Widget({super.key});

  @override
  State<PreferenceProfileDraftV3Widget> createState() =>
      _PreferenceProfileDraftV3WidgetState();
}

class _PreferenceProfileDraftV3WidgetState
    extends State<PreferenceProfileDraftV3Widget> {
  late PreferenceProfileDraftV3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PreferenceProfileDraftV3Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (true) {
          return ListTile(
            leading: const Icon(
              Icons.people_alt,
            ),
            title: Text(
              'Men',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Outfit',
                    letterSpacing: 0.0,
                  ),
            ),
            tileColor: FlutterFlowTheme.of(context).secondaryBackground,
            dense: false,
          );
        } else {
          return ListTile(
            leading: const Icon(
              Icons.people_alt,
            ),
            tileColor: FlutterFlowTheme.of(context).secondaryBackground,
            dense: false,
          );
        }
      },
    );
  }
}
