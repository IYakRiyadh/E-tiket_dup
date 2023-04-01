import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_tiket_kapal_ta/models/usersModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserControllerAuth extends GetxController {
  UserControllerAuth get permanin => Get.find();

  final dbCloudFirestoreUser = FirebaseFirestore.instance;

  Future<void> buatAkun(UsersModel akun) async {
    await dbCloudFirestoreUser
        .collection("users")
        .add(akun.toFirestore())
        .whenComplete(() => const GetSnackBar(
              titleText:
                  Text("Berhasil", style: TextStyle(color: Colors.blueAccent)),
              messageText: Text("Akun Anda Sudah Dibuat",
                  style: TextStyle(color: Colors.blueAccent)),
              snackStyle: SnackStyle.FLOATING,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.lightGreenAccent,
              margin: EdgeInsets.all(25),
            ))
        .catchError((error, stackTrace) {
      const GetSnackBar(
        titleText: Text("Berhasil", style: TextStyle(color: Colors.blueAccent)),
        messageText: Text("Akun Anda Sudah Dibuat",
            style: TextStyle(color: Colors.blueAccent)),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.lightGreenAccent,
        margin: EdgeInsets.all(25),
      );
    });
  }
}
