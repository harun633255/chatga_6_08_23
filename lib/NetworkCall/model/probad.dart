
import 'dart:convert';
List<Probad> ProbadJson(String str) => List<Probad>.from(json.decode(str).map((x) => Probad.fromJson(x)));

String postToJson(List<Probad> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Probad {
  String? id;
  String? probad;
  String? onubad;
  String? mormartho;
  String? english;
  String? audio;
  String? bornoid;

  Probad(
      {this.id, this.probad, this.onubad, this.mormartho, this.english, this.audio, this.bornoid});

  Probad.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    probad = json['probad'];
    onubad = json['onubad'];
    mormartho = json['mormartho'];
    english = json['english'];
    audio = json['audio'];
    bornoid = json['bornoid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['probad'] = this.probad;
    data['onubad'] = this.onubad;
    data['mormartho'] = this.mormartho;
    data['english'] = this.english;
    data['audio'] = this.audio;
    data['bornoid'] = this.bornoid;
    return data;
  }
}