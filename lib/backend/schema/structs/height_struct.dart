// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class HeightStruct extends FFFirebaseStruct {
  HeightStruct({
    int? ft,
    int? inch,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ft = ft,
        _inch = inch,
        super(firestoreUtilData);

  // "ft" field.
  int? _ft;
  int get ft => _ft ?? 0;
  set ft(int? val) => _ft = val;

  void incrementFt(int amount) => ft = ft + amount;

  bool hasFt() => _ft != null;

  // "inch" field.
  int? _inch;
  int get inch => _inch ?? 0;
  set inch(int? val) => _inch = val;

  void incrementInch(int amount) => inch = inch + amount;

  bool hasInch() => _inch != null;

  static HeightStruct fromMap(Map<String, dynamic> data) => HeightStruct(
        ft: castToType<int>(data['ft']),
        inch: castToType<int>(data['inch']),
      );

  static HeightStruct? maybeFromMap(dynamic data) =>
      data is Map ? HeightStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ft': _ft,
        'inch': _inch,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ft': serializeParam(
          _ft,
          ParamType.int,
        ),
        'inch': serializeParam(
          _inch,
          ParamType.int,
        ),
      }.withoutNulls;

  static HeightStruct fromSerializableMap(Map<String, dynamic> data) =>
      HeightStruct(
        ft: deserializeParam(
          data['ft'],
          ParamType.int,
          false,
        ),
        inch: deserializeParam(
          data['inch'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'HeightStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HeightStruct && ft == other.ft && inch == other.inch;
  }

  @override
  int get hashCode => const ListEquality().hash([ft, inch]);
}

HeightStruct createHeightStruct({
  int? ft,
  int? inch,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HeightStruct(
      ft: ft,
      inch: inch,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HeightStruct? updateHeightStruct(
  HeightStruct? height, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    height
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHeightStructData(
  Map<String, dynamic> firestoreData,
  HeightStruct? height,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (height == null) {
    return;
  }
  if (height.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && height.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final heightData = getHeightFirestoreData(height, forFieldValue);
  final nestedData = heightData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = height.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHeightFirestoreData(
  HeightStruct? height, [
  bool forFieldValue = false,
]) {
  if (height == null) {
    return {};
  }
  final firestoreData = mapToFirestore(height.toMap());

  // Add any Firestore field values
  height.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHeightListFirestoreData(
  List<HeightStruct>? heights,
) =>
    heights?.map((e) => getHeightFirestoreData(e, true)).toList() ?? [];
