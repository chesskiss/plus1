// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EventTypeStruct extends FFFirebaseStruct {
  EventTypeStruct({
    bool? sports,
    bool? dining,
    bool? watch,
    bool? drink,
    bool? relax,
    bool? other,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sports = sports,
        _dining = dining,
        _watch = watch,
        _drink = drink,
        _relax = relax,
        _other = other,
        super(firestoreUtilData);

  // "Sports" field.
  bool? _sports;
  bool get sports => _sports ?? false;
  set sports(bool? val) => _sports = val;

  bool hasSports() => _sports != null;

  // "Dining" field.
  bool? _dining;
  bool get dining => _dining ?? false;
  set dining(bool? val) => _dining = val;

  bool hasDining() => _dining != null;

  // "Watch" field.
  bool? _watch;
  bool get watch => _watch ?? false;
  set watch(bool? val) => _watch = val;

  bool hasWatch() => _watch != null;

  // "Drink" field.
  bool? _drink;
  bool get drink => _drink ?? false;
  set drink(bool? val) => _drink = val;

  bool hasDrink() => _drink != null;

  // "Relax" field.
  bool? _relax;
  bool get relax => _relax ?? false;
  set relax(bool? val) => _relax = val;

  bool hasRelax() => _relax != null;

  // "Other" field.
  bool? _other;
  bool get other => _other ?? false;
  set other(bool? val) => _other = val;

  bool hasOther() => _other != null;

  static EventTypeStruct fromMap(Map<String, dynamic> data) => EventTypeStruct(
        sports: data['Sports'] as bool?,
        dining: data['Dining'] as bool?,
        watch: data['Watch'] as bool?,
        drink: data['Drink'] as bool?,
        relax: data['Relax'] as bool?,
        other: data['Other'] as bool?,
      );

  static EventTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? EventTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Sports': _sports,
        'Dining': _dining,
        'Watch': _watch,
        'Drink': _drink,
        'Relax': _relax,
        'Other': _other,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Sports': serializeParam(
          _sports,
          ParamType.bool,
        ),
        'Dining': serializeParam(
          _dining,
          ParamType.bool,
        ),
        'Watch': serializeParam(
          _watch,
          ParamType.bool,
        ),
        'Drink': serializeParam(
          _drink,
          ParamType.bool,
        ),
        'Relax': serializeParam(
          _relax,
          ParamType.bool,
        ),
        'Other': serializeParam(
          _other,
          ParamType.bool,
        ),
      }.withoutNulls;

  static EventTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventTypeStruct(
        sports: deserializeParam(
          data['Sports'],
          ParamType.bool,
          false,
        ),
        dining: deserializeParam(
          data['Dining'],
          ParamType.bool,
          false,
        ),
        watch: deserializeParam(
          data['Watch'],
          ParamType.bool,
          false,
        ),
        drink: deserializeParam(
          data['Drink'],
          ParamType.bool,
          false,
        ),
        relax: deserializeParam(
          data['Relax'],
          ParamType.bool,
          false,
        ),
        other: deserializeParam(
          data['Other'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'EventTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventTypeStruct &&
        sports == other.sports &&
        dining == other.dining &&
        watch == other.watch &&
        drink == other.drink &&
        relax == other.relax &&
        other == other.other;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([sports, dining, watch, drink, relax, other]);
}

EventTypeStruct createEventTypeStruct({
  bool? sports,
  bool? dining,
  bool? watch,
  bool? drink,
  bool? relax,
  bool? other,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventTypeStruct(
      sports: sports,
      dining: dining,
      watch: watch,
      drink: drink,
      relax: relax,
      other: other,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventTypeStruct? updateEventTypeStruct(
  EventTypeStruct? eventType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    eventType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventTypeStructData(
  Map<String, dynamic> firestoreData,
  EventTypeStruct? eventType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (eventType == null) {
    return;
  }
  if (eventType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && eventType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventTypeData = getEventTypeFirestoreData(eventType, forFieldValue);
  final nestedData = eventTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = eventType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventTypeFirestoreData(
  EventTypeStruct? eventType, [
  bool forFieldValue = false,
]) {
  if (eventType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(eventType.toMap());

  // Add any Firestore field values
  eventType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventTypeListFirestoreData(
  List<EventTypeStruct>? eventTypes,
) =>
    eventTypes?.map((e) => getEventTypeFirestoreData(e, true)).toList() ?? [];
