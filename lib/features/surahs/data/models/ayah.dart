class Ayah{
  int? number;
  String? text;
  int? numberInSurah;
  int? hizbQuarter;


  Ayah(
      {this.number,
      this.text,
      this.numberInSurah,
      this.hizbQuarter,
});

  Ayah.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    text = json['text'];
    numberInSurah = json['numberInSurah'];
    hizbQuarter = json['hizbQuarter'];

  }
}
