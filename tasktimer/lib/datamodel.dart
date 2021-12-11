// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.datas,
  });

  Datas datas;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        datas: Datas.fromJson(json["datas"]),
      );

  Map<String, dynamic> toJson() => {
        "datas": datas.toJson(),
      };
}

class Datas {
  Datas({
    this.date,
    this.description,
    this.title,
    this.time,
  });

  dynamic date;
  dynamic description;
  dynamic title;
  dynamic time;

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
      date: json["date"],
      description: json["description"],
      title: json["title"],
      time: json['time']);

  Map<String, dynamic> toJson() => {
        "date": date,
        "description": description,
        "title": title,
        "time": time,
      };
}

class Data {
  String title, description, datetime;
  Data(this.title, this.description, this.datetime);
}
