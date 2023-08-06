
import 'dart:convert';
List<DorshoniyoPlace> DorshoniyoJson(String str) => List<DorshoniyoPlace>.from(json.decode(str).map((x) => DorshoniyoPlace.fromJson(x)));

String postToJson(List<DorshoniyoPlace> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DorshoniyoPlace {
  String? id;
  String? name;
  String? image;
  String? description;
  DorshoniyoPlace(
      {this.id, this.name, this.image, this.description});

  DorshoniyoPlace.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}