// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserEventStruct extends FFFirebaseStruct {
  UserEventStruct({
    bool? haveAccess,
    DocumentReference? eventPtr,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _haveAccess = haveAccess,
        _eventPtr = eventPtr,
        super(firestoreUtilData);

  // "HaveAccess" field.
  bool? _haveAccess;
  bool get haveAccess => _haveAccess ?? false;
  set haveAccess(bool? val) => _haveAccess = val;

  bool hasHaveAccess() => _haveAccess != null;

  // "EventPtr" field.
  DocumentReference? _eventPtr;
  DocumentReference? get eventPtr => _eventPtr;
  set eventPtr(DocumentReference? val) => _eventPtr = val;

  bool hasEventPtr() => _eventPtr != null;

  static UserEventStruct fromMap(Map<String, dynamic> data) => UserEventStruct(
        haveAccess: data['HaveAccess'] as bool?,
        eventPtr: data['EventPtr'] as DocumentReference?,
      );

  static UserEventStruct? maybeFromMap(dynamic data) => data is Map
      ? UserEventStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'HaveAccess': _haveAccess,
        'EventPtr': _eventPtr,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'HaveAccess': serializeParam(
          _haveAccess,
          ParamType.bool,
        ),
        'EventPtr': serializeParam(
          _eventPtr,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static UserEventStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserEventStruct(
        haveAccess: deserializeParam(
          data['HaveAccess'],
          ParamType.bool,
          false,
        ),
        eventPtr: deserializeParam(
          data['EventPtr'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['post'],
        ),
      );

  @override
  String toString() => 'UserEventStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserEventStruct &&
        haveAccess == other.haveAccess &&
        eventPtr == other.eventPtr;
  }

  @override
  int get hashCode => const ListEquality().hash([haveAccess, eventPtr]);
}

UserEventStruct createUserEventStruct({
  bool? haveAccess,
  DocumentReference? eventPtr,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserEventStruct(
      haveAccess: haveAccess,
      eventPtr: eventPtr,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserEventStruct? updateUserEventStruct(
  UserEventStruct? userEvent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userEvent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserEventStructData(
  Map<String, dynamic> firestoreData,
  UserEventStruct? userEvent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userEvent == null) {
    return;
  }
  if (userEvent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userEvent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userEventData = getUserEventFirestoreData(userEvent, forFieldValue);
  final nestedData = userEventData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userEvent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserEventFirestoreData(
  UserEventStruct? userEvent, [
  bool forFieldValue = false,
]) {
  if (userEvent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userEvent.toMap());

  // Add any Firestore field values
  userEvent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserEventListFirestoreData(
  List<UserEventStruct>? userEvents,
) =>
    userEvents?.map((e) => getUserEventFirestoreData(e, true)).toList() ?? [];
