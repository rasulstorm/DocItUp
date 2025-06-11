import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "OrderId" field.
  DocumentReference? _orderId;
  DocumentReference? get orderId => _orderId;
  bool hasOrderId() => _orderId != null;

  // "ProductId" field.
  DocumentReference? _productId;
  DocumentReference? get productId => _productId;
  bool hasProductId() => _productId != null;

  // "Quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "Price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _orderId = snapshotData['OrderId'] as DocumentReference?;
    _productId = snapshotData['ProductId'] as DocumentReference?;
    _quantity = castToType<int>(snapshotData['Quantity']);
    _price = castToType<double>(snapshotData['Price']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('order')
          : FirebaseFirestore.instance.collectionGroup('order');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('order').doc(id);

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  DocumentReference? orderId,
  DocumentReference? productId,
  int? quantity,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'OrderId': orderId,
      'ProductId': productId,
      'Quantity': quantity,
      'Price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    return e1?.orderId == e2?.orderId &&
        e1?.productId == e2?.productId &&
        e1?.quantity == e2?.quantity &&
        e1?.price == e2?.price;
  }

  @override
  int hash(OrderRecord? e) => const ListEquality()
      .hash([e?.orderId, e?.productId, e?.quantity, e?.price]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
