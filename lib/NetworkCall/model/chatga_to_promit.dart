
import 'dart:convert';
List<ChatgaToPromit> classListPostFromJson(String str) => List<ChatgaToPromit>.from(json.decode(str).map((x) => ChatgaToPromit.fromJson(x)));

String postToJson(List<ChatgaToPromit> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatgaToPromit {
  String? id;
  String? ctg;
  String? promit;
  String? audio;

  //"id":"6","english":"Our","ctg":"Arar","audio"

  ChatgaToPromit(
      {this.id, this.ctg, this.promit,this.audio});

  ChatgaToPromit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ctg = json['ctg'];
    promit = json['promit'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ctg'] = this.ctg;
    data['promit'] = this.promit;
    data['audio'] = this.audio;
    return data;
  }
}