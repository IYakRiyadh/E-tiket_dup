import 'dart:ui';

import 'package:e_tiket_kapal_ta/view/Informasi.dart';
import 'package:flutter/material.dart';

class InforView extends StatelessWidget {
  const InforView({super.key, required this.imgView});
  final InformasiBeritaView imgView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi'),
        leading: BackButton(
          onPressed: () {},
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Image.asset('/images/edit.png'),
            )
          ],
        ),
      ),
    );
  }
}
