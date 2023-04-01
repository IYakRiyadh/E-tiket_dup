class TiketKapalModel {
  final String namaKapal;
  final String asal;
  final String tujuan;
  final String kategori;
  final String jenis;
  final String kursi;
  final String hari;
  final String waktu;

  TiketKapalModel({
    required this.namaKapal,
    required this.asal,
    required this.tujuan,
    required this.kategori,
    required this.jenis,
    required this.kursi,
    required this.hari,
    required this.waktu,
  });

  Map<String, dynamic> map() {
    return {
      namaKapal: 'namaKapal',
      asal: 'asal',
      tujuan: 'tujuan',
      kategori: 'kategori',
      jenis: 'jenis',
      kursi: 'kursi',
      hari: 'hari',
      waktu: 'waktu'
    };
  }

  factory TiketKapalModel.fromJson(Map<String, dynamic> toJson) =>
      TiketKapalModel(
          namaKapal: toJson['namaKapal'],
          asal: toJson['asal'],
          tujuan: toJson['tujuan'],
          kategori: toJson['kategori'],
          jenis: toJson['jenis'],
          kursi: toJson['kursi'],
          hari: toJson['hari'],
          waktu: toJson['waktu']);
}
