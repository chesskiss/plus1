import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primary,
          child: Center(
            child: Image.asset(
              'assets/images/app_social_Splash@1x.png',
              width: 600.0,
              height: 600.0,
              fit: BoxFit.scaleDown,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'forgotPassword': ParameterData.none(),
  'mainFeed': ParameterData.none(),
  'mainProfile': ParameterData.none(),
  'postDetails_v1': (data) async => ParameterData(
        allParams: {
          'postParam': await getDocumentParameter<PostRecord>(
              data, 'postParam', PostRecord.fromSnapshot),
        },
      ),
  'editSettings': ParameterData.none(),
  'editUserProfile': ParameterData.none(),
  'editDogProfile': (data) async => ParameterData(
        allParams: {
          'dogProfile': await getDocumentParameter<DogsRecord>(
              data, 'dogProfile', DogsRecord.fromSnapshot),
        },
      ),
  'changePassword': ParameterData.none(),
  'createDogProfile': ParameterData.none(),
  'chat_2_Details_real': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatRecord>(
              data, 'chatRef', ChatRecord.fromSnapshot),
        },
      ),
  'profileSwipes_v1': ParameterData.none(),
  'chat_2_InviteUsers': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatRecord>(
              data, 'chatRef', ChatRecord.fromSnapshot),
        },
      ),
  'image_Details': (data) async => ParameterData(
        allParams: {
          'chatMessage': await getDocumentParameter<ChatMessagesRecord>(
              data, 'chatMessage', ChatMessagesRecord.fromSnapshot),
        },
      ),
  'accountLoginSignup': ParameterData.none(),
  'createProfile': ParameterData.none(),
  'strangerProfile': (data) async => ParameterData(
        allParams: {
          'profile': getParameter<DocumentReference>(data, 'profile'),
        },
      ),
  'logout': ParameterData.none(),
  'StartPage': ParameterData.none(),
  'CreatePost': ParameterData.none(),
  'ChooseLocation': ParameterData.none(),
  'shared_events': (data) async => const ParameterData(
        allParams: {},
      ),
  'chat_2_Details': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatRecord>(
              data, 'chatRef', ChatRecord.fromSnapshot),
        },
      ),
  'changeEmail': ParameterData.none(),
  'editPost': (data) async => ParameterData(
        allParams: {
          'post': getParameter<DocumentReference>(data, 'post'),
        },
      ),
  'payment': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
