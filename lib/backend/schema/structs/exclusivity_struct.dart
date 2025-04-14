// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ExclusivityStruct extends FFFirebaseStruct {
  ExclusivityStruct({
    bool? exclusive,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _exclusive = exclusive,
        super(firestoreUtilData);

  // "Exclusive" field.
  bool? _exclusive;
  bool get exclusive => _exclusive ?? false;
  set exclusive(bool? val) => _exclusive = val;

  bool hasExclusive() => _exclusive != null;

  static ExclusivityStruct fromMap(Map<String, dynamic> data) =>
      ExclusivityStruct(
        exclusive: data['Exclusive'] as bool?,
      );

  static ExclusivityStruct? maybeFromMap(dynamic data) => data is Map
      ? ExclusivityStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Exclusive': _exclusive,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Exclusive': serializeParam(
          _exclusive,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ExclusivityStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExclusivityStruct(
        exclusive: deserializeParam(
          data['Exclusive'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ExclusivityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExclusivityStruct && exclusive == other.exclusive;
  }

  @override
  int get hashCode => const ListEquality().hash([exclusive]);
}

ExclusivityStruct createExclusivityStruct({
  bool? exclusive,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExclusivityStruct(
      exclusive: exclusive,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ExclusivityStruct? updateExclusivityStruct(
  ExclusivityStruct? exclusivity, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    exclusivity
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addExclusivityStructData(
  Map<String, dynamic> firestoreData,
  ExclusivityStruct? exclusivity,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (exclusivity == null) {
    return;
  }
  if (exclusivity.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && exclusivity.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final exclusivityData =
      getExclusivityFirestoreData(exclusivity, forFieldValue);
  final nestedData =
      exclusivityData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = exclusivity.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getExclusivityFirestoreData(
  ExclusivityStruct? exclusivity, [
  bool forFieldValue = false,
]) {
  if (exclusivity == null) {
    return {};
  }
  final firestoreData = mapToFirestore(exclusivity.toMap());

  // Add any Firestore field values
  exclusivity.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getExclusivityListFirestoreData(
  List<ExclusivityStruct>? exclusivitys,
) =>
    exclusivitys?.map((e) => getExclusivityFirestoreData(e, true)).toList() ??
    [];
