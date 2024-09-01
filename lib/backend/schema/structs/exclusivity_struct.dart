// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ExclusivityStruct extends FFFirebaseStruct {
  ExclusivityStruct({
    bool? tickets,
    bool? sponsorship,
    bool? exclusiveAccess,
    bool? public,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tickets = tickets,
        _sponsorship = sponsorship,
        _exclusiveAccess = exclusiveAccess,
        _public = public,
        super(firestoreUtilData);

  // "Tickets" field.
  bool? _tickets;
  bool get tickets => _tickets ?? false;
  set tickets(bool? val) => _tickets = val;

  bool hasTickets() => _tickets != null;

  // "Sponsorship" field.
  bool? _sponsorship;
  bool get sponsorship => _sponsorship ?? false;
  set sponsorship(bool? val) => _sponsorship = val;

  bool hasSponsorship() => _sponsorship != null;

  // "ExclusiveAccess" field.
  bool? _exclusiveAccess;
  bool get exclusiveAccess => _exclusiveAccess ?? false;
  set exclusiveAccess(bool? val) => _exclusiveAccess = val;

  bool hasExclusiveAccess() => _exclusiveAccess != null;

  // "Public" field.
  bool? _public;
  bool get public => _public ?? false;
  set public(bool? val) => _public = val;

  bool hasPublic() => _public != null;

  static ExclusivityStruct fromMap(Map<String, dynamic> data) =>
      ExclusivityStruct(
        tickets: data['Tickets'] as bool?,
        sponsorship: data['Sponsorship'] as bool?,
        exclusiveAccess: data['ExclusiveAccess'] as bool?,
        public: data['Public'] as bool?,
      );

  static ExclusivityStruct? maybeFromMap(dynamic data) => data is Map
      ? ExclusivityStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Tickets': _tickets,
        'Sponsorship': _sponsorship,
        'ExclusiveAccess': _exclusiveAccess,
        'Public': _public,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Tickets': serializeParam(
          _tickets,
          ParamType.bool,
        ),
        'Sponsorship': serializeParam(
          _sponsorship,
          ParamType.bool,
        ),
        'ExclusiveAccess': serializeParam(
          _exclusiveAccess,
          ParamType.bool,
        ),
        'Public': serializeParam(
          _public,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ExclusivityStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExclusivityStruct(
        tickets: deserializeParam(
          data['Tickets'],
          ParamType.bool,
          false,
        ),
        sponsorship: deserializeParam(
          data['Sponsorship'],
          ParamType.bool,
          false,
        ),
        exclusiveAccess: deserializeParam(
          data['ExclusiveAccess'],
          ParamType.bool,
          false,
        ),
        public: deserializeParam(
          data['Public'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ExclusivityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExclusivityStruct &&
        tickets == other.tickets &&
        sponsorship == other.sponsorship &&
        exclusiveAccess == other.exclusiveAccess &&
        public == other.public;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([tickets, sponsorship, exclusiveAccess, public]);
}

ExclusivityStruct createExclusivityStruct({
  bool? tickets,
  bool? sponsorship,
  bool? exclusiveAccess,
  bool? public,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExclusivityStruct(
      tickets: tickets,
      sponsorship: sponsorship,
      exclusiveAccess: exclusiveAccess,
      public: public,
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
