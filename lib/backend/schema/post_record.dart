import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostRecord extends FirestoreRecord {
  PostRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "timePosted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "op" field.
  DocumentReference? _op;
  DocumentReference? get op => _op;
  bool hasOp() => _op != null;

  // "videos" field.
  List<String>? _videos;
  List<String> get videos => _videos ?? const [];
  bool hasVideos() => _videos != null;

  // "photos" field.
  List<String>? _photos;
  List<String> get photos => _photos ?? const [];
  bool hasPhotos() => _photos != null;

  // "saves" field.
  List<DocumentReference>? _saves;
  List<DocumentReference> get saves => _saves ?? const [];
  bool hasSaves() => _saves != null;

  // "sponsored" field.
  bool? _sponsored;
  bool get sponsored => _sponsored ?? false;
  bool hasSponsored() => _sponsored != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "end_time" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "ActivityType" field.
  List<ActivityType>? _activityType;
  List<ActivityType> get activityType => _activityType ?? const [];
  bool hasActivityType() => _activityType != null;

  // "ExclusivityType" field.
  List<Exclusivity>? _exclusivityType;
  List<Exclusivity> get exclusivityType => _exclusivityType ?? const [];
  bool hasExclusivityType() => _exclusivityType != null;

  // "DressCode" field.
  List<DressCode>? _dressCode;
  List<DressCode> get dressCode => _dressCode ?? const [];
  bool hasDressCode() => _dressCode != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _timePosted = snapshotData['timePosted'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _op = snapshotData['op'] as DocumentReference?;
    _videos = getDataList(snapshotData['videos']);
    _photos = getDataList(snapshotData['photos']);
    _saves = getDataList(snapshotData['saves']);
    _sponsored = snapshotData['sponsored'] as bool?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _startTime = snapshotData['start_time'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _endTime = snapshotData['end_time'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
    _activityType = getEnumList<ActivityType>(snapshotData['ActivityType']);
    _exclusivityType =
        getEnumList<Exclusivity>(snapshotData['ExclusivityType']);
    _dressCode = getEnumList<DressCode>(snapshotData['DressCode']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post');

  static Stream<PostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostRecord.fromSnapshot(s));

  static Future<PostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostRecord.fromSnapshot(s));

  static PostRecord fromSnapshot(DocumentSnapshot snapshot) => PostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostRecordData({
  String? title,
  String? description,
  DateTime? timePosted,
  DocumentReference? op,
  bool? sponsored,
  DateTime? startDate,
  DateTime? startTime,
  DateTime? endDate,
  DateTime? endTime,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'timePosted': timePosted,
      'op': op,
      'sponsored': sponsored,
      'start_date': startDate,
      'start_time': startTime,
      'end_date': endDate,
      'end_time': endTime,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostRecordDocumentEquality implements Equality<PostRecord> {
  const PostRecordDocumentEquality();

  @override
  bool equals(PostRecord? e1, PostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.op == e2?.op &&
        listEquality.equals(e1?.videos, e2?.videos) &&
        listEquality.equals(e1?.photos, e2?.photos) &&
        listEquality.equals(e1?.saves, e2?.saves) &&
        e1?.sponsored == e2?.sponsored &&
        e1?.startDate == e2?.startDate &&
        e1?.startTime == e2?.startTime &&
        e1?.endDate == e2?.endDate &&
        e1?.endTime == e2?.endTime &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.activityType, e2?.activityType) &&
        listEquality.equals(e1?.exclusivityType, e2?.exclusivityType) &&
        listEquality.equals(e1?.dressCode, e2?.dressCode);
  }

  @override
  int hash(PostRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.timePosted,
        e?.likes,
        e?.op,
        e?.videos,
        e?.photos,
        e?.saves,
        e?.sponsored,
        e?.startDate,
        e?.startTime,
        e?.endDate,
        e?.endTime,
        e?.location,
        e?.activityType,
        e?.exclusivityType,
        e?.dressCode
      ]);

  @override
  bool isValidKey(Object? o) => o is PostRecord;
}
