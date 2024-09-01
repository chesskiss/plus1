import '/components/activity_type_card/activity_type_card_widget.dart';
import '/components/exclusivity_type_card/exclusivity_type_card_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
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
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    exclusivityTypeCardModel =
        createModel(context, () => ExclusivityTypeCardModel());
    activityTypeCardModel = createModel(context, () => ActivityTypeCardModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    exclusivityTypeCardModel.dispose();
    activityTypeCardModel.dispose();
  }
}
