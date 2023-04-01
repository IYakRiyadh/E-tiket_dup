import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabaseModel {
  final String asal;
  final String tujuan;
  final String kursi;
  final String kategori;
  final String jenis;
  final String waktu;

  RealtimeDatabaseModel({
    required this.asal,
    required this.tujuan,
    required this.kategori,
    required this.jenis,
    required this.kursi,
    required this.waktu,
  });

  factory RealtimeDatabaseModel.toJson(Map<String, dynamic> json) {
    return RealtimeDatabaseModel(
      asal: json['asal'],
      tujuan: json['tujuan'],
      kategori: json['kategori'],
      jenis: json['jenis'],
      kursi: json['kursi'],
      waktu: json['waktu'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      asal: 'asal',
      tujuan: 'tujuan',
      kategori: 'kategori',
      jenis: 'jenis',
      kursi: 'kursi',
      waktu: 'waktu',
    };
  }

  // FirebaseDatabase databaseTiket = FirebaseDatabase.instance;

  // FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
  // FirebaseDatabase database = FirebaseDatabase.instanceFor(app: secondaryApp);
}
