import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_tiket_kapal_ta/models/nomorKursi.dart';
import 'package:flutter/services.dart';

class DataKursi {
  Future<ListDataKursiModel> jsonSevice() async {
    ListDataKursiModel dataModelKursi;

    String dataKursi = await rootBundle.loadString('/json/kursi.json');
    var kursi = jsonDecode(dataKursi);

    dataModelKursi = ListDataKursiModel.fromJson(kursi);
    return dataModelKursi;
  }
}
