// To parse this JSON data, do
//
//     final gameModel = gameModelFromJson(jsonString);

import 'dart:convert';

List<GameModel> gameModelFromJson(String str) => List<GameModel>.from(json.decode(str).map((x) => GameModel.fromJson(x)));

String gameModelToJson(List<GameModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GameModel {
  String internalName;
  String title;
  String metacriticLink;
  String dealId;
  String storeId;
  String gameId;
  String salePrice;
  String normalPrice;
  String isOnSale;
  String savings;
  String metacriticScore;
  String steamRatingText;
  String steamRatingPercent;
  String steamRatingCount;
  String steamAppId;
  int releaseDate;
  int lastChange;
  String dealRating;
  String thumb;

  GameModel({
    required this.internalName,
    required this.title,
    required this.metacriticLink,
    required this.dealId,
    required this.storeId,
    required this.gameId,
    required this.salePrice,
    required this.normalPrice,
    required this.isOnSale,
    required this.savings,
    required this.metacriticScore,
    required this.steamRatingText,
    required this.steamRatingPercent,
    required this.steamRatingCount,
    required this.steamAppId,
    required this.releaseDate,
    required this.lastChange,
    required this.dealRating,
    required this.thumb,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
    internalName: json["internalName"]??"",
    title: json["title"]??"",
    metacriticLink: json["metacriticLink"]??"",
    dealId: json["dealID"]??"",
    storeId: json["storeID"]??"",
    gameId: json["gameID"]??"",
    salePrice: json["salePrice"]??"",
    normalPrice: json["normalPrice"]??"",
    isOnSale: json["isOnSale"]??"",
    savings: json["savings"]??"",
    metacriticScore: json["metacriticScore"]??"",
    steamRatingText: json["steamRatingText"]??"",
    steamRatingPercent: json["steamRatingPercent"]??"",
    steamRatingCount: json["steamRatingCount"]??"",
    steamAppId: json["steamAppID"]??"",
    releaseDate: json["releaseDate"]??"",
    lastChange: json["lastChange"]??"",
    dealRating: json["dealRating"]??"",
    thumb: json["thumb"]??"",
  );

  Map<String, dynamic> toJson() => {
    "internalName": internalName,
    "title": title,
    "metacriticLink": metacriticLink,
    "dealID": dealId,
    "storeID": storeId,
    "gameID": gameId,
    "salePrice": salePrice,
    "normalPrice": normalPrice,
    "isOnSale": isOnSale,
    "savings": savings,
    "metacriticScore": metacriticScore,
    "steamRatingText": steamRatingText,
    "steamRatingPercent": steamRatingPercent,
    "steamRatingCount": steamRatingCount,
    "steamAppID": steamAppId,
    "releaseDate": releaseDate,
    "lastChange": lastChange,
    "dealRating": dealRating,
    "thumb": thumb,
  };
}
