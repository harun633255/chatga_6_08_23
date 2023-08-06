
import 'dart:convert';
List<BusService> BusServiceJson(String str) => List<BusService>.from(json.decode(str).map((x) => BusService.fromJson(x)));

String postToJson(List<BusService> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusService {
  String? id;
  String? name;
  String? details;
  BusService(
      {this.id, this.name, this.details});

  BusService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['details'] = this.details;
    return data;
  }
}