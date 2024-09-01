import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delete_post/delete_post_widget.dart';
import '/components/web_components/filter/filter_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'post_details_base_v1_model.dart';
export 'post_details_base_v1_model.dart';

class PostDetailsBaseV1Widget extends StatefulWidget {
  const PostDetailsBaseV1Widget({
    super.key,
    required this.postRef,
  });

  final DocumentReference? postRef;

  @override
  State<PostDetailsBaseV1Widget> createState() =>
      _PostDetailsBaseV1WidgetState();
}

class _PostDetailsBaseV1WidgetState extends State<PostDetailsBaseV1Widget> {
  late PostDetailsBaseV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostDetailsBaseV1Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PostRecord>(
      stream: PostRecord.getDocument(widget.postRef!),
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

        final containerPostRecord = snapshot.data!;

        return Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 770.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: PageView(
              controller: _model.pageViewController ??=
                  PageController(initialPage: 0),
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Builder(
                                builder: (context) {
                                  final postImages =
                                      containerPostRecord.photos.toList();

                                  return Stack(
                                    children: List.generate(postImages.length,
                                        (postImagesIndex) {
                                      final postImagesItem =
                                          postImages[postImagesIndex];
                                      return FlutterFlowMediaDisplay(
                                        path: postImagesItem,
                                        imageBuilder: (path) =>
                                            CachedNetworkImage(
                                          fadeInDuration:
                                              const Duration(milliseconds: 0),
                                          fadeOutDuration:
                                              const Duration(milliseconds: 0),
                                          imageUrl: path,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 430.0,
                                          fit: BoxFit.cover,
                                        ),
                                        videoPlayerBuilder: (path) =>
                                            FlutterFlowVideoPlayer(
                                          path: path,
                                          width: double.infinity,
                                          height: double.infinity,
                                          autoPlay: true,
                                          looping: true,
                                          showControls: false,
                                          allowFullScreen: true,
                                          allowPlaybackSpeedMenu: false,
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 64.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context).accent4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      buttonSize: 46.0,
                                      icon: Icon(
                                        Icons.arrow_back_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 25.0,
                                      ),
                                      onPressed: () async {
                                        context.safePop();
                                      },
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 44.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    icon: Icon(
                                      Icons.more_vert_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: const Color(0x00000000),
                                        barrierColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: const SizedBox(
                                              height: 230.0,
                                              child: DeletePostWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 4.0, 16.0, 6.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ToggleIcon(
                                      onPressed: () async {
                                        final likesElement =
                                            currentUserReference;
                                        final likesUpdate = containerPostRecord
                                                .likes
                                                .contains(likesElement)
                                            ? FieldValue.arrayRemove(
                                                [likesElement])
                                            : FieldValue.arrayUnion(
                                                [likesElement]);
                                        await containerPostRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'likes': likesUpdate,
                                            },
                                          ),
                                        });
                                        if ((currentUserDocument?.likedPosts
                                                    .toList() ??
                                                [])
                                            .contains(widget.postRef)) {
                                          // RemoveFromLikedList

                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'likedPosts':
                                                    FieldValue.arrayRemove([
                                                  containerPostRecord.reference
                                                ]),
                                              },
                                            ),
                                          });
                                        } else {
                                          // AddToLikedList

                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'likedPosts':
                                                    FieldValue.arrayUnion([
                                                  containerPostRecord.reference
                                                ]),
                                              },
                                            ),
                                          });
                                        }
                                      },
                                      value: containerPostRecord.likes
                                          .contains(currentUserReference),
                                      onIcon: Icon(
                                        Icons.favorite,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 25.0,
                                      ),
                                      offIcon: Icon(
                                        Icons.favorite_border,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 25.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        containerPostRecord.likes.length
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Likes',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<UserRecord>(
                                    stream: UserRecord.getDocument(
                                        currentUserReference!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      final toggleIconUserRecord =
                                          snapshot.data!;

                                      return ToggleIcon(
                                        onPressed: () async {
                                          final savedPostsElement =
                                              containerPostRecord.reference;
                                          final savedPostsUpdate =
                                              toggleIconUserRecord.savedPosts
                                                      .contains(
                                                          savedPostsElement)
                                                  ? FieldValue.arrayRemove(
                                                      [savedPostsElement])
                                                  : FieldValue.arrayUnion(
                                                      [savedPostsElement]);
                                          await toggleIconUserRecord.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'savedPosts': savedPostsUpdate,
                                              },
                                            ),
                                          });
                                          if (toggleIconUserRecord.savedPosts
                                              .contains(widget.postRef)) {
                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'savedPosts':
                                                      FieldValue.arrayRemove([
                                                    containerPostRecord
                                                        .reference
                                                  ]),
                                                },
                                              ),
                                            });
                                          } else {
                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'savedPosts':
                                                      FieldValue.arrayUnion([
                                                    containerPostRecord
                                                        .reference
                                                  ]),
                                                },
                                              ),
                                            });
                                          }
                                        },
                                        value: toggleIconUserRecord.savedPosts
                                            .contains(
                                                containerPostRecord.reference),
                                        onIcon: Icon(
                                          Icons.check_box,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 25.0,
                                        ),
                                        offIcon: Icon(
                                          Icons.check_box_outline_blank,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 25.0,
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      containerPostRecord.saves.length
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Saves',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            containerPostRecord.title,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            containerPostRecord.description,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text(
                                            'Exclusivity Type',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: double.infinity,
                                            height: 66.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: ListView(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Icon(
                                                  Icons.settings_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Exclusive access ',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      'Activity Type',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: FlutterFlowChoiceChips(
                                      options: const [
                                        ChipData('Sports', Icons.sports_tennis),
                                        ChipData('Eat', Icons.restaurant),
                                        ChipData('Watch', Icons.remove_red_eye),
                                        ChipData('Drink', Icons.wine_bar),
                                        ChipData('Relax', Icons.spa),
                                        ChipData('Other')
                                      ],
                                      onChanged: (val) => setState(
                                          () => _model.choiceChipsValues = val),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent2,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        borderWidth: 2.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      chipSpacing: 8.0,
                                      rowSpacing: 8.0,
                                      multiselect: true,
                                      initialized:
                                          _model.choiceChipsValues != null,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Container(
                                        width: 355.0,
                                        height: 304.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: FlutterFlowGoogleMap(
                                          controller:
                                              _model.googleMapsController,
                                          onCameraIdle: (latLng) =>
                                              _model.googleMapsCenter = latLng,
                                          initialLocation:
                                              _model.googleMapsCenter ??=
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
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 400.0,
                                    height: 400.0,
                                    constraints: BoxConstraints(
                                      minWidth: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width,
                                        90.0,
                                      ),
                                      maxWidth: double.infinity,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: FlutterFlowCalendar(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      iconColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      weekFormat: false,
                                      weekStartsMonday: false,
                                      initialDate: getCurrentTimestamp,
                                      rowHeight: 64.0,
                                      onChange:
                                          (DateTimeRange? newSelectedDate) {
                                        setState(() =>
                                            _model.calendarSelectedDay =
                                                newSelectedDate);
                                      },
                                      titleStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0.0,
                                          ),
                                      dayOfWeekStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Figtree',
                                                letterSpacing: 0.0,
                                              ),
                                      dateStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            letterSpacing: 0.0,
                                          ),
                                      selectedDateStyle:
                                          FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Figtree',
                                                letterSpacing: 0.0,
                                              ),
                                      inactiveDateStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                letterSpacing: 0.0,
                                              ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Posted on  ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Figtree',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      containerPostRecord.timePosted
                                          ?.toString(),
                                      'Now',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Figtree',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).accent1,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          await _model.pageViewController?.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    StreamBuilder<List<UserRecord>>(
                      stream: queryUserRecord(
                        queryBuilder: (userRecord) => userRecord.where(
                          'likedPosts',
                          arrayContains: widget.postRef,
                        ),
                      ),
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
                        List<UserRecord> swipeableStackUserRecordList =
                            snapshot.data!;

                        return FlutterFlowSwipeableStack(
                          onSwipeFn: (index) {},
                          onLeftSwipe: (index) {},
                          onRightSwipe: (index) {},
                          onUpSwipe: (index) {},
                          onDownSwipe: (index) {},
                          itemBuilder: (context, swipeableStackIndex) {
                            final swipeableStackUserRecord =
                                swipeableStackUserRecordList[
                                    swipeableStackIndex];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                swipeableStackUserRecord.photoUrl,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                          itemCount: swipeableStackUserRecordList.length,
                          controller: _model.swipeableStackController,
                          loop: false,
                          cardDisplayCount: 3,
                          scale: 0.9,
                          cardPadding: const EdgeInsets.all(0.0),
                        );
                      },
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-0.87, -0.93),
                      child: Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: const FilterWidget(),
                                );
                              },
                            );
                          },
                          text: '',
                          icon: const Icon(
                            Icons.filter_alt,
                            color: Color(0xEBFFFFFF),
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 15.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0x006F61EF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Figtree',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
