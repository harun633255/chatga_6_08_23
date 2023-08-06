
import 'dart:convert';
List<KothopokThon> KothonPokthonJson(String str) => List<KothopokThon>.from(json.decode(str).map((x) => KothopokThon.fromJson(x)));

String postToJson(List<KothopokThon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KothopokThon {
  String? id;
  String? kothopokothon;
  String? ctg;
  String? audio;
  String? catid;
  KothopokThon(
      {this.id, this.kothopokothon, this.ctg, this.audio, this.catid});

  KothopokThon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kothopokothon = json['kothopokothon'];
    ctg = json['ctg'];
    audio = json['audio'];
    catid = json['catid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kothopokothon'] = this.kothopokothon;
    data['ctg'] = this.ctg;
    data['audio'] = this.audio;
    data['catid'] = this.catid;
    return data;
  }
}