import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "preferences" field.
  String? _preferences;
  String get preferences => _preferences ?? '';
  bool hasPreferences() => _preferences != null;

  // "relationship" field.
  List<RelationPreference>? _relationship;
  List<RelationPreference> get relationship => _relationship ?? const [];
  bool hasRelationship() => _relationship != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "posts" field.
  List<DocumentReference>? _posts;
  List<DocumentReference> get posts => _posts ?? const [];
  bool hasPosts() => _posts != null;

  // "followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "Block_Users" field.
  List<DocumentReference>? _blockUsers;
  List<DocumentReference> get blockUsers => _blockUsers ?? const [];
  bool hasBlockUsers() => _blockUsers != null;

  // "block_uid" field.
  List<String>? _blockUid;
  List<String> get blockUid => _blockUid ?? const [];
  bool hasBlockUid() => _blockUid != null;

  // "Post_clicked" field.
  List<DocumentReference>? _postClicked;
  List<DocumentReference> get postClicked => _postClicked ?? const [];
  bool hasPostClicked() => _postClicked != null;

  // "Clicked_time" field.
  DateTime? _clickedTime;
  DateTime? get clickedTime => _clickedTime;
  bool hasClickedTime() => _clickedTime != null;

  // "rating" field.
  List<RatingStruct>? _rating;
  List<RatingStruct> get rating => _rating ?? const [];
  bool hasRating() => _rating != null;

  // "event_want" field.
  List<DocumentReference>? _eventWant;
  List<DocumentReference> get eventWant => _eventWant ?? const [];
  bool hasEventWant() => _eventWant != null;

  // "Matchs_time" field.
  List<DateTime>? _matchsTime;
  List<DateTime> get matchsTime => _matchsTime ?? const [];
  bool hasMatchsTime() => _matchsTime != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "reports" field.
  List<DocumentReference>? _reports;
  List<DocumentReference> get reports => _reports ?? const [];
  bool hasReports() => _reports != null;

  // "swiped" field.
  List<DocumentReference>? _swiped;
  List<DocumentReference> get swiped => _swiped ?? const [];
  bool hasSwiped() => _swiped != null;

  // "hidden_posts" field.
  List<DocumentReference>? _hiddenPosts;
  List<DocumentReference> get hiddenPosts => _hiddenPosts ?? const [];
  bool hasHiddenPosts() => _hiddenPosts != null;

  // "going_out" field.
  List<GoingOutStruct>? _goingOut;
  List<GoingOutStruct> get goingOut => _goingOut ?? const [];
  bool hasGoingOut() => _goingOut != null;

  // "invitations" field.
  List<InvitationStruct>? _invitations;
  List<InvitationStruct> get invitations => _invitations ?? const [];
  bool hasInvitations() => _invitations != null;

  // "profileNotification" field.
  bool? _profileNotification;
  bool get profileNotification => _profileNotification ?? false;
  bool hasProfileNotification() => _profileNotification != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _savedPosts = getDataList(snapshotData['savedPosts']);
    _photos = getDataList(snapshotData['photos']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _likedPosts = getDataList(snapshotData['likedPosts']);
    _friends = getDataList(snapshotData['friends']);
    _displayName = snapshotData['display_name'] as String?;
    _following = getDataList(snapshotData['following']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _matches = getDataList(snapshotData['matches']);
    _uid = snapshotData['uid'] as String?;
    _education = snapshotData['education'] as String?;
    _gender = snapshotData['gender'] as String?;
    _height = snapshotData['height'] is HeightStruct
        ? snapshotData['height']
        : HeightStruct.maybeFromMap(snapshotData['height']);
    _age = castToType<int>(snapshotData['age']);
    _iLike = snapshotData['i_like'] as String?;
    _loginTimes = getDataList(snapshotData['login_times']);
    _logoutTimes = getDataList(snapshotData['logout_times']);
    _preferences = snapshotData['preferences'] as String?;
    _relationship =
        getEnumList<RelationPreference>(snapshotData['relationship']);
    _location = snapshotData['location'] as String?;
    _posts = getDataList(snapshotData['posts']);
    _followers = getDataList(snapshotData['followers']);
    _blockUsers = getDataList(snapshotData['Block_Users']);
    _blockUid = getDataList(snapshotData['block_uid']);
    _postClicked = getDataList(snapshotData['Post_clicked']);
    _clickedTime = snapshotData['Clicked_time'] as DateTime?;
    _rating = getStructList(
      snapshotData['rating'],
      RatingStruct.fromMap,
    );
    _eventWant = getDataList(snapshotData['event_want']);
    _matchsTime = getDataList(snapshotData['Matchs_time']);
    _photoUrl = snapshotData['photo_url'] as String?;
    _reports = getDataList(snapshotData['reports']);
    _swiped = getDataList(snapshotData['swiped']);
    _hiddenPosts = getDataList(snapshotData['hidden_posts']);
    _goingOut = getStructList(
      snapshotData['going_out'],
      GoingOutStruct.fromMap,
    );
    _invitations = getStructList(
      snapshotData['invitations'],
      InvitationStruct.fromMap,
    );
    _profileNotification = snapshotData['profileNotification'] as bool?;
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
  String? phoneNumber,
  String? lastActiveTime,
  String? shortDescription,
  String? uid,
  String? education,
  String? gender,
  HeightStruct? height,
  int? age,
  String? iLike,
  String? preferences,
  String? location,
  DateTime? clickedTime,
  String? photoUrl,
  bool? profileNotification,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'created_time': createdTime,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'last_active_time': lastActiveTime,
      'shortDescription': shortDescription,
      'uid': uid,
      'education': education,
      'gender': gender,
      'height': HeightStruct().toMap(),
      'age': age,
      'i_like': iLike,
      'preferences': preferences,
      'location': location,
      'Clicked_time': clickedTime,
      'photo_url': photoUrl,
      'profileNotification': profileNotification,
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
        listEquality.equals(e1?.likedPosts, e2?.likedPosts) &&
        listEquality.equals(e1?.friends, e2?.friends) &&
        e1?.displayName == e2?.displayName &&
        listEquality.equals(e1?.following, e2?.following) &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.shortDescription == e2?.shortDescription &&
        listEquality.equals(e1?.matches, e2?.matches) &&
        e1?.uid == e2?.uid &&
        e1?.education == e2?.education &&
        e1?.gender == e2?.gender &&
        e1?.height == e2?.height &&
        e1?.age == e2?.age &&
        e1?.iLike == e2?.iLike &&
        listEquality.equals(e1?.loginTimes, e2?.loginTimes) &&
        listEquality.equals(e1?.logoutTimes, e2?.logoutTimes) &&
        e1?.preferences == e2?.preferences &&
        listEquality.equals(e1?.relationship, e2?.relationship) &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.posts, e2?.posts) &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        listEquality.equals(e1?.blockUsers, e2?.blockUsers) &&
        listEquality.equals(e1?.blockUid, e2?.blockUid) &&
        listEquality.equals(e1?.postClicked, e2?.postClicked) &&
        e1?.clickedTime == e2?.clickedTime &&
        listEquality.equals(e1?.rating, e2?.rating) &&
        listEquality.equals(e1?.eventWant, e2?.eventWant) &&
        listEquality.equals(e1?.matchsTime, e2?.matchsTime) &&
        e1?.photoUrl == e2?.photoUrl &&
        listEquality.equals(e1?.reports, e2?.reports) &&
        listEquality.equals(e1?.swiped, e2?.swiped) &&
        listEquality.equals(e1?.hiddenPosts, e2?.hiddenPosts) &&
        listEquality.equals(e1?.goingOut, e2?.goingOut) &&
        listEquality.equals(e1?.invitations, e2?.invitations) &&
        e1?.profileNotification == e2?.profileNotification;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.savedPosts,
        e?.photos,
        e?.createdTime,
        e?.likedPosts,
        e?.friends,
        e?.displayName,
        e?.following,
        e?.phoneNumber,
        e?.lastActiveTime,
        e?.shortDescription,
        e?.matches,
        e?.uid,
        e?.education,
        e?.gender,
        e?.height,
        e?.age,
        e?.iLike,
        e?.loginTimes,
        e?.logoutTimes,
        e?.preferences,
        e?.relationship,
        e?.location,
        e?.posts,
        e?.followers,
        e?.blockUsers,
        e?.blockUid,
        e?.postClicked,
        e?.clickedTime,
        e?.rating,
        e?.eventWant,
        e?.matchsTime,
        e?.photoUrl,
        e?.reports,
        e?.swiped,
        e?.hiddenPosts,
        e?.goingOut,
        e?.invitations,
        e?.profileNotification
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
