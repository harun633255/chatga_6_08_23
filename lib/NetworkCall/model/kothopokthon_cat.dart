
import 'dart:convert';
List<KothopokThonCat> KothoPokThonFromJson(String str) => List<KothopokThonCat>.from(json.decode(str).map((x) => KothopokThonCat.fromJson(x)));

String postToJson(List<KothopokThonCat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KothopokThonCat {
  String? id;
  String? name;

  KothopokThonCat(
      {this.id, this.name});

  KothopokThonCat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}