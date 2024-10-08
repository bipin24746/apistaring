// To parse this JSON data, do
//
//     final sample = sampleFromJson(jsonString);

import 'dart:convert';

List<Sample> sampleFromJson(String str) => List<Sample>.from(json.decode(str).map((x) => Sample.fromJson(x)));

String sampleToJson(List<Sample> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sample {
    int userId;
    int id;
    String title;
    String body;

    Sample({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory Sample.fromJson(Map<String, dynamic> json) => Sample(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
