import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'searched_images_model.dart';
export 'searched_images_model.dart';

/// Images searched using Unsplash API
class SearchedImagesWidget extends StatefulWidget {
  const SearchedImagesWidget({
    super.key,
    required this.images,
  });

  /// Returned images from search with Unsplash
  final List<String>? images;

  @override
  State<SearchedImagesWidget> createState() => _SearchedImagesWidgetState();
}

class _SearchedImagesWidgetState extends State<SearchedImagesWidget> {
  late SearchedImagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchedImagesModel());

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
        if (responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        ))
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: 300.0,
              height: 30.0,
              decoration: BoxDecoration(),
            ),
          ),
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Builder(
                    builder: (context) {
                      final images = widget.images!.toList();

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 1.0,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: images.length,
                        itemBuilder: (context, imagesIndex) {
                          final imagesItem = images[imagesIndex];
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    _model.selectedImages.contains(imagesItem)
                                        ? FlutterFlowTheme.of(context).secondary
                                        : Color(0x00000000),
                              ),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SEARCHED_IMAGES_Image_5y3qnwu4_ON_TAP');
                                if (_model.selectedImages
                                    .contains(imagesItem)) {
                                  logFirebaseEvent(
                                      'Image_update_component_state');
                                  _model.removeFromSelectedImages(imagesItem);
                                  safeSetState(() {});
                                } else {
                                  if (_model.selectedImages.length < 3) {
                                    logFirebaseEvent(
                                        'Image_update_component_state');
                                    _model.addToSelectedImages(imagesItem);
                                    safeSetState(() {});
                                  } else {
                                    logFirebaseEvent('Image_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text(
                                              'You can choose at most 3 images'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                }
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6.0),
                                child: Image.network(
                                  imagesItem,
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('SEARCHED_IMAGES_Icon_tchoyrdi_ON_TAP');
                    logFirebaseEvent('Icon_bottom_sheet');
                    Navigator.pop(context, _model.selectedImages);
                  },
                  child: Icon(
                    Icons.cancel_outlined,
                    color: FlutterFlowTheme.of(context).error,
                    size: 40.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
