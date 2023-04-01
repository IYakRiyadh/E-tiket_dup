class BeritaInforKapal {
  String? img;
  String? judul;
  String? deskripsi;
  String? waktuUpload;

  BeritaInforKapal({this.img, this.deskripsi, this.judul, this.waktuUpload});

  factory BeritaInforKapal.toJson(Map<String, dynamic> map) {
    return BeritaInforKapal(
      img: map['img'],
      judul: map['judul'],
      deskripsi: map['deskripsi'],
      waktuUpload: map['waktuUpload'],
    );
  }

  Map<String, dynamic>? toMap() {
    return {
      'img': img,
      'judul': judul,
      'deskripsi': deskripsi,
      'waktuUpload': waktuUpload,
    };
  }
}
