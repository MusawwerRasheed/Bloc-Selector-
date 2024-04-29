import 'dart:convert';
 
class FirstRowStatsModel {
    final String? imageurl;
    final String? title;
    final String? amount;
    final String? subAmount;
    final dynamic? flags;

    FirstRowStatsModel({
        this.imageurl,
        this.title,
        this.amount,
        this.subAmount,
        this.flags,
    });

    factory FirstRowStatsModel.fromRawJson(String str) => FirstRowStatsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FirstRowStatsModel.fromJson(Map<String, dynamic> json) => FirstRowStatsModel(
        imageurl: json["imageurl"],
        title: json["title"],
        amount: json["amount"],
        subAmount: json["subAmount"],
        flags: json["flags"],
    );

    Map<String, dynamic> toJson() => {
        "imageurl": imageurl,
        "title": title,
        "amount": amount,
        "subAmount": subAmount,
        "flags": flags,
    };
}