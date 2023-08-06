
import 'dart:convert';
List<News> NewsJson(String str) => List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String postToJson(List<News> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  String? id;
  String? name;
  String? youtubelink;
  String? thumbnail;
  String? type;
  News(
      {this.id, this.name, this.youtubelink,this.thumbnail, this.type});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    youtubelink = json['youtubelink'];
    thumbnail = json['thumbnail'];
    type = json['type'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['youtubelink'] = this.youtubelink;
    data['thumbnail'] = this.thumbnail;
    data['type'] = this.type;
    return data;
  }
}