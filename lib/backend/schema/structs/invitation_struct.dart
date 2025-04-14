// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvitationStruct extends FFFirebaseStruct {
  InvitationStruct({
    DocumentReference? chat,
    DocumentReference? sender,
    DateTime? time,
    Status? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _chat = chat,
        _sender = sender,
        _time = time,
        _status = status,
        super(firestoreUtilData);

  // "chat" field.
  DocumentReference? _chat;
  DocumentReference? get chat => _chat;
  set chat(DocumentReference? val) => _chat = val;

  bool hasChat() => _chat != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  set sender(DocumentReference? val) => _sender = val;

  bool hasSender() => _sender != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  // "status" field.
  Status? _status;
  Status get status => _status ?? Status.pending;
  set status(Status? val) => _status = val;

  bool hasStatus() => _status != null;

  static InvitationStruct fromMap(Map<String, dynamic> data) =>
      InvitationStruct(
        chat: data['chat'] as DocumentReference?,
        sender: data['sender'] as DocumentReference?,
        time: data['time'] as DateTime?,
        status: data['status'] is Status
            ? data['status']
            : deserializeEnum<Status>(data['status']),
      );

  static InvitationStruct? maybeFromMap(dynamic data) => data is Map
      ? InvitationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'chat': _chat,
        'sender': _sender,
        'time': _time,
        'status': _status?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'chat': serializeParam(
          _chat,
          ParamType.DocumentReference,
        ),
        'sender': serializeParam(
          _sender,
          ParamType.DocumentReference,
        ),
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static InvitationStruct fromSerializableMap(Map<String, dynamic> data) =>
      InvitationStruct(
        chat: deserializeParam(
          data['chat'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['chat'],
        ),
        sender: deserializeParam(
          data['sender'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user'],
        ),
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeParam<Status>(
          data['status'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'InvitationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InvitationStruct &&
        chat == other.chat &&
        sender == other.sender &&
        time == other.time &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([chat, sender, time, status]);
}

InvitationStruct createInvitationStruct({
  DocumentReference? chat,
  DocumentReference? sender,
  DateTime? time,
  Status? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InvitationStruct(
      chat: chat,
      sender: sender,
      time: time,
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InvitationStruct? updateInvitationStruct(
  InvitationStruct? invitation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    invitation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInvitationStructData(
  Map<String, dynamic> firestoreData,
  InvitationStruct? invitation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (invitation == null) {
    return;
  }
  if (invitation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && invitation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final invitationData = getInvitationFirestoreData(invitation, forFieldValue);
  final nestedData = invitationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = invitation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInvitationFirestoreData(
  InvitationStruct? invitation, [
  bool forFieldValue = false,
]) {
  if (invitation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(invitation.toMap());

  // Add any Firestore field values
  invitation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInvitationListFirestoreData(
  List<InvitationStruct>? invitations,
) =>
    invitations?.map((e) => getInvitationFirestoreData(e, true)).toList() ?? [];
