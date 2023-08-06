
import 'dart:convert';
List<Gan> GanJson(String str) => List<Gan>.from(json.decode(str).map((x) => Gan.fromJson(x)));

String postToJson(List<Gan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gan{

  String? id;
  String? name;
  String? youtubelink;
  String? type;
  Gan(
      {this.id, this.name, this.youtubelink, this.type});

  Gan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    youtubelink = json['youtubelink'];
    type = json['type'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['youtubelink'] = this.youtubelink;
    data['type'] = this.type;
    return data;
  }
}