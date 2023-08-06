
import 'dart:convert';
List<EmergencyCat> EmergencyCatJson(String str) => List<EmergencyCat>.from(json.decode(str).map((x) => EmergencyCat.fromJson(x)));

String postToJson(List<EmergencyCat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmergencyCat {

  //[{"id":"1","name":"আগ্রাবাদ শিশু হাসপাতাল","catid":"1","mobile":"01820029522"},{"id":"3","name":"Hospiltal","catid":"3","mobile":"asd"}]
  String? id;
  String? name;
  String? image;
  EmergencyCat(
      {this.id, this.name, this.image});

  EmergencyCat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}