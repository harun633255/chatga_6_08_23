
import 'dart:convert';
List<EnglishToChatga> PostFromJson(String str) => List<EnglishToChatga>.from(json.decode(str).map((x) => EnglishToChatga.fromJson(x)));

String postToJson(List<EnglishToChatga> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EnglishToChatga {
  String? id;
  String? english;
  String? ctg;
  String? audio;
  //[{"id":"4","name":"Cottagram","image":"http:\/\/chatga.net\/assest\/1665498438backgorund-image.png","description":"asd"}]
  EnglishToChatga(
      {this.id, this.english, this.ctg, this.audio});

  EnglishToChatga.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    english = json['english'];
    ctg = json['ctg'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['english'] = this.english;
    data['ctg'] = this.ctg;
    data['audio'] = this.audio;
    return data;
  }
}