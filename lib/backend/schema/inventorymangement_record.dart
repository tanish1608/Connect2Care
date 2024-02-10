import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InventorymangementRecord extends FirestoreRecord {
  InventorymangementRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Item" field.
  String? _item;
  String get item => _item ?? '';
  bool hasItem() => _item != null;

  // "Quantity_i" field.
  int? _quantityI;
  int get quantityI => _quantityI ?? 0;
  bool hasQuantityI() => _quantityI != null;

  void _initializeFields() {
    _item = snapshotData['Item'] as String?;
    _quantityI = castToType<int>(snapshotData['Quantity_i']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Inventorymangement');

  static Stream<InventorymangementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InventorymangementRecord.fromSnapshot(s));

  static Future<InventorymangementRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => InventorymangementRecord.fromSnapshot(s));

  static InventorymangementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InventorymangementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InventorymangementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InventorymangementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InventorymangementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InventorymangementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInventorymangementRecordData({
  String? item,
  int? quantityI,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Item': item,
      'Quantity_i': quantityI,
    }.withoutNulls,
  );

  return firestoreData;
}

class InventorymangementRecordDocumentEquality
    implements Equality<InventorymangementRecord> {
  const InventorymangementRecordDocumentEquality();

  @override
  bool equals(InventorymangementRecord? e1, InventorymangementRecord? e2) {
    return e1?.item == e2?.item && e1?.quantityI == e2?.quantityI;
  }

  @override
  int hash(InventorymangementRecord? e) =>
      const ListEquality().hash([e?.item, e?.quantityI]);

  @override
  bool isValidKey(Object? o) => o is InventorymangementRecord;
}
