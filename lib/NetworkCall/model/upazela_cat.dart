
import 'dart:convert';
List<UpazelaCat> UpazilaPostFromJson(String str) => List<UpazelaCat>.from(json.decode(str).map((x) => UpazelaCat.fromJson(x)));

String postToJson(List<UpazelaCat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UpazelaCat {
  String? id;
  String? name;

  UpazelaCat(
      {this.id, this.name});

  UpazelaCat.fromJson(Map<String, dynamic> json) {
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