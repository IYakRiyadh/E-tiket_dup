import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_tiket_kapal_ta/controller/auth.dart';
import 'package:e_tiket_kapal_ta/models/usersModel.dart';
import 'package:e_tiket_kapal_ta/view/inputTiket.dart';
import 'package:e_tiket_kapal_ta/component/buttunMoreVert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  // final dataUser = FirebaseAuth.instance.currentUser?.uid;

  String? idU;
  CollectionReference dataUser = FirebaseFirestore.instance.collection("users");
  List<String> uidAkun = [];
  // final Map<String, dynamic> akun = UsersModel().toFirestore();
  var namaKapal = <String>[
    'PELNI',
    'SUMEKAR III',
    'Express Bahari',
  ]
      .map((e) => Text(
            e,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ))
      .toList();

  final List<String> imgList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  late List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    final ukuran = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Container(
            margin: const EdgeInsets.all(6.0),
            padding: const EdgeInsets.all(6.0),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset('/images/img1.png', width: 10, height: 10),
          ),
          onTap: () {},
        ),
        title: Text(
          "blank",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                alignment: AlignmentDirectional.bottomCenter,
                customButton: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                customItemsHeights: [
                  ...List<double>.filled(MenuItemsButton.firstItems.length, 48),
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
                  MenuItemsButton.onChanged(context, value as MenuItemButtun);
                },
                itemHeight: 45,
                itemPadding: const EdgeInsets.only(left: 16, right: 16),
                dropdownWidth: 110,
                dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                dropdownElevation: 8,
                offset: const Offset(0, 8),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 25),
              child: CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeFactor: 1.0,
                  viewportFraction: 1.0,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: ukuran.width,
              height: 40,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(right: 20, left: 20),
              padding: const EdgeInsets.only(bottom: 5, left: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2, color: Colors.lightBlueAccent),
                ),
              ),
              child: const Text('Rute'),
            ),
            Container(
              width: ukuran.width,
              height: ukuran.height,
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: namaKapalBeropersi(namaKapal),
            )
          ],
        ),
      ),
    );
  }

  Widget namaKapalBeropersi(List dataNamaKapalBeroperasi) {
    return FutureBuilder(
        future: dataUser.doc(idU).get(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: namaKapal.length,
            itemBuilder: (context, index) {
              dataNamaKapalBeroperasi = namaKapal;
              final ukuran = MediaQuery.of(context).size;
              return GestureDetector(
                child: Container(
                  width: ukuran.width,
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlueAccent,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        // width: ukuran.width,
                        child: CircleAvatar(
                          child: Image.asset(
                            '/images/img1.png',
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: namaKapal[index],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FormInputTiketKapal(),
                )),
              );
            },
          );
        });
  }

  Future<UsersModel> ambilDataUser(String nama) async {
    final snap = await FirebaseFirestore.instance
        .collection("users")
        .where("nama", isEqualTo: nama)
        .get();
    final uData = snap.docs.map((e) => UsersModel.fromFirestore(e)).single;
    return uData;
  }
}
