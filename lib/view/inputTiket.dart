import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_tiket_kapal_ta/database/tiketLocal.dart';
import 'package:e_tiket_kapal_ta/models/tiketModel.dart';
import 'package:e_tiket_kapal_ta/view/pages/kursiKapal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FormInputTiketKapal extends StatefulWidget {
  const FormInputTiketKapal({super.key});

  @override
  State<FormInputTiketKapal> createState() => _FormInputTiketKapalState();
}

class _FormInputTiketKapalState extends State<FormInputTiketKapal> {
  final TextEditingController dariCtrl = TextEditingController();
  final TextEditingController keCtrl = TextEditingController();
  final TextEditingController kursiCtrl = TextEditingController();
  final TextEditingController waktuCtrl = TextEditingController();
  final TextEditingController jenisCtrl = TextEditingController();
  final TextEditingController kategoriCtrl = TextEditingController();

  final List<String> jenisTiket = ['Dewasa', 'Bayi'];
  final List<String> kategoriTiket = ['Ekonomi', 'VIP', 'VIP Eksklusif'];
  final List<String> ruteKapal = ['Kalianget', 'Kangean', 'Jangkar'];
  final List<TiketKapalModel> rute = [];

  String? valRuteKapal;
  String? valJenisTiket;
  String? valKategoriTiket;

  @override
  Widget build(BuildContext context) {
    final ukuran = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking Tiket',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<TiketKapalModel>>(
        future: TiketApi.getApiTiket(context),
        builder: (context, snapshot) => Container(
          width: ukuran.width,
          height: ukuran.height,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  child: Column(),
                ),
              ),
              Container(
                height: 500,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.cyanAccent),
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 8.0),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1.5, color: Colors.blueGrey),
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      // width: ukuran.shortestSide,
                      height: 34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        readOnly: true,
                        // controller: dariCtrl,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsetsDirectional.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 1.5,
                              color: Colors.blueGrey,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(
                                      left: 10, bottom: 5),
                                  child: const Text(
                                    'Asal',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  // width: ukuran.shortestSide,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: DropdownButtonFormField2(
                                    // controller: dariCtrl,
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconOnClick:
                                        const Icon(Icons.arrow_drop_up),
                                    buttonHeight: 34,
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          width: 1.5,
                                          color: Colors.blueGrey,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                    items: rute
                                        .map(
                                          (item) => DropdownMenuItem(
                                            value: item.asal.length,
                                            child: Text(
                                              item.asal.toString(),
                                            ),
                                          ),
                                        )
                                        .toList(),

                                    onChanged: (value) {
                                      valRuteKapal = value.toString();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(
                                      left: 10, bottom: 5),
                                  child: const Text(
                                    'Tujuan',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  // width: ukuran.shortestSide,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: DropdownButtonFormField2(
                                    // controller: dariCtrl,
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconOnClick:
                                        const Icon(Icons.arrow_drop_up),
                                    buttonHeight: 34,
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          width: 1.5,
                                          color: Colors.blueGrey,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                    // value: Tet,
                                    items: ruteKapal
                                        .map(
                                          (item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      valRuteKapal = value.toString();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(
                                      left: 10, bottom: 5),
                                  child: const Text(
                                    'Kategori',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  // width: ukuran.shortestSide,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: DropdownButtonFormField2(
                                    // controller: dariCtrl,
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconOnClick:
                                        const Icon(Icons.arrow_drop_up),
                                    buttonHeight: 34,
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          width: 1.5,
                                          color: Colors.blueGrey,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                    items: kategoriTiket
                                        .map(
                                          (item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    value: kategoriTiket.first,
                                    onChanged: (value) {
                                      valKategoriTiket = value as String;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(
                                      left: 10, bottom: 5),
                                  child: const Text(
                                    'Jenis',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  // width: ukuran.shortestSide,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: DropdownButtonFormField2(
                                    // controller: dariCtrl,
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconOnClick:
                                        const Icon(Icons.arrow_drop_up),
                                    buttonHeight: 34,
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          width: 1.5,
                                          color: Colors.blueGrey,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                    value: jenisTiket.first,
                                    items: jenisTiket
                                        .map(
                                          (item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (Object? value) {
                                      valJenisTiket = value as String;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 10, bottom: 5),
                            child: const Text(
                              'Hari Berangkat',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            // width: ukuran.shortestSide,
                            height: 34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              // controller: dariCtrl,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsetsDirectional.all(10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    width: 1.5,
                                    color: Colors.blueGrey,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(
                                      left: 10, bottom: 5),
                                  child: const Text(
                                    'Kursi',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  // width: ukuran.shortestSide,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    // controller: dariCtrl,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsetsDirectional.all(10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          width: 1.5,
                                          color: Colors.blueGrey,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: ElevatedButton(
                                child: const Text(
                                  'Pilih',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const KursiKapal(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                      child: ElevatedButton(
                        child: const Text(
                          'Booking Sekarang',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
