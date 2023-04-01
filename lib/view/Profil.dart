// import 'dart:html';

import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:e_tiket_kapal/Auth/auth.dart';
import 'package:e_tiket_kapal_ta/component/buttunMoreVert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProfilAkunView extends StatefulWidget {
  const ProfilAkunView({super.key});

  @override
  State<ProfilAkunView> createState() => _ProfilAkunViewState();
}

class _ProfilAkunViewState extends State<ProfilAkunView> {
  final userPenggunaAktif = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final ukuran = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: ukuran.width,
                  height: 220,
                  padding: const EdgeInsets.only(top: 50),
                  decoration: const BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 160,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 10, bottom: 60),
                                width: 25,
                                child: MaterialButton(
                                  elevation: 0,
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () {},
                                  child: Image.asset(
                                    '/images/edit.png',
                                    width: 25,
                                    height: 25,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(
                                        left: 35, right: 15),
                                    child: const Icon(
                                      Icons.account_circle_rounded,
                                      size: 100,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Text(
                                              '${userPenggunaAktif.displayName}'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Text(
                                              '${userPenggunaAktif.email}'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: ukuran.width,
                  height: 50,
                  child: Stack(
                    children: <Widget>[
                      const Center(
                        child: Text('Akun Saya',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              alignment: AlignmentDirectional.bottomCenter,
                              customButton: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                              customItemsHeights: [
                                ...List<double>.filled(
                                    MenuItemsButton.firstItems.length, 48),
                                8,
                                ...List<double>.filled(
                                    MenuItemsButton.secondItems.length, 48),
                              ],
                              items: <DropdownMenuItem>[
                                ...MenuItemsButton.firstItems.map(
                                  (item) => DropdownMenuItem<MenuItemButtun>(
                                    value: item,
                                    child: MenuItemsButton.buildItem(item),
                                  ),
                                ),
                                const DropdownMenuItem<Divider>(
                                    enabled: false, child: Divider()),
                                ...MenuItemsButton.secondItems.map(
                                  (item) => DropdownMenuItem<MenuItemButtun>(
                                    value: item,
                                    child: MenuItemsButton.buildItem(item),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                MenuItemsButton.onChanged(
                                    context, value as MenuItemButtun);
                              },
                              itemHeight: 45,
                              itemPadding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              dropdownWidth: 110,
                              dropdownPadding:
                                  const EdgeInsets.symmetric(vertical: 6),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                              ),
                              dropdownElevation: 8,
                              offset: const Offset(0, 8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: const [
                  SizedBox(height: 10),
                  ListTile(
                    title: Text('data'),
                    leading: Icon(Icons.wallet),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
