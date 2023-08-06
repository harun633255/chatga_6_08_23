
import 'dart:convert';
List<Emergency> EmergencyJson(String str) => List<Emergency>.from(json.decode(str).map((x) => Emergency.fromJson(x)));

String postToJson(List<Emergency> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Emergency {

  String? id;
  String? name;
  String? catid;
  String? mobile;
  Emergency(
      {this.id, this.name, this.catid, this.mobile});

  Emergency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    catid = json['catid'];
    mobile = json['mobile'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['catid'] = this.catid;
    data['mobile'] = this.mobile;
    return data;
  }
}