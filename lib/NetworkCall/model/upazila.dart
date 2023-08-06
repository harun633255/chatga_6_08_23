import 'dart:convert';
List<UpazilaDetails> UpazilaDetailsPostFromJson(String str) => List<UpazilaDetails>.from(json.decode(str).map((x) => UpazilaDetails.fromJson(x)));

String postToJson(List<UpazilaDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UpazilaDetails {
String? id;
String? name;
String? history;
String? bittranto;
String? emergency;
String? catid;

UpazilaDetails(
{this.id, this.name, this.history, this.bittranto, this.emergency, this.catid});

UpazilaDetails.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
history = json['history'];
bittranto = json['bittranto'];
emergency = json['emergency'];
catid = json['catid'];

}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['name'] = this.name;
data['history'] = this.history;
data['bittranto'] = this.bittranto;
data['emergency'] = this.emergency;
data['catid'] = this.catid;
return data;
}
}