
import 'dart:convert';
List<Baktiborgo> BaktiBorgoJson(String str) => List<Baktiborgo>.from(json.decode(str).map((x) => Baktiborgo.fromJson(x)));

String postToJson(List<Baktiborgo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Baktiborgo {
  String? id;
  String? name;
  String? image;
  String? description;

  //[{"id":"1","name":"সারাদেশ থেকে চট্টগ্রামে পন্য নিয়ে এসেছেন নারীরা","youtubelink":"https:\/\/www.youtube.com\/watch?v=N40fz2mwStY","type":"news"}]
  Baktiborgo(
      {this.id, this.name, this.image, this.description});

  Baktiborgo.fromJson(Map<String, dynamic> json) {
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