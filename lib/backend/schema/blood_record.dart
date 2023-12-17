import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class BloodRecord extends FirestoreRecord {
  BloodRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Blood_groups" field.
  List<String>? _bloodGroups;
  List<String> get bloodGroups => _bloodGroups ?? const [];
  bool hasBloodGroups() => _bloodGroups != null;

  // "Units" field.
  List<int>? _units;
  List<int> get units => _units ?? const [];
  bool hasUnits() => _units != null;

  void _initializeFields() {
    _bloodGroups = getDataList(snapshotData['Blood_groups']);
    _units = getDataList(snapshotData['Units']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blood');

  static Stream<BloodRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BloodRecord.fromSnapshot(s));

  static Future<BloodRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BloodRecord.fromSnapshot(s));

  static BloodRecord fromSnapshot(DocumentSnapshot snapshot) => BloodRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BloodRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BloodRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BloodRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BloodRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBloodRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class BloodRecordDocumentEquality implements Equality<BloodRecord> {
  const BloodRecordDocumentEquality();

  @override
  bool equals(BloodRecord? e1, BloodRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.bloodGroups, e2?.bloodGroups) &&
        listEquality.equals(e1?.units, e2?.units);
  }

  @override
  int hash(BloodRecord? e) =>
      const ListEquality().hash([e?.bloodGroups, e?.units]);

  @override
  bool isValidKey(Object? o) => o is BloodRecord;
}
