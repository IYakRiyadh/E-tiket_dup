import 'package:e_tiket_kapal_ta/view/Beranda.dart';
import 'package:e_tiket_kapal_ta/view/Profil.dart';
import 'package:e_tiket_kapal_ta/view/TiketSaya.dart';
import 'package:e_tiket_kapal_ta/view/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavigasiBarBottom extends StatefulWidget {
  const NavigasiBarBottom({super.key});

  @override
  State<NavigasiBarBottom> createState() => _NavigasiBarBottomState();
}

class _NavigasiBarBottomState extends State<NavigasiBarBottom> {
  int _halamanAktif = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: halAktif(),
        bottomNavigationBar: navBottomBar(),
      );

  Widget halAktif() => Container(
        child: IndexedStack(
          index: _halamanAktif,
          children: const <Widget>[
            Beranda(),
            MyTiketView(),
            ProfilAkunView(),
          ],
        ),
      );

  Widget navBottomBar() => BottomNavigationBar(
        selectedFontSize: 8.0,
        selectedLabelStyle: const TextStyle(
          fontSize: 8.0,
          fontWeight: FontWeight.bold,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 0,
        selectedItemColor: Colors.lightBlueAccent,
        currentIndex: _halamanAktif,
        onTap: (value) {
          setState(() => _halamanAktif = value);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            activeIcon: CircleAvatar(
              child: Icon(Icons.home_rounded),
            ),
            label: 'BERANDA',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num_rounded),
            activeIcon: CircleAvatar(
              child: Icon(Icons.confirmation_num_rounded),
            ),
            label: 'TIKET',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            activeIcon: CircleAvatar(
              child: Icon(Icons.account_circle),
            ),
            label: 'AKUN',
          ),
        ],
      );
}
