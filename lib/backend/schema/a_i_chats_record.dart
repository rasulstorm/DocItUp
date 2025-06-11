import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AIChatsRecord extends FirestoreRecord {
  AIChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "sender" field.
  String? _sender;
  String get sender => _sender ?? '';
  bool hasSender() => _sender != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _message = snapshotData['message'] as String?;
    _sender = snapshotData['sender'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _imageUrl = snapshotData['image_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AI_chats');

  static Stream<AIChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AIChatsRecord.fromSnapshot(s));

  static Future<AIChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AIChatsRecord.fromSnapshot(s));

  static AIChatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AIChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AIChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AIChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AIChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AIChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAIChatsRecordData({
  String? userId,
  String? message,
  String? sender,
  DateTime? timestamp,
  String? imageUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'message': message,
      'sender': sender,
      'timestamp': timestamp,
      'image_url': imageUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class AIChatsRecordDocumentEquality implements Equality<AIChatsRecord> {
  const AIChatsRecordDocumentEquality();

  @override
  bool equals(AIChatsRecord? e1, AIChatsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.message == e2?.message &&
        e1?.sender == e2?.sender &&
        e1?.timestamp == e2?.timestamp &&
        e1?.imageUrl == e2?.imageUrl;
  }

  @override
  int hash(AIChatsRecord? e) => const ListEquality()
      .hash([e?.userId, e?.message, e?.sender, e?.timestamp, e?.imageUrl]);

  @override
  bool isValidKey(Object? o) => o is AIChatsRecord;
}
