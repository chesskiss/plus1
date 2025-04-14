// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ReportStruct extends FFFirebaseStruct {
  ReportStruct({
    DocumentReference? reportingUser,
    String? message,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _reportingUser = reportingUser,
        _message = message,
        super(firestoreUtilData);

  // "reportingUser" field.
  DocumentReference? _reportingUser;
  DocumentReference? get reportingUser => _reportingUser;
  set reportingUser(DocumentReference? val) => _reportingUser = val;

  bool hasReportingUser() => _reportingUser != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  static ReportStruct fromMap(Map<String, dynamic> data) => ReportStruct(
        reportingUser: data['reportingUser'] as DocumentReference?,
        message: data['message'] as String?,
      );

  static ReportStruct? maybeFromMap(dynamic data) =>
      data is Map ? ReportStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'reportingUser': _reportingUser,
        'message': _message,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'reportingUser': serializeParam(
          _reportingUser,
          ParamType.DocumentReference,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
      }.withoutNulls;

  static ReportStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReportStruct(
        reportingUser: deserializeParam(
          data['reportingUser'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user'],
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ReportStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReportStruct &&
        reportingUser == other.reportingUser &&
        message == other.message;
  }

  @override
  int get hashCode => const ListEquality().hash([reportingUser, message]);
}

ReportStruct createReportStruct({
  DocumentReference? reportingUser,
  String? message,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ReportStruct(
      reportingUser: reportingUser,
      message: message,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ReportStruct? updateReportStruct(
  ReportStruct? report, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    report
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addReportStructData(
  Map<String, dynamic> firestoreData,
  ReportStruct? report,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (report == null) {
    return;
  }
  if (report.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && report.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final reportData = getReportFirestoreData(report, forFieldValue);
  final nestedData = reportData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = report.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getReportFirestoreData(
  ReportStruct? report, [
  bool forFieldValue = false,
]) {
  if (report == null) {
    return {};
  }
  final firestoreData = mapToFirestore(report.toMap());

  // Add any Firestore field values
  report.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getReportListFirestoreData(
  List<ReportStruct>? reports,
) =>
    reports?.map((e) => getReportFirestoreData(e, true)).toList() ?? [];
