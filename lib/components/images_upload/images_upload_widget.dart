import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'images_upload_model.dart';
export 'images_upload_model.dart';

class ImagesUploadWidget extends StatefulWidget {
  const ImagesUploadWidget({
    super.key,
    this.alreadyUploaded,
  });

  final List<String>? alreadyUploaded;

  @override
  State<ImagesUploadWidget> createState() => _ImagesUploadWidgetState();
}

class _ImagesUploadWidgetState extends State<ImagesUploadWidget> {
  late ImagesUploadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImagesUploadModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('IMAGES_UPLOAD_ImagesUpload_ON_INIT_STATE');
      logFirebaseEvent('ImagesUpload_update_component_state');
      _model.uploadedImages = widget.alreadyUploaded!.toList().cast<String>();
      _model.updatePage(() {});
    });

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
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            'Add images (at least 1)',
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Figtree',
                  letterSpacing: 0.0,
                ),
          ),
        ),

        // Each time we upload an image, it moves to the first empty index. Meaning, no "holes" are possible in the componenet's list.
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  child: Stack(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    children: [
                      // We will show this place holder only if there is not image in index 0, and no image is currently being uploaded.
                      // If an image is being replaced it means it already exists at index 0 so no need to check if "image2 is being uploaded".
                      if (!_model.isDataUploading1 &&
                          (_model.uploadedImages.length <= 0))
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'IMAGES_UPLOAD_imagePlaceholder1_ON_TAP');
                            logFirebaseEvent(
                                'imagePlaceholder1_upload_media_to_fireba');
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              imageQuality: 79,
                              allowPhoto: true,
                              allowVideo: true,
                              includeBlurHash: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              pickerFontFamily: 'Figtree',
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(
                                  () => _model.isDataUploading1 = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading1 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile1 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl1 = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                safeSetState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }

                            if (_model.uploadedFileUrl1 != '') {
                              logFirebaseEvent(
                                  'imagePlaceholder1_update_component_state');
                              _model.insertAtIndexInUploadedImages(
                                  0, _model.uploadedFileUrl1);
                              safeSetState(() {});
                            }
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            height: 465.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 24.0),
                                  child: Icon(
                                    Icons.add_a_photo_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 72.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      // If an image has been uploaded at position 0, or is being uploaded or is being replaces, we will show this.
                      //
                      if (_model.isDataUploading2 ||
                          (_model.uploadedImages.length > 0) ||
                          _model.isDataUploading1)
                        Stack(
                          alignment: AlignmentDirectional(1.0, 1.0),
                          children: [
                            // We use this for the files that was already uploaded. Can be both a video or an image.
                            if (!_model.isDataUploading2 &&
                                !_model.isDataUploading1)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'IMAGES_UPLOAD_MediaDisplay_oqu4sdkw_ON_T');
                                      logFirebaseEvent(
                                          'MediaDisplay_upload_media_to_firebase');
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        allowPhoto: true,
                                        allowVideo: true,
                                        includeBlurHash: true,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        pickerFontFamily: 'Figtree',
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        safeSetState(() =>
                                            _model.isDataUploading2 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

                                          downloadUrls = (await Future.wait(
                                            selectedMedia.map(
                                              (m) async => await uploadData(
                                                  m.storagePath, m.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          _model.isDataUploading2 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          safeSetState(() {
                                            _model.uploadedLocalFile2 =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl2 =
                                                downloadUrls.first;
                                          });
                                          showUploadMessage(
                                              context, 'Success!');
                                        } else {
                                          safeSetState(() {});
                                          showUploadMessage(
                                              context, 'Failed to upload data');
                                          return;
                                        }
                                      }

                                      if (_model.uploadedFileUrl2 != '') {
                                        logFirebaseEvent(
                                            'MediaDisplay_update_component_state');
                                        _model.removeFromUploadedImages(
                                            _model.uploadedImages.firstOrNull!);
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'MediaDisplay_update_component_state');
                                        _model.insertAtIndexInUploadedImages(
                                            0, _model.uploadedFileUrl2);
                                        safeSetState(() {});
                                      }
                                    },
                                    child: FlutterFlowMediaDisplay(
                                      path: _model.uploadedImages.firstOrNull!,
                                      imageBuilder: (path) => ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: Image.network(
                                          path,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          height: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      videoPlayerBuilder: (path) =>
                                          FlutterFlowVideoPlayer(
                                        path: path,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.3,
                                        height: double.infinity,
                                        autoPlay: true,
                                        looping: true,
                                        showControls: true,
                                        allowFullScreen: true,
                                        allowPlaybackSpeedMenu: false,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            // If it's in the process of being uplaoded we will show this hash as a temoporary place holder.
                            if (_model.isDataUploading2 ||
                                _model.isDataUploading1)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: OctoImage(
                                  placeholderBuilder: (_) => SizedBox.expand(
                                    child: Image(
                                      image: BlurHashImage(_model
                                              .isDataUploading1
                                          ? _model.uploadedLocalFile1.blurHash!
                                          : _model
                                              .uploadedLocalFile2.blurHash!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  image: NetworkImage(
                                    '',
                                  ),
                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.3,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(
                                    'assets/images/error_image.jpeg',
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.3,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.3,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 35.8,
                                hoverColor:
                                    FlutterFlowTheme.of(context).alternate,
                                hoverIconColor:
                                    FlutterFlowTheme.of(context).error,
                                icon: Icon(
                                  Icons.cancel_outlined,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 35.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'IMAGES_UPLOAD_DeleteIconButton_ON_TAP');
                                  logFirebaseEvent(
                                      'DeleteIconButton_update_component_state');
                                  _model.removeFromUploadedImages(
                                      _model.uploadedImages.firstOrNull!);
                                  logFirebaseEvent(
                                      'DeleteIconButton_clear_uploaded_data');
                                  safeSetState(() {
                                    _model.isDataUploading1 = false;
                                    _model.uploadedLocalFile1 = FFUploadedFile(
                                        bytes: Uint8List.fromList([]));
                                    _model.uploadedFileUrl1 = '';
                                  });

                                  logFirebaseEvent(
                                      'DeleteIconButton_clear_uploaded_data');
                                  safeSetState(() {
                                    _model.isDataUploading2 = false;
                                    _model.uploadedLocalFile2 = FFUploadedFile(
                                        bytes: Uint8List.fromList([]));
                                    _model.uploadedFileUrl2 = '';
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.25,
                child: Stack(
                  alignment: AlignmentDirectional(1.0, 1.0),
                  children: [
                    if (!_model.isDataUploading3 &&
                        (_model.uploadedImages.length <= 1))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'IMAGES_UPLOAD_imagePlaceholder2_ON_TAP');
                          logFirebaseEvent(
                              'imagePlaceholder2_upload_media_to_fireba');
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            imageQuality: 79,
                            allowPhoto: true,
                            includeBlurHash: true,
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textColor: FlutterFlowTheme.of(context).primaryText,
                            pickerFontFamily: 'Figtree',
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            safeSetState(() => _model.isDataUploading3 = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            var downloadUrls = <String>[];
                            try {
                              showUploadMessage(
                                context,
                                'Uploading file...',
                                showLoading: true,
                              );
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                      ))
                                  .toList();

                              downloadUrls = (await Future.wait(
                                selectedMedia.map(
                                  (m) async =>
                                      await uploadData(m.storagePath, m.bytes),
                                ),
                              ))
                                  .where((u) => u != null)
                                  .map((u) => u!)
                                  .toList();
                            } finally {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              _model.isDataUploading3 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile3 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl3 = downloadUrls.first;
                              });
                              showUploadMessage(context, 'Success!');
                            } else {
                              safeSetState(() {});
                              showUploadMessage(
                                  context, 'Failed to upload data');
                              return;
                            }
                          }

                          if (_model.uploadedFileUrl3 != '') {
                            logFirebaseEvent(
                                'imagePlaceholder2_update_component_state');
                            _model.insertAtIndexInUploadedImages(
                                _model.uploadedImages.length < 2
                                    ? _model.uploadedImages.length
                                    : 1,
                                _model.uploadedFileUrl3);
                            safeSetState(() {});
                            logFirebaseEvent(
                                'imagePlaceholder2_clear_uploaded_data');
                            safeSetState(() {
                              _model.isDataUploading3 = false;
                              _model.uploadedLocalFile3 =
                                  FFUploadedFile(bytes: Uint8List.fromList([]));
                              _model.uploadedFileUrl3 = '';
                            });
                          }
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.3,
                          height: 465.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 24.0),
                                child: Icon(
                                  Icons.add_a_photo_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 72.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (_model.isDataUploading4 ||
                        (_model.uploadedImages.length > 1) ||
                        _model.isDataUploading3)
                      Stack(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        children: [
                          if (!_model.isDataUploading4 &&
                              !_model.isDataUploading3)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'IMAGES_UPLOAD_MediaDisplay_o3uze61j_ON_T');
                                    logFirebaseEvent(
                                        'MediaDisplay_upload_media_to_firebase');
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                      allowVideo: true,
                                      includeBlurHash: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      textColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      pickerFontFamily: 'Figtree',
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      safeSetState(
                                          () => _model.isDataUploading4 = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          'Uploading file...',
                                          showLoading: true,
                                        );
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        _model.isDataUploading4 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        safeSetState(() {
                                          _model.uploadedLocalFile4 =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl4 =
                                              downloadUrls.first;
                                        });
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        safeSetState(() {});
                                        showUploadMessage(
                                            context, 'Failed to upload data');
                                        return;
                                      }
                                    }

                                    if (_model.uploadedFileUrl4 != '') {
                                      logFirebaseEvent(
                                          'MediaDisplay_update_component_state');
                                      _model.removeFromUploadedImages(_model
                                          .uploadedImages
                                          .elementAtOrNull(1)!);
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'MediaDisplay_update_component_state');
                                      _model.insertAtIndexInUploadedImages(
                                          1, _model.uploadedFileUrl4);
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'MediaDisplay_clear_uploaded_data');
                                      safeSetState(() {
                                        _model.isDataUploading4 = false;
                                        _model.uploadedLocalFile4 =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]));
                                        _model.uploadedFileUrl4 = '';
                                      });
                                    }
                                  },
                                  child: FlutterFlowMediaDisplay(
                                    path: _model.uploadedImages
                                        .elementAtOrNull(1)!,
                                    imageBuilder: (path) => ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(
                                        path,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.3,
                                        height: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    videoPlayerBuilder: (path) =>
                                        FlutterFlowVideoPlayer(
                                      path: path,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.3,
                                      autoPlay: false,
                                      looping: true,
                                      showControls: true,
                                      allowFullScreen: true,
                                      allowPlaybackSpeedMenu: false,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (_model.isDataUploading4 ||
                              _model.isDataUploading3)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: OctoImage(
                                placeholderBuilder: (_) => SizedBox.expand(
                                  child: Image(
                                    image: BlurHashImage(_model.isDataUploading3
                                        ? _model.uploadedLocalFile3.blurHash!
                                        : _model.uploadedLocalFile4.blurHash!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                image: NetworkImage(
                                  '',
                                ),
                                width: MediaQuery.sizeOf(context).width * 0.3,
                                height: MediaQuery.sizeOf(context).height * 0.3,
                                fit: BoxFit.fill,
                              ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 35.8,
                              hoverColor:
                                  FlutterFlowTheme.of(context).alternate,
                              hoverIconColor:
                                  FlutterFlowTheme.of(context).error,
                              icon: Icon(
                                Icons.cancel_outlined,
                                color: FlutterFlowTheme.of(context).error,
                                size: 35.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'IMAGES_UPLOAD_DeleteIconButton_ON_TAP');
                                logFirebaseEvent(
                                    'DeleteIconButton_update_component_state');
                                _model.removeFromUploadedImages(
                                    _model.uploadedImages.elementAtOrNull(1)!);
                                logFirebaseEvent(
                                    'DeleteIconButton_clear_uploaded_data');
                                safeSetState(() {
                                  _model.isDataUploading3 = false;
                                  _model.uploadedLocalFile3 = FFUploadedFile(
                                      bytes: Uint8List.fromList([]));
                                  _model.uploadedFileUrl3 = '';
                                });

                                logFirebaseEvent(
                                    'DeleteIconButton_clear_uploaded_data');
                                safeSetState(() {
                                  _model.isDataUploading4 = false;
                                  _model.uploadedLocalFile4 = FFUploadedFile(
                                      bytes: Uint8List.fromList([]));
                                  _model.uploadedFileUrl4 = '';
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  child: Stack(
                    children: [
                      if (!_model.isDataUploading5 &&
                          (_model.uploadedImages.length <= 2))
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'IMAGES_UPLOAD_imagePlaceholder3_ON_TAP');
                            logFirebaseEvent(
                                'imagePlaceholder3_upload_media_to_fireba');
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              imageQuality: 79,
                              allowPhoto: true,
                              includeBlurHash: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              pickerFontFamily: 'Figtree',
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(
                                  () => _model.isDataUploading5 = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading5 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile5 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl5 = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                safeSetState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }

                            if (_model.uploadedFileUrl5 != '') {
                              logFirebaseEvent(
                                  'imagePlaceholder3_update_component_state');
                              _model.insertAtIndexInUploadedImages(
                                  _model.uploadedImages.length < 3
                                      ? _model.uploadedImages.length
                                      : 2,
                                  _model.uploadedFileUrl5);
                              safeSetState(() {});
                              logFirebaseEvent(
                                  'imagePlaceholder3_clear_uploaded_data');
                              safeSetState(() {
                                _model.isDataUploading5 = false;
                                _model.uploadedLocalFile5 = FFUploadedFile(
                                    bytes: Uint8List.fromList([]));
                                _model.uploadedFileUrl5 = '';
                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            height: 465.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 24.0),
                                  child: Icon(
                                    Icons.add_a_photo_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 72.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (_model.isDataUploading6 ||
                          (_model.uploadedImages.length > 2) ||
                          _model.isDataUploading5)
                        Stack(
                          alignment: AlignmentDirectional(1.0, 1.0),
                          children: [
                            if (!_model.isDataUploading6 &&
                                !_model.isDataUploading5)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'IMAGES_UPLOAD_MediaDisplay_p93o5lew_ON_T');
                                      logFirebaseEvent(
                                          'MediaDisplay_upload_media_to_firebase');
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        allowPhoto: true,
                                        allowVideo: true,
                                        includeBlurHash: true,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        pickerFontFamily: 'Figtree',
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        safeSetState(() =>
                                            _model.isDataUploading6 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

                                          downloadUrls = (await Future.wait(
                                            selectedMedia.map(
                                              (m) async => await uploadData(
                                                  m.storagePath, m.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          _model.isDataUploading6 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          safeSetState(() {
                                            _model.uploadedLocalFile6 =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl6 =
                                                downloadUrls.first;
                                          });
                                          showUploadMessage(
                                              context, 'Success!');
                                        } else {
                                          safeSetState(() {});
                                          showUploadMessage(
                                              context, 'Failed to upload data');
                                          return;
                                        }
                                      }

                                      if (_model.uploadedFileUrl6 != '') {
                                        logFirebaseEvent(
                                            'MediaDisplay_update_component_state');
                                        _model.removeFromUploadedImages(_model
                                            .uploadedImages
                                            .elementAtOrNull(2)!);
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'MediaDisplay_update_component_state');
                                        _model.insertAtIndexInUploadedImages(
                                            2, _model.uploadedFileUrl6);
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'MediaDisplay_clear_uploaded_data');
                                        safeSetState(() {
                                          _model.isDataUploading6 = false;
                                          _model.uploadedLocalFile6 =
                                              FFUploadedFile(
                                                  bytes:
                                                      Uint8List.fromList([]));
                                          _model.uploadedFileUrl6 = '';
                                        });
                                      }
                                    },
                                    child: FlutterFlowMediaDisplay(
                                      path: _model.uploadedImages
                                          .elementAtOrNull(2)!,
                                      imageBuilder: (path) => ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: Image.network(
                                          path,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          height: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      videoPlayerBuilder: (path) =>
                                          FlutterFlowVideoPlayer(
                                        path: path,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.3,
                                        autoPlay: false,
                                        looping: true,
                                        showControls: true,
                                        allowFullScreen: true,
                                        allowPlaybackSpeedMenu: false,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (_model.isDataUploading6 ||
                                _model.isDataUploading5)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: OctoImage(
                                  placeholderBuilder: (_) => SizedBox.expand(
                                    child: Image(
                                      image: BlurHashImage(_model
                                              .isDataUploading5
                                          ? _model.uploadedLocalFile5.blurHash!
                                          : _model
                                              .uploadedLocalFile6.blurHash!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  image: NetworkImage(
                                    '',
                                  ),
                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.3,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 35.8,
                                hoverColor:
                                    FlutterFlowTheme.of(context).alternate,
                                hoverIconColor:
                                    FlutterFlowTheme.of(context).error,
                                icon: Icon(
                                  Icons.cancel_outlined,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 35.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'IMAGES_UPLOAD_DeleteIconButton_ON_TAP');
                                  logFirebaseEvent(
                                      'DeleteIconButton_update_component_state');
                                  _model.removeFromUploadedImages(_model
                                      .uploadedImages
                                      .elementAtOrNull(2)!);
                                  logFirebaseEvent(
                                      'DeleteIconButton_clear_uploaded_data');
                                  safeSetState(() {
                                    _model.isDataUploading5 = false;
                                    _model.uploadedLocalFile5 = FFUploadedFile(
                                        bytes: Uint8List.fromList([]));
                                    _model.uploadedFileUrl5 = '';
                                  });

                                  logFirebaseEvent(
                                      'DeleteIconButton_clear_uploaded_data');
                                  safeSetState(() {
                                    _model.isDataUploading6 = false;
                                    _model.uploadedLocalFile6 = FFUploadedFile(
                                        bytes: Uint8List.fromList([]));
                                    _model.uploadedFileUrl6 = '';
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ].divide(SizedBox(height: 12.0)),
    );
  }
}
