import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavouriteRecord extends FirestoreRecord {
  FavouriteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ProductIds" field.
  List<DocumentReference>? _productIds;
  List<DocumentReference> get productIds => _productIds ?? const [];
  bool hasProductIds() => _productIds != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _productIds = getDataList(snapshotData['ProductIds']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('favourite')
          : FirebaseFirestore.instance.collectionGroup('favourite');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('favourite').doc(id);

  static Stream<FavouriteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavouriteRecord.fromSnapshot(s));

  static Future<FavouriteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavouriteRecord.fromSnapshot(s));

  static FavouriteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavouriteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavouriteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavouriteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavouriteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavouriteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavouriteRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class FavouriteRecordDocumentEquality implements Equality<FavouriteRecord> {
  const FavouriteRecordDocumentEquality();

  @override
  bool equals(FavouriteRecord? e1, FavouriteRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.productIds, e2?.productIds);
  }

  @override
  int hash(FavouriteRecord? e) => const ListEquality().hash([e?.productIds]);

  @override
  bool isValidKey(Object? o) => o is FavouriteRecord;
}
