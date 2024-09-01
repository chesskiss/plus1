import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'map_model.dart';
export 'map_model.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late MapModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowGoogleMap(
      controller: _model.googleMapsController,
      onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
      initialLocation: _model.googleMapsCenter ??=
          const LatLng(13.106061, -59.613158),
      markerColor: GoogleMarkerColor.violet,
      mapType: MapType.normal,
      style: GoogleMapStyle.standard,
      initialZoom: 14.0,
      allowInteraction: true,
      allowZoom: true,
      showZoomControls: true,
      showLocation: true,
      showCompass: false,
      showMapToolbar: false,
      showTraffic: false,
      centerMapOnMarkerTap: true,
    );
  }
}
