import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'profile_images_carousel_model.dart';
export 'profile_images_carousel_model.dart';

class ProfileImagesCarouselWidget extends StatefulWidget {
  const ProfileImagesCarouselWidget({
    super.key,
    this.usersLikedPost,
  });

  final List<DocumentReference>? usersLikedPost;

  @override
  State<ProfileImagesCarouselWidget> createState() =>
      _ProfileImagesCarouselWidgetState();
}

class _ProfileImagesCarouselWidgetState
    extends State<ProfileImagesCarouselWidget> {
  late ProfileImagesCarouselModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileImagesCarouselModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        final usersProfiles =
            (widget.usersLikedPost?.toList() ?? []).take(5).toList();

        return SizedBox(
          width: double.infinity,
          height: 180.0,
          child: CarouselSlider.builder(
            itemCount: usersProfiles.length,
            itemBuilder: (context, usersProfilesIndex, _) {
              final usersProfilesItem = usersProfiles[usersProfilesIndex];
              return StreamBuilder<UserRecord>(
                stream: UserRecord.getDocument(usersProfilesItem),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }

                  final imageUserRecord = snapshot.data!;

                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (loggedIn) {
                        // NevigateIfUser

                        context.pushNamed(
                          'strangerProfile',
                          queryParameters: {
                            'profile': serializeParam(
                              imageUserRecord.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        imageUserRecord.photoUrl,
                        width: 322.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            },
            carouselController: _model.carouselController ??=
                CarouselController(),
            options: CarouselOptions(
              initialPage: max(0, min(1, usersProfiles.length - 1)),
              viewportFraction: 0.5,
              disableCenter: true,
              enlargeCenterPage: true,
              enlargeFactor: 0.25,
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              autoPlay: false,
              onPageChanged: (index, _) => _model.carouselCurrentIndex = index,
            ),
          ),
        );
      },
    );
  }
}
