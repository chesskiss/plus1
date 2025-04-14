import '/archive_pages/v4to6/activity_type_card/activity_type_card_widget.dart';
import '/archive_pages/v4to6/dress_code_card/dress_code_card_widget.dart';
import '/archive_pages/v4to6/exclusivity_type_card/exclusivity_type_card_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_details_modal_widget.dart' show PostDetailsModalWidget;
import 'package:flutter/material.dart';

class PostDetailsModalModel extends FlutterFlowModel<PostDetailsModalWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ExclusivityType_card component.
  late ExclusivityTypeCardModel exclusivityTypeCardModel;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for ActivityType_card component.
  late ActivityTypeCardModel activityTypeCardModel;
  // Model for DressCode_card component.
  late DressCodeCardModel dressCodeCardModel;

  @override
  void initState(BuildContext context) {
    exclusivityTypeCardModel =
        createModel(context, () => ExclusivityTypeCardModel());
    activityTypeCardModel = createModel(context, () => ActivityTypeCardModel());
    dressCodeCardModel = createModel(context, () => DressCodeCardModel());
  }

  @override
  void dispose() {
    exclusivityTypeCardModel.dispose();
    activityTypeCardModel.dispose();
    dressCodeCardModel.dispose();
  }
}
