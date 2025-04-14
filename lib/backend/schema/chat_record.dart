import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "group_chat_id" field.
  int? _groupChatId;
  int get groupChatId => _groupChatId ?? 0;
  bool hasGroupChatId() => _groupChatId != null;

  // "last_message_seen_by" field.
  List<DocumentReference>? _lastMessageSeenBy;
  List<DocumentReference> get lastMessageSeenBy =>
      _lastMessageSeenBy ?? const [];
  bool hasLastMessageSeenBy() => _lastMessageSeenBy != null;

  // "last_message_sent_by" field.
  List<DocumentReference>? _lastMessageSentBy;
  List<DocumentReference> get lastMessageSentBy =>
      _lastMessageSentBy ?? const [];
  bool hasLastMessageSentBy() => _lastMessageSentBy != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "user_a" field.
  DocumentReference? _userA;
  DocumentReference? get userA => _userA;
  bool hasUserA() => _userA != null;

  // "user_b" field.
  DocumentReference? _userB;
  DocumentReference? get userB => _userB;
  bool hasUserB() => _userB != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "rating" field.
  List<RatingStruct>? _rating;
  List<RatingStruct> get rating => _rating ?? const [];
  bool hasRating() => _rating != null;

  // "Rating_User_A" field.
  RatingStruct? _ratingUserA;
  RatingStruct get ratingUserA => _ratingUserA ?? RatingStruct();
  bool hasRatingUserA() => _ratingUserA != null;

  // "Rating_User_B" field.
  RatingStruct? _ratingUserB;
  RatingStruct get ratingUserB => _ratingUserB ?? RatingStruct();
  bool hasRatingUserB() => _ratingUserB != null;

  // "deleted" field.
  bool? _deleted;
  bool get deleted => _deleted ?? false;
  bool hasDeleted() => _deleted != null;

  void _initializeFields() {
    _lastMessage = snapshotData['last_message'] as String?;
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
    _groupChatId = castToType<int>(snapshotData['group_chat_id']);
    _lastMessageSeenBy = getDataList(snapshotData['last_message_seen_by']);
    _lastMessageSentBy = getDataList(snapshotData['last_message_sent_by']);
    _users = getDataList(snapshotData['users']);
    _userA = snapshotData['user_a'] as DocumentReference?;
    _userB = snapshotData['user_b'] as DocumentReference?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _rating = getStructList(
      snapshotData['rating'],
      RatingStruct.fromMap,
    );
    _ratingUserA = snapshotData['Rating_User_A'] is RatingStruct
        ? snapshotData['Rating_User_A']
        : RatingStruct.maybeFromMap(snapshotData['Rating_User_A']);
    _ratingUserB = snapshotData['Rating_User_B'] is RatingStruct
        ? snapshotData['Rating_User_B']
        : RatingStruct.maybeFromMap(snapshotData['Rating_User_B']);
    _deleted = snapshotData['deleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  String? lastMessage,
  DateTime? lastMessageTime,
  int? groupChatId,
  DocumentReference? userA,
  DocumentReference? userB,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  RatingStruct? ratingUserA,
  RatingStruct? ratingUserB,
  bool? deleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
      'group_chat_id': groupChatId,
      'user_a': userA,
      'user_b': userB,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'Rating_User_A': RatingStruct().toMap(),
      'Rating_User_B': RatingStruct().toMap(),
      'deleted': deleted,
    }.withoutNulls,
  );

  // Handle nested data for "Rating_User_A" field.
  addRatingStructData(firestoreData, ratingUserA, 'Rating_User_A');

  // Handle nested data for "Rating_User_B" field.
  addRatingStructData(firestoreData, ratingUserB, 'Rating_User_B');

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    const listEquality = ListEquality();
    return e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.groupChatId == e2?.groupChatId &&
        listEquality.equals(e1?.lastMessageSeenBy, e2?.lastMessageSeenBy) &&
        listEquality.equals(e1?.lastMessageSentBy, e2?.lastMessageSentBy) &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.userA == e2?.userA &&
        e1?.userB == e2?.userB &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.rating, e2?.rating) &&
        e1?.ratingUserA == e2?.ratingUserA &&
        e1?.ratingUserB == e2?.ratingUserB &&
        e1?.deleted == e2?.deleted;
  }

  @override
  int hash(ChatRecord? e) => const ListEquality().hash([
        e?.lastMessage,
        e?.lastMessageTime,
        e?.groupChatId,
        e?.lastMessageSeenBy,
        e?.lastMessageSentBy,
        e?.users,
        e?.userA,
        e?.userB,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.rating,
        e?.ratingUserA,
        e?.ratingUserB,
        e?.deleted
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
