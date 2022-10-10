// To parse this JSON data, do
//
//     final home = homeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Home {
  Home({
    required this.error,
    required this.message,
    required this.data,
  });

  final bool error;
  final String message;
  final Data data;

  factory Home.fromRawJson(String str) => Home.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        error: json["error"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.topBanner,
    required this.washSubscriptions,
    required this.bottomBanner,
  });

  final Banner topBanner;
  final List<WashSubscription> washSubscriptions;
  final Banner bottomBanner;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        topBanner: Banner.fromJson(json["top_banner"]),
        washSubscriptions: List<WashSubscription>.from(
            json["wash_subscriptions"]
                .map((x) => WashSubscription.fromJson(x))),
        bottomBanner: Banner.fromJson(json["bottom_banner"]),
      );

  Map<String, dynamic> toJson() => {
        "top_banner": topBanner.toJson(),
        "wash_subscriptions":
            List<dynamic>.from(washSubscriptions.map((x) => x.toJson())),
        "bottom_banner": bottomBanner.toJson(),
      };
}

class Banner {
  Banner({
    required this.key,
    required this.name,
    required this.description,
    required this.banners,
    required this.id,
  });

  final String key;
  final String name;
  final String description;
  final List<BannerElement> banners;
  final String id;

  factory Banner.fromRawJson(String str) => Banner.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        key: json["key"],
        name: json["name"],
        description: json["description"],
        banners: List<BannerElement>.from(
            json["banners"].map((x) => BannerElement.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "description": description,
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "id": id,
      };
}

class BannerElement {
  BannerElement({
    required this.index,
    required this.image,
    required this.link,
  });

  final int index;
  final String image;
  final String link;

  factory BannerElement.fromRawJson(String str) =>
      BannerElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BannerElement.fromJson(Map<String, dynamic> json) => BannerElement(
        index: json["index"],
        image: json["image"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "image": image,
        "link": link,
      };
}

class WashSubscription {
  WashSubscription({
    required this.name,
    required this.description,
    required this.image,
    required this.cost,
    required this.createdOn,
    required this.id,
  });

  final String name;
  final String description;
  final String image;
  final int cost;
  final DateTime createdOn;
  final String id;

  factory WashSubscription.fromRawJson(String str) =>
      WashSubscription.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WashSubscription.fromJson(Map<String, dynamic> json) =>
      WashSubscription(
        name: json["name"],
        description: json["description"],
        image: json["image"],
        cost: json["cost"],
        createdOn: DateTime.parse(json["createdOn"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "image": image,
        "cost": cost,
        "createdOn": createdOn.toIso8601String(),
        "id": id,
      };
}
