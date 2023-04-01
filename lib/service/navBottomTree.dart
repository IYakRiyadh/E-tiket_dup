import 'package:e_tiket_kapal_ta/view/pages/Navigasi.dart';
import 'package:e_tiket_kapal_ta/view/pages/login.dart';
import 'package:e_tiket_kapal_ta/view/pages/masukOrDaftar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MasukAuthUser extends StatelessWidget {
  const MasukAuthUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NavigasiBarBottom();
          } else {
            return MasukOrDaftar();
          }
        },
      ),
    );
  }
}
