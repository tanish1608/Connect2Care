import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class DoctorsRecord extends FirestoreRecord {
  DoctorsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "DName" field.
  String? _dName;
  String get dName => _dName ?? '';
  bool hasDName() => _dName != null;

  // "Specialty" field.
  String? _specialty;
  String get specialty => _specialty ?? '';
  bool hasSpecialty() => _specialty != null;

  // "day_schedule" field.
  List<String>? _daySchedule;
  List<String> get daySchedule => _daySchedule ?? const [];
  bool hasDaySchedule() => _daySchedule != null;

  // "time_schedule" field.
  List<String>? _timeSchedule;
  List<String> get timeSchedule => _timeSchedule ?? const [];
  bool hasTimeSchedule() => _timeSchedule != null;

  void _initializeFields() {
    _dName = snapshotData['DName'] as String?;
    _specialty = snapshotData['Specialty'] as String?;
    _daySchedule = getDataList(snapshotData['day_schedule']);
    _timeSchedule = getDataList(snapshotData['time_schedule']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Doctors');

  static Stream<DoctorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DoctorsRecord.fromSnapshot(s));

  static Future<DoctorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DoctorsRecord.fromSnapshot(s));

  static DoctorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DoctorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DoctorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DoctorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DoctorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DoctorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDoctorsRecordData({
  String? dName,
  String? specialty,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'DName': dName,
      'Specialty': specialty,
    }.withoutNulls,
  );

  return firestoreData;
}

class DoctorsRecordDocumentEquality implements Equality<DoctorsRecord> {
  const DoctorsRecordDocumentEquality();

  @override
  bool equals(DoctorsRecord? e1, DoctorsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dName == e2?.dName &&
        e1?.specialty == e2?.specialty &&
        listEquality.equals(e1?.daySchedule, e2?.daySchedule) &&
        listEquality.equals(e1?.timeSchedule, e2?.timeSchedule);
  }

  @override
  int hash(DoctorsRecord? e) => const ListEquality()
      .hash([e?.dName, e?.specialty, e?.daySchedule, e?.timeSchedule]);

  @override
  bool isValidKey(Object? o) => o is DoctorsRecord;
}
