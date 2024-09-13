import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'post_images_model.dart';
export 'post_images_model.dart';

class PostImagesWidget extends StatefulWidget {
  /// Carousel of the post images
  const PostImagesWidget({
    super.key,
    required this.postImages,
  });

  final List<String>? postImages;

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
      alignment: const AlignmentDirectional(-1.0, 0.0),
      child: Builder(
        builder: (context) {
          final postImages = widget.postImages!.toList();

          return SizedBox(
            width: double.infinity,
            height: 308.0,
            child: CarouselSlider.builder(
              itemCount: postImages.length,
              itemBuilder: (context, postImagesIndex, _) {
                final postImagesItem = postImages[postImagesIndex];
                return Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: FlutterFlowExpandedImageView(
                            image: Image.network(
                              postImagesItem,
                              fit: BoxFit.contain,
                              alignment: const Alignment(-1.0, 0.0),
                            ),
                            allowRotation: false,
                            tag: postImagesItem,
                            useHeroAnimation: true,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: postImagesItem,
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          postImagesItem,
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 308.0,
                          fit: BoxFit.cover,
                          alignment: const Alignment(-1.0, 0.0),
                        ),
                      ),
                    ),
                  ),
                );
              },
              carouselController: _model.carouselController ??=
                  CarouselController(),
              options: CarouselOptions(
                initialPage: max(0, min(1, postImages.length - 1)),
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
    );
  }
}
