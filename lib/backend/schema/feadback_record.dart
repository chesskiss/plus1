import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeadbackRecord extends FirestoreRecord {
  FeadbackRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "UserName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "Feadback" field.
  String? _feadback;
  String get feadback => _feadback ?? '';
  bool hasFeadback() => _feadback != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _userName = snapshotData['UserName'] as String?;
    _feadback = snapshotData['Feadback'] as String?;
    _image = snapshotData['Image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Feadback');

  static Stream<FeadbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeadbackRecord.fromSnapshot(s));

  static Future<FeadbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeadbackRecord.fromSnapshot(s));

  static FeadbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeadbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeadbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeadbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeadbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeadbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeadbackRecordData({
  String? userName,
  String? feadback,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UserName': userName,
      'Feadback': feadback,
      'Image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeadbackRecordDocumentEquality implements Equality<FeadbackRecord> {
  const FeadbackRecordDocumentEquality();

  @override
  bool equals(FeadbackRecord? e1, FeadbackRecord? e2) {
    return e1?.userName == e2?.userName &&
        e1?.feadback == e2?.feadback &&
        e1?.image == e2?.image;
  }

  @override
  int hash(FeadbackRecord? e) =>
      const ListEquality().hash([e?.userName, e?.feadback, e?.image]);

  @override
  bool isValidKey(Object? o) => o is FeadbackRecord;
}
