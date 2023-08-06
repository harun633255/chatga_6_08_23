
import 'dart:convert';
List<Borno> BornoJson(String str) => List<Borno>.from(json.decode(str).map((x) => Borno.fromJson(x)));

String postToJson(List<Borno> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Borno {
  String? id;
  String? borno;
  Borno(
      {this.id, this.borno});

  Borno.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    borno = json['borno'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['borno'] = this.borno;
    return data;
  }
}