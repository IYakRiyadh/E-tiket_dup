import 'dart:convert';

import 'package:e_tiket_kapal_ta/models/tiketModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TiketApi {
  static Future<List<TiketKapalModel>> getApiTiket(BuildContext context) async {
    final bunddleApiVal = DefaultAssetBundle.of(context);
    final dataApi = await bunddleApiVal.loadString('/json/tiket.json');
    final dataBody = const JsonDecoder().convert(dataApi);

    return dataBody.map<TiketKapalModel>((data) {
      TiketKapalModel.fromJson(data);
    }).toList;
  }
}
