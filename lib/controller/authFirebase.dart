import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:e_tiket_kapal_ta/controller/auth.dart';
import 'package:e_tiket_kapal_ta/controller/userCtrlFirestore.dart';
import 'package:e_tiket_kapal_ta/models/usersModel.dart';
import 'package:e_tiket_kapal_ta/service/navBottomTree.dart';
import 'package:e_tiket_kapal_ta/view/pages/Navigasi.dart';
import 'package:e_tiket_kapal_ta/view/pages/masukOrDaftar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthReporsitori extends GetxController {
  static AuthReporsitori get permanin => Get.find();

  final userAuth = FirebaseAuth.instance;
  late final Rx<User?> userFirebaseAuth;

  final ctrlUser = Get.put(UserControllerAuth());
  final ctrl = Get.put(AutControllerStore());

  @override
  void onReady() {
    userFirebaseAuth = Rx<User?>(userAuth.currentUser);
    userFirebaseAuth.bindStream(userAuth.userChanges());
    ever(userFirebaseAuth, inisialisasiAuthPage);
  }

  inisialisasiAuthPage(User? akunAuth) {
    akunAuth == null
        ? Get.offAll(() => const MasukAuthUser())
        : Get.offAll(() => const NavigasiBarBottom());
  }

  Future<void> masukApp(String sandi, String email) async {
    Get.defaultDialog(
      content: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
    try {
      final userAuth = FirebaseAuth.instance;
      await userAuth.signInWithEmailAndPassword(
          email: ctrl.emailInCrtl.text.trim(),
          password: ctrl.sandiInCrtl.text.trim());

      Get.back();
      // Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      Get.back();
      // Navigator.of(context).pop();

      if (e.code == 'user-not-found') {
        showPesanError('Email anda masukkan salah atau belum terdaftar!');
      } else if (e.code == 'wrong-password') {
        showPesanError('Kata sandi anda salah!');
      }
    }
  }

  Future<void> daftarAkunApp(UsersModel akun) async {
    Get.defaultDialog(
      content: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
    try {
      if (komfirSandi(ctrl.sandiCrtl.text, ctrl.komfirSandiCrtl.text)) {
        await userAuth.createUserWithEmailAndPassword(
            email: ctrl.emailCrtl.text.trim(),
            password: ctrl.sandiCrtl.text.trim());

        ctrlUser.buatAkun(akun);
        showpesanAkunBerhasilDibuat('Anda berhasil sign Up');
        // userFirebaseAuth. != null
        //     ? Get.offAll(() => const NavigasiBarBottom())
        //     : Get.offAll(() => const MasukOrDaftar());
        // simpanAkun(namaCrtl.text.trim(), emailCrtl.text.trim());
        // final isMode = UsersModel(
        //     email: emailCrtl.text.trim(), nama: namaCrtl.text.trim());
        // simpanAkun(isMode);

      } else {
        showPesanError('Harap komfirmasi kata sandi dengan benar');
      }

      Get.back();
    } on FirebaseAuthException catch (e) {
      Get.back();

      // Navigator.of(context).pop();

      if (e.code != 'user-not-found') {
        showPesanError('Email Anda Salah');
      } else if (e.code == 'wrong-password') {
        showPesanError('Email Anda Salah');
      }
    }
  }
}

bool komfirSandi(String sandi, String komfirSandi) {
  if (sandi == komfirSandi) {
    return true;
  } else {
    return showPesanError('Sandi anda masukkan tidak sama');
  }
}

// pesan Akun berhasil terdaftar
showpesanAkunBerhasilDibuat(String pesanAkunBerhasilDibuat) {
  final snackBar = SnackBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.floating,
    padding: const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
    content: AwesomeSnackbarContent(
      title: 'Berhasil!',
      message: pesanAkunBerhasilDibuat,
      contentType: ContentType.success,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  );
  Get.dialog(snackBar);
  // ScaffoldMessenger.of(context)
  //   ..hideCurrentSnackBar()
  //   ..showSnackBar(snackBar);
}

// pesan Error
showPesanError(String pesanError) {
  final snackBar = SnackBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.floating,
    padding: const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
    content: AwesomeSnackbarContent(
      title: 'Pesan Error',
      message: pesanError,
      contentType: ContentType.failure,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  );
  Get.dialog(snackBar);
}
