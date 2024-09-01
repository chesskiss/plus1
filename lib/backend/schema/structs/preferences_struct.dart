// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PreferencesStruct extends FFFirebaseStruct {
  PreferencesStruct({
    bool? men,
    bool? women,
    bool? nonBinary,
    bool? twoSpirits,
    String? other,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _men = men,
        _women = women,
        _nonBinary = nonBinary,
        _twoSpirits = twoSpirits,
        _other = other,
        super(firestoreUtilData);

  // "Men" field.
  bool? _men;
  bool get men => _men ?? false;
  set men(bool? val) => _men = val;

  bool hasMen() => _men != null;

  // "Women" field.
  bool? _women;
  bool get women => _women ?? false;
  set women(bool? val) => _women = val;

  bool hasWomen() => _women != null;

  // "NonBinary" field.
  bool? _nonBinary;
  bool get nonBinary => _nonBinary ?? false;
  set nonBinary(bool? val) => _nonBinary = val;

  bool hasNonBinary() => _nonBinary != null;

  // "TwoSpirits" field.
  bool? _twoSpirits;
  bool get twoSpirits => _twoSpirits ?? false;
  set twoSpirits(bool? val) => _twoSpirits = val;

  bool hasTwoSpirits() => _twoSpirits != null;

  // "Other" field.
  String? _other;
  String get other => _other ?? '';
  set other(String? val) => _other = val;

  bool hasOther() => _other != null;

  static PreferencesStruct fromMap(Map<String, dynamic> data) =>
      PreferencesStruct(
        men: data['Men'] as bool?,
        women: data['Women'] as bool?,
        nonBinary: data['NonBinary'] as bool?,
        twoSpirits: data['TwoSpirits'] as bool?,
        other: data['Other'] as String?,
      );

  static PreferencesStruct? maybeFromMap(dynamic data) => data is Map
      ? PreferencesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Men': _men,
        'Women': _women,
        'NonBinary': _nonBinary,
        'TwoSpirits': _twoSpirits,
        'Other': _other,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Men': serializeParam(
          _men,
          ParamType.bool,
        ),
        'Women': serializeParam(
          _women,
          ParamType.bool,
        ),
        'NonBinary': serializeParam(
          _nonBinary,
          ParamType.bool,
        ),
        'TwoSpirits': serializeParam(
          _twoSpirits,
          ParamType.bool,
        ),
        'Other': serializeParam(
          _other,
          ParamType.String,
        ),
      }.withoutNulls;

  static PreferencesStruct fromSerializableMap(Map<String, dynamic> data) =>
      PreferencesStruct(
        men: deserializeParam(
          data['Men'],
          ParamType.bool,
          false,
        ),
        women: deserializeParam(
          data['Women'],
          ParamType.bool,
          false,
        ),
        nonBinary: deserializeParam(
          data['NonBinary'],
          ParamType.bool,
          false,
        ),
        twoSpirits: deserializeParam(
          data['TwoSpirits'],
          ParamType.bool,
          false,
        ),
        other: deserializeParam(
          data['Other'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PreferencesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PreferencesStruct &&
        men == other.men &&
        women == other.women &&
        nonBinary == other.nonBinary &&
        twoSpirits == other.twoSpirits &&
        other == other.other;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([men, women, nonBinary, twoSpirits, other]);
}

PreferencesStruct createPreferencesStruct({
  bool? men,
  bool? women,
  bool? nonBinary,
  bool? twoSpirits,
  String? other,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PreferencesStruct(
      men: men,
      women: women,
      nonBinary: nonBinary,
      twoSpirits: twoSpirits,
      other: other,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PreferencesStruct? updatePreferencesStruct(
  PreferencesStruct? preferences, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    preferences
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPreferencesStructData(
  Map<String, dynamic> firestoreData,
  PreferencesStruct? preferences,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (preferences == null) {
    return;
  }
  if (preferences.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && preferences.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final preferencesData =
      getPreferencesFirestoreData(preferences, forFieldValue);
  final nestedData =
      preferencesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = preferences.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPreferencesFirestoreData(
  PreferencesStruct? preferences, [
  bool forFieldValue = false,
]) {
  if (preferences == null) {
    return {};
  }
  final firestoreData = mapToFirestore(preferences.toMap());

  // Add any Firestore field values
  preferences.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPreferencesListFirestoreData(
  List<PreferencesStruct>? preferencess,
) =>
    preferencess?.map((e) => getPreferencesFirestoreData(e, true)).toList() ??
    [];
