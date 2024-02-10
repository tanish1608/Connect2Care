import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PatientsRecord extends FirestoreRecord {
  PatientsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "PName" field.
  String? _pName;
  String get pName => _pName ?? '';
  bool hasPName() => _pName != null;

  // "Diagnosis" field.
  String? _diagnosis;
  String get diagnosis => _diagnosis ?? '';
  bool hasDiagnosis() => _diagnosis != null;

  // "Age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "Sex" field.
  String? _sex;
  String get sex => _sex ?? '';
  bool hasSex() => _sex != null;

  void _initializeFields() {
    _pName = snapshotData['PName'] as String?;
    _diagnosis = snapshotData['Diagnosis'] as String?;
    _age = castToType<int>(snapshotData['Age']);
    _sex = snapshotData['Sex'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Patients');

  static Stream<PatientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PatientsRecord.fromSnapshot(s));

  static Future<PatientsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PatientsRecord.fromSnapshot(s));

  static PatientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PatientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PatientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PatientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PatientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PatientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPatientsRecordData({
  String? pName,
  String? diagnosis,
  int? age,
  String? sex,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'PName': pName,
      'Diagnosis': diagnosis,
      'Age': age,
      'Sex': sex,
    }.withoutNulls,
  );

  return firestoreData;
}

class PatientsRecordDocumentEquality implements Equality<PatientsRecord> {
  const PatientsRecordDocumentEquality();

  @override
  bool equals(PatientsRecord? e1, PatientsRecord? e2) {
    return e1?.pName == e2?.pName &&
        e1?.diagnosis == e2?.diagnosis &&
        e1?.age == e2?.age &&
        e1?.sex == e2?.sex;
  }

  @override
  int hash(PatientsRecord? e) =>
      const ListEquality().hash([e?.pName, e?.diagnosis, e?.age, e?.sex]);

  @override
  bool isValidKey(Object? o) => o is PatientsRecord;
}
