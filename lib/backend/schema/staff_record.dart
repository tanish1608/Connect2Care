import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class StaffRecord extends FirestoreRecord {
  StaffRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Doctors" field.
  List<String>? _doctors;
  List<String> get doctors => _doctors ?? const [];
  bool hasDoctors() => _doctors != null;

  // "Nurses" field.
  List<String>? _nurses;
  List<String> get nurses => _nurses ?? const [];
  bool hasNurses() => _nurses != null;

  // "WardBoys" field.
  List<String>? _wardBoys;
  List<String> get wardBoys => _wardBoys ?? const [];
  bool hasWardBoys() => _wardBoys != null;

  // "Pharmacists" field.
  List<String>? _pharmacists;
  List<String> get pharmacists => _pharmacists ?? const [];
  bool hasPharmacists() => _pharmacists != null;

  // "OtherStaff" field.
  List<String>? _otherStaff;
  List<String> get otherStaff => _otherStaff ?? const [];
  bool hasOtherStaff() => _otherStaff != null;

  void _initializeFields() {
    _doctors = getDataList(snapshotData['Doctors']);
    _nurses = getDataList(snapshotData['Nurses']);
    _wardBoys = getDataList(snapshotData['WardBoys']);
    _pharmacists = getDataList(snapshotData['Pharmacists']);
    _otherStaff = getDataList(snapshotData['OtherStaff']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('staff');

  static Stream<StaffRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StaffRecord.fromSnapshot(s));

  static Future<StaffRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StaffRecord.fromSnapshot(s));

  static StaffRecord fromSnapshot(DocumentSnapshot snapshot) => StaffRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StaffRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StaffRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StaffRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StaffRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStaffRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class StaffRecordDocumentEquality implements Equality<StaffRecord> {
  const StaffRecordDocumentEquality();

  @override
  bool equals(StaffRecord? e1, StaffRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.doctors, e2?.doctors) &&
        listEquality.equals(e1?.nurses, e2?.nurses) &&
        listEquality.equals(e1?.wardBoys, e2?.wardBoys) &&
        listEquality.equals(e1?.pharmacists, e2?.pharmacists) &&
        listEquality.equals(e1?.otherStaff, e2?.otherStaff);
  }

  @override
  int hash(StaffRecord? e) => const ListEquality().hash(
      [e?.doctors, e?.nurses, e?.wardBoys, e?.pharmacists, e?.otherStaff]);

  @override
  bool isValidKey(Object? o) => o is StaffRecord;
}
