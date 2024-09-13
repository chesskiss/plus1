import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "savedPosts" field.
  List<DocumentReference>? _savedPosts;
  List<DocumentReference> get savedPosts => _savedPosts ?? const [];
  bool hasSavedPosts() => _savedPosts != null;

  // "photos" field.
  List<String>? _photos;
  List<String> get photos => _photos ?? const [];
  bool hasPhotos() => _photos != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "likedPosts" field.
  List<DocumentReference>? _likedPosts;
  List<DocumentReference> get likedPosts => _likedPosts ?? const [];
  bool hasLikedPosts() => _likedPosts != null;

  // "friends" field.
  List<DocumentReference>? _friends;
  List<DocumentReference> get friends => _friends ?? const [];
  bool hasFriends() => _friends != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "following" field.
  List<DocumentReference>? _following;
  List<DocumentReference> get following => _following ?? const [];
  bool hasFollowing() => _following != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "last_active_time" field.
  String? _lastActiveTime;
  String get lastActiveTime => _lastActiveTime ?? '';
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "matches" field.
  List<DocumentReference>? _matches;
  List<DocumentReference> get matches => _matches ?? const [];
  bool hasMatches() => _matches != null;

  // "posts" field.
  List<UserEventStruct>? _posts;
  List<UserEventStruct> get posts => _posts ?? const [];
  bool hasPosts() => _posts != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "education" field.
  String? _education;
  String get education => _education ?? '';
  bool hasEducation() => _education != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "height" field.
  HeightStruct? _height;
  HeightStruct get height => _height ?? HeightStruct();
  bool hasHeight() => _height != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "i_like" field.
  String? _iLike;
  String get iLike => _iLike ?? '';
  bool hasILike() => _iLike != null;

  // "login_times" field.
  List<DateTime>? _loginTimes;
  List<DateTime> get loginTimes => _loginTimes ?? const [];
  bool hasLoginTimes() => _loginTimes != null;

  // "logout_times" field.
  List<DateTime>? _logoutTimes;
  List<DateTime> get logoutTimes => _logoutTimes ?? const [];
  bool hasLogoutTimes() => _logoutTimes != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "preferences" field.
  String? _preferences;
  String get preferences => _preferences ?? '';
  bool hasPreferences() => _preferences != null;

  // "relationship" field.
  List<RelationPreference>? _relationship;
  List<RelationPreference> get relationship => _relationship ?? const [];
  bool hasRelationship() => _relationship != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _savedPosts = getDataList(snapshotData['savedPosts']);
    _photos = getDataList(snapshotData['photos']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _followers = getDataList(snapshotData['followers']);
    _likedPosts = getDataList(snapshotData['likedPosts']);
    _friends = getDataList(snapshotData['friends']);
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _following = getDataList(snapshotData['following']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _matches = getDataList(snapshotData['matches']);
    _posts = getStructList(
      snapshotData['posts'],
      UserEventStruct.fromMap,
    );
    _uid = snapshotData['uid'] as String?;
    _education = snapshotData['education'] as String?;
    _gender = snapshotData['gender'] as String?;
    _height = HeightStruct.maybeFromMap(snapshotData['height']);
    _age = castToType<int>(snapshotData['age']);
    _iLike = snapshotData['i_like'] as String?;
    _loginTimes = getDataList(snapshotData['login_times']);
    _logoutTimes = getDataList(snapshotData['logout_times']);
    _location = snapshotData['location'] as LatLng?;
    _preferences = snapshotData['preferences'] as String?;
    _relationship =
        getEnumList<RelationPreference>(snapshotData['relationship']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  DateTime? createdTime,
  String? displayName,
  String? photoUrl,
  String? phoneNumber,
  String? lastActiveTime,
  String? shortDescription,
  String? uid,
  String? education,
  String? gender,
  HeightStruct? height,
  int? age,
  String? iLike,
  LatLng? location,
  String? preferences,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'created_time': createdTime,
      'display_name': displayName,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'last_active_time': lastActiveTime,
      'shortDescription': shortDescription,
      'uid': uid,
      'education': education,
      'gender': gender,
      'height': HeightStruct().toMap(),
      'age': age,
      'i_like': iLike,
      'location': location,
      'preferences': preferences,
    }.withoutNulls,
  );

  // Handle nested data for "height" field.
  addHeightStructData(firestoreData, height, 'height');

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        listEquality.equals(e1?.savedPosts, e2?.savedPosts) &&
        listEquality.equals(e1?.photos, e2?.photos) &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        listEquality.equals(e1?.likedPosts, e2?.likedPosts) &&
        listEquality.equals(e1?.friends, e2?.friends) &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        listEquality.equals(e1?.following, e2?.following) &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.shortDescription == e2?.shortDescription &&
        listEquality.equals(e1?.matches, e2?.matches) &&
        listEquality.equals(e1?.posts, e2?.posts) &&
        e1?.uid == e2?.uid &&
        e1?.education == e2?.education &&
        e1?.gender == e2?.gender &&
        e1?.height == e2?.height &&
        e1?.age == e2?.age &&
        e1?.iLike == e2?.iLike &&
        listEquality.equals(e1?.loginTimes, e2?.loginTimes) &&
        listEquality.equals(e1?.logoutTimes, e2?.logoutTimes) &&
        e1?.location == e2?.location &&
        e1?.preferences == e2?.preferences &&
        listEquality.equals(e1?.relationship, e2?.relationship);
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.savedPosts,
        e?.photos,
        e?.createdTime,
        e?.followers,
        e?.likedPosts,
        e?.friends,
        e?.displayName,
        e?.photoUrl,
        e?.following,
        e?.phoneNumber,
        e?.lastActiveTime,
        e?.shortDescription,
        e?.matches,
        e?.posts,
        e?.uid,
        e?.education,
        e?.gender,
        e?.height,
        e?.age,
        e?.iLike,
        e?.loginTimes,
        e?.logoutTimes,
        e?.location,
        e?.preferences,
        e?.relationship
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
