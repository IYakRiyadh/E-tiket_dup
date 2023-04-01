class ModelKursi {
  late final String? id;
  late final String? nama;

  ModelKursi({this.id, this.nama});

  // Map<String, dynamic> map() {
  //   return {id: 'id', id: 'nama'};
  // }

  ModelKursi.toMap(Map<String, dynamic> toJson) {
    id = toJson['id'];
    nama = toJson['nama'];
  }
}

class ListDataKursiModel {
  late final String? namaId;
  List<ModelKursi>? nama;

  ListDataKursiModel({this.namaId, this.nama});

  ListDataKursiModel.fromJson(Map<String, dynamic> json) {
    namaId = json['namaId'];
    nama = List<ModelKursi>.from(json['nama'].map((val) {
      return ModelKursi.toMap(val);
    }));
  }
}
