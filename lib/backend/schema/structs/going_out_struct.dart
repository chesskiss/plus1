// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GoingOutStruct extends FFFirebaseStruct {
  GoingOutStruct({
    DocumentReference? user,
    DocumentReference? event,
    DateTime? time,
    bool? isGoingOrinterested,
    String? feedback,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _event = event,
        _time = time,
        _isGoingOrinterested = isGoingOrinterested,
        _feedback = feedback,
        super(firestoreUtilData);

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;

  bool hasUser() => _user != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  set event(DocumentReference? val) => _event = val;

  bool hasEvent() => _event != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  // "is_goingOrinterested" field.
  bool? _isGoingOrinterested;
  bool get isGoingOrinterested => _isGoingOrinterested ?? false;
  set isGoingOrinterested(bool? val) => _isGoingOrinterested = val;

  bool hasIsGoingOrinterested() => _isGoingOrinterested != null;

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  set feedback(String? val) => _feedback = val;

  bool hasFeedback() => _feedback != null;

  static GoingOutStruct fromMap(Map<String, dynamic> data) => GoingOutStruct(
        user: data['user'] as DocumentReference?,
        event: data['event'] as DocumentReference?,
        time: data['time'] as DateTime?,
        isGoingOrinterested: data['is_goingOrinterested'] as bool?,
        feedback: data['feedback'] as String?,
      );

  static GoingOutStruct? maybeFromMap(dynamic data) =>
      data is Map ? GoingOutStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'user': _user,
        'event': _event,
        'time': _time,
        'is_goingOrinterested': _isGoingOrinterested,
        'feedback': _feedback,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'event': serializeParam(
          _event,
          ParamType.DocumentReference,
        ),
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'is_goingOrinterested': serializeParam(
          _isGoingOrinterested,
          ParamType.bool,
        ),
        'feedback': serializeParam(
          _feedback,
          ParamType.String,
        ),
      }.withoutNulls;

  static GoingOutStruct fromSerializableMap(Map<String, dynamic> data) =>
      GoingOutStruct(
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user'],
        ),
        event: deserializeParam(
          data['event'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['post'],
        ),
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        isGoingOrinterested: deserializeParam(
          data['is_goingOrinterested'],
          ParamType.bool,
          false,
        ),
        feedback: deserializeParam(
          data['feedback'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GoingOutStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GoingOutStruct &&
        user == other.user &&
        event == other.event &&
        time == other.time &&
        isGoingOrinterested == other.isGoingOrinterested &&
        feedback == other.feedback;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([user, event, time, isGoingOrinterested, feedback]);
}

GoingOutStruct createGoingOutStruct({
  DocumentReference? user,
  DocumentReference? event,
  DateTime? time,
  bool? isGoingOrinterested,
  String? feedback,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GoingOutStruct(
      user: user,
      event: event,
      time: time,
      isGoingOrinterested: isGoingOrinterested,
      feedback: feedback,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GoingOutStruct? updateGoingOutStruct(
  GoingOutStruct? goingOut, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    goingOut
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGoingOutStructData(
  Map<String, dynamic> firestoreData,
  GoingOutStruct? goingOut,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (goingOut == null) {
    return;
  }
  if (goingOut.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && goingOut.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final goingOutData = getGoingOutFirestoreData(goingOut, forFieldValue);
  final nestedData = goingOutData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = goingOut.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGoingOutFirestoreData(
  GoingOutStruct? goingOut, [
  bool forFieldValue = false,
]) {
  if (goingOut == null) {
    return {};
  }
  final firestoreData = mapToFirestore(goingOut.toMap());

  // Add any Firestore field values
  goingOut.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGoingOutListFirestoreData(
  List<GoingOutStruct>? goingOuts,
) =>
    goingOuts?.map((e) => getGoingOutFirestoreData(e, true)).toList() ?? [];
