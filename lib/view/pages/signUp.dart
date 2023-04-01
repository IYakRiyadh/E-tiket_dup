import 'dart:ui';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:e_tiket_kapal_ta/controller/auth.dart';
import 'package:e_tiket_kapal_ta/models/usersModel.dart';
import 'package:e_tiket_kapal_ta/service/google_auth.dart';
import 'package:e_tiket_kapal_ta/view/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarForm extends StatefulWidget {
  const DaftarForm({super.key, required this.clik});
  final Function()? clik;

  @override
  State<DaftarForm> createState() => DaftarFormState();
}

class DaftarFormState extends State<DaftarForm> {
  final ctrl = Get.put(AutControllerStore());

  var hideSandi;

  @override
  void initState() {
    super.initState();
    hideSandi = !hideSandi;
    // daftarAkunApp();
  }

  @override
  void dispose() {
    ctrl.namaCrtl.dispose();
    ctrl.emailCrtl.dispose();
    ctrl.sandiCrtl.dispose();
    ctrl.komfirSandiCrtl.dispose();
    super.dispose();
  }

  toggleSandi() {
    setState(() {
      hideSandi = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.cyanAccent,
      body: Container(
        margin: const EdgeInsets.all(20),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Silahkan Daftar',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(bottom: 5, left: 5),
              child: const Text(
                'Nama Pengguna',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 35,
              // padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: ctrl.namaCrtl,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 15, left: 10),
                  hintText: 'Ketik Nama anda...',
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.elliptical(10, 10),
                      right: Radius.elliptical(10, 10),
                    ),
                    borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.lightBlueAccent,
                        strokeAlign: BorderSide.strokeAlignOutside),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.blueGrey,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(bottom: 5, left: 5),
              child: const Text(
                'Alamat Email',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 35,
              // padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: ctrl.emailCrtl,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 15, left: 10),
                  hintText: 'Ketik Email anda...',
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.elliptical(10, 10),
                      right: Radius.elliptical(10, 10),
                    ),
                    borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.lightBlueAccent,
                        strokeAlign: BorderSide.strokeAlignOutside),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.blueGrey,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(bottom: 5, left: 5),
              child: const Text(
                'Kata Sandi',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 35,
              // padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: ctrl.sandiCrtl,
                obscureText: hideSandi,
                obscuringCharacter: '•',
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    child: hideSandi
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onTap: () {
                      toggleSandi();
                    },
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 10, bottom: 10, top: 4),
                  hintText: 'Ketik Sandi anda...',
                  focusedBorder: const UnderlineInputBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.elliptical(10, 10),
                      right: Radius.elliptical(10, 10),
                    ),
                    borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.lightBlueAccent,
                        strokeAlign: BorderSide.strokeAlignOutside),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.blueGrey,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(bottom: 5, left: 5),
              child: const Text(
                'Konfirmasi Kata Sandi',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 35,
              // padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: ctrl.komfirSandiCrtl,
                obscureText: hideSandi,
                obscuringCharacter: '•',
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    child: hideSandi
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onTap: () {
                      toggleSandi();
                    },
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 10, bottom: 10, top: 4),
                  hintText: 'Konfirmasi Sandi anda...',
                  focusedBorder: const UnderlineInputBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.elliptical(10, 10),
                      right: Radius.elliptical(10, 10),
                    ),
                    borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.lightBlueAccent,
                        strokeAlign: BorderSide.strokeAlignOutside),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.blueGrey,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    final akunUser = UsersModel(
                        nama: ctrl.namaCrtl.text, email: ctrl.emailCrtl.text);
                    AutControllerStore.permanin.buatUser(akunUser);
                  });
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              // height: 30,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                        border: const Border.fromBorderSide(
                          BorderSide(
                              width: 2,
                              color: Colors.black45,
                              style: BorderStyle.solid),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      'atau',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                        border: const Border.fromBorderSide(
                          BorderSide(
                              width: 2,
                              color: Colors.black45,
                              style: BorderStyle.solid),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white54,
                  elevation: 0,
                  side: const BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Colors.lightBlue),
                ),
                onPressed: () => GoogleAuthServis().masukDgnGoogle(),
                child: const Text(
                  'Sign Up dengan Google',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 45),
            Container(
              child: Row(
                children: [
                  const Text(
                    'jika sudah daftar, silahkan ',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: widget.clik,
                    child: Text(
                      'masuk..',
                      style: TextStyle(
                        color: Colors.blueAccent[700],
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
