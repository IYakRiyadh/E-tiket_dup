import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_tiket_kapal_ta/database/dataKursi.dart';
import 'package:e_tiket_kapal_ta/models/nomorKursi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

class KursiKapal extends StatefulWidget {
  const KursiKapal({super.key});

  @override
  State<KursiKapal> createState() => _KursiKapalState();
}

class _KursiKapalState extends State<KursiKapal> {
  var jumlahkursiKiri = 4 * 6;
  var jumlahkursiTengah = 2 * 8 + 2;
  var jumlahkursiKanan = 4 * 6;
  List kursiKiri = [];
  List kursiTengah = [];
  List kursiKanan = [];

  List listKursiA = [];
  // ListDataKursiModel listKursi = ListDataKursiModel();
  // List<ModelKursi> datakursiVal = [];

  // insertDataKursi() async {
  //   await DataKursi().jsonSevice().then((value) {
  //     setState(() {
  //       datakursiVal = listKursi.nama!;
  //     });
  //   });
  // }

  @override
  void initState() {
    initListKursi(kursiKiri, jumlahkursiKiri, 'l');
    initListKursi(kursiTengah, jumlahkursiTengah, 'c');
    initListKursi(kursiKanan, jumlahkursiKanan, 'r');
    // setTidakAdaKursi();
    super.initState();
    // insertDataKursi();
    // datInsertVal();
  }

  initListKursi(List _kursiData, jum, luaran) {
    var dataObjek;
    for (int i = 0; i < jum; i++) {
      dataObjek = {
        'id': luaran + '${i + 1}',
        'terjual': false,
        'tersedia': true,
        'dipilih': false,
        'nokursi': true,
      };
      _kursiData.add(dataObjek);
    }
  }

  setBookingTiket() {
    kursiKiri.forEach((bookingKursiDipilih) {
      setState(() {
        if (bookingKursiDipilih['dipilih']) {
          bookingKursiDipilih['terjual'] = true;
        }
      });
    });
    kursiTengah.forEach((bookingKursiDipilih) {
      setState(() {
        if (bookingKursiDipilih['dipilih']) {
          bookingKursiDipilih['terjual'] = true;
        }
      });
    });
    kursiKanan.forEach((bookingKursiDipilih) {
      setState(() {
        if (bookingKursiDipilih['dipilih']) {
          bookingKursiDipilih['terjual'] = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ukuran = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Kursi Anda',
            style: TextStyle(color: Colors.white)),
        // titleTextStyle: const TextStyle(color: Colors.white),
        centerTitle: true,
        leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
            onTap: () => Navigator.of(context).pop()),
      ),
      body: SingleChildScrollView(
        child: Container(
          // width: ukuran.width,
          // height: ukuran.height,
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(top: 20, bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1.5, color: Colors.lightBlue.shade700),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Tersedia',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.cyanAccent,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1.5, color: Colors.cyanAccent.shade700),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Terpilih',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1.5, color: Colors.blueGrey.shade700),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Terjual',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: ukuran.width,
                height: ukuran.shortestSide,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(child: listKursiKapal(kursiKiri, true, 'A')),
                        Expanded(child: listKursiKapal(kursiTengah, true, 'B')),
                        Expanded(child: listKursiKapal(kursiKanan, true, 'C')),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: ElevatedButton(
                  child: const Text('Booking'),
                  onPressed: () {
                    setBookingTiket();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dataInsertKursi() async {
    final String dataJsonKursi =
        await rootBundle.loadString('/json/kursi.json');
    final kursiData = await jsonDecode(dataJsonKursi);
    for (var listA in kursiKiri) {
      setState(() {
        kursiData["listA"] = listA;
      });
      return Text(
        '${listA["nama"]}',
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 10),
      );
    }
    for (var listB in kursiTengah) {
      setState(() {
        kursiData["listB"] = listB;
      });
      return Text(
        '${listB["nama"]}',
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 10),
      );
    }
    for (var listC in kursiKanan) {
      setState(() {
        kursiData["listC"] = listC;
      });
      return Text(
        '${listC["nama"]}',
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 10),
      );
    }
    // Future dataInsertVal() async {
    //   final String dataJsonKursi =
    //       await rootBundle.loadString('/json/kursi.json');
    //   final kursiData = await jsonDecode(dataJsonKursi);

    //   return kursiData;
    // }
    // if (kursiData["listA"] && kursiData["listB"] && kursiData["listC"]) {
    //   setState(() {
    //     kursiKiri = kursiData["listA"];

    //     kursiKanan = kursiData["listC"];
    //     // listKursiA = kursiData["listA"]["listB"]["listB"];
    //   });
    // } else if (kursiTengah = kursiData["listB"]) {}
  }

  Widget listKursiKapal(List barisDataKursi, bool datakursi, String str) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
      itemCount: barisDataKursi.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: datakursi ? 3 : 3,
        // childAspectRatio: datakursi ? 1 : 1,
        crossAxisSpacing: 2,
        mainAxisSpacing: 4,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          setState(() {
            barisDataKursi[index]['dipilih'] =
                !barisDataKursi[index]['dipilih'];
          });
        },
        child: Visibility(
          visible: barisDataKursi[index]['nokursi'],
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  width: 1.5,
                  color: barisDataKursi[index]['terjual']
                      ? Colors.blueGrey.shade700
                      : barisDataKursi[index]['dipilih']
                          ? Colors.cyanAccent.shade700
                          : Colors.lightBlue.shade700),
              color: barisDataKursi[index]['terjual']
                  ? Colors.blueGrey
                  : barisDataKursi[index]['dipilih']
                      ? Colors.cyanAccent
                      : Colors.lightBlue,
            ),
            child: Text(
              "A:$str${(index < 9 ? index.compareTo(index.remainder(-24)) : '')}${(index + 1)}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}
