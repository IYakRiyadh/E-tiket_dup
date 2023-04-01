import 'package:e_tiket_kapal_ta/view/pages/login.dart';
import 'package:e_tiket_kapal_ta/view/pages/signUp.dart';
import 'package:flutter/material.dart';

class MasukOrDaftar extends StatefulWidget {
  const MasukOrDaftar({super.key});

  @override
  State<MasukOrDaftar> createState() => _MasukOrDaftarState();
}

class _MasukOrDaftarState extends State<MasukOrDaftar> {
  bool iniHalamanMasuk = true;

  void toggleHalaman() {
    setState(() {
      iniHalamanMasuk = !iniHalamanMasuk;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (iniHalamanMasuk) {
      return MasukForm(
        clik: toggleHalaman,
      );
    } else {
      return DaftarForm(
        clik: toggleHalaman,
      );
    }
  }
}
