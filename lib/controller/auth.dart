// import 'dart:js_util';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_tiket_kapal_ta/controller/authFirebase.dart';
import 'package:e_tiket_kapal_ta/controller/userCtrlFirestore.dart';
import 'package:e_tiket_kapal_ta/models/usersModel.dart';
import 'package:e_tiket_kapal_ta/view/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class AutControllerStore extends GetxController {
  static AutControllerStore get permanin => Get.find();

  final namaCrtl = TextEditingController();
  final emailCrtl = TextEditingController();
  final sandiCrtl = TextEditingController();
  final komfirSandiCrtl = TextEditingController();
  final emailInCrtl = TextEditingController();
  final sandiInCrtl = TextEditingController();

  final firestoreDbUser = FirebaseFirestore.instance;
  final repo = Get.put(AuthReporsitori());
  // final userContol = Get.put(UserControllerAuth());
  // final userAuth = FirebaseAuth.instance;

  // void daftarAkunBaru(UsersModel user) {
  //   AuthReporsitori.permanin.daftarAkunApp(user.email);
  // }

  Future<void> buatUser(UsersModel akun) async {
    await repo.daftarAkunApp(akun);
  }

  Future<void> masukUser() async {
    await AuthReporsitori.permanin
        .masukApp(emailInCrtl.text.trim(), sandiInCrtl.text.trim());
  }
}
