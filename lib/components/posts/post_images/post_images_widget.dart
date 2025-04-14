import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'post_images_model.dart';
export 'post_images_model.dart';

/// Carousel of the post images
class PostImagesWidget extends StatefulWidget {
  const PostImagesWidget({
    super.key,
    required this.postImages,
    double? heightPrecentage,
  }) : this.heightPrecentage = heightPrecentage ?? 0.7;

  final List<String>? postImages;

  /// Between 0-1
  final double heightPrecentage;

  @override
  State<PostImagesWidget> createState() => _PostImagesWidgetState();
}

class _PostImagesWidgetState extends State<PostImagesWidget> {
  late PostImagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostImagesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, 0.0),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Builder(
              builder: (context) {
                final postImages = widget.postImages!.toList();

                return Container(
                  width: double.infinity,
                  height: valueOrDefault<double>(
                    MediaQuery.sizeOf(context).height *
                        widget.heightPrecentage,
                    0.7,
                  ),
                  child: CarouselSlider.builder(
                    itemCount: postImages.length,
                    itemBuilder: (context, postImagesIndex, _) {
                      final postImagesItem = postImages[postImagesIndex];
                      return FlutterFlowMediaDisplay(
                        path: postImagesItem,
                        imageBuilder: (path) => ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            path,
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                          path: path,
                          width: 300.0,
                          autoPlay: true,
                          looping: true,
                          showControls: false,
                          allowFullScreen: true,
                          allowPlaybackSpeedMenu: false,
                        ),
                      );
                    },
                    carouselController: _model.carouselController ??=
                        CarouselSliderController(),
                    options: CarouselOptions(
                      initialPage: max(0, min(0, postImages.length - 1)),
                      viewportFraction: 1.0,
                      disableCenter: true,
                      enlargeCenterPage: false,
                      enlargeFactor: 0.0,
                      enableInfiniteScroll: false,
                      scrollDirection: Axis.horizontal,
                      autoPlay: false,
                      onPageChanged: (index, _) =>
                          _model.carouselCurrentIndex = index,
                    ),
                  ),
                );
              },
            ),
          ),
          if (false)
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: RatingBarIndicator(
                itemBuilder: (context, index) => FaIcon(
                  FontAwesomeIcons.solidCircle,
                  color: FlutterFlowTheme.of(context).primary,
                ),
                direction: Axis.horizontal,
                rating: 0.0,
                unratedColor: FlutterFlowTheme.of(context).accent1,
                itemCount: 3,
                itemSize: 24.0,
              ),
            ),
        ],
      ),
    );
  }
}
