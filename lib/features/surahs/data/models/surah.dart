import 'ayah.dart';

class Surah {
  int? number;
  String? name;
  String? revelationType;
  List<Ayah> ayahs=[];

  Surah({this.number, this.name, this.revelationType, this.ayahs=const[]});

  Surah.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    revelationType = json['revelationType'];
    if (json['ayahs'] != null) {
      ayahs = <Ayah>[];
      json['ayahs'].forEach((v) {
        ayahs.add(Ayah.fromJson(v));
      });
    }
  }
}


