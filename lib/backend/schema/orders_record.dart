import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "Total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "deliverTime" field.
  DateTime? _deliverTime;
  DateTime? get deliverTime => _deliverTime;
  bool hasDeliverTime() => _deliverTime != null;

  // "receivedTime" field.
  DateTime? _receivedTime;
  DateTime? get receivedTime => _receivedTime;
  bool hasReceivedTime() => _receivedTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _status = snapshotData['Status'] as String?;
    _date = snapshotData['Date'] as DateTime?;
    _total = castToType<double>(snapshotData['Total']);
    _deliverTime = snapshotData['deliverTime'] as DateTime?;
    _receivedTime = snapshotData['receivedTime'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Orders')
          : FirebaseFirestore.instance.collectionGroup('Orders');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Orders').doc(id);

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? status,
  DateTime? date,
  double? total,
  DateTime? deliverTime,
  DateTime? receivedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Status': status,
      'Date': date,
      'Total': total,
      'deliverTime': deliverTime,
      'receivedTime': receivedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.date == e2?.date &&
        e1?.total == e2?.total &&
        e1?.deliverTime == e2?.deliverTime &&
        e1?.receivedTime == e2?.receivedTime;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality()
      .hash([e?.status, e?.date, e?.total, e?.deliverTime, e?.receivedTime]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
