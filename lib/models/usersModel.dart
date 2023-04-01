import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel {
  final String nama;
  final String email;

  UsersModel({required this.nama, required this.email});

  toFirestore() {
    return {
      "nama": nama,
      "email": email,
    };
  }

  factory UsersModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snap) {
    final dataAkun = snap.data();
    return UsersModel(nama: dataAkun?["nama"], email: dataAkun?["email"]);
  }
}
