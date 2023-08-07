// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);

import 'dart:convert';

Response responseFromJson(String str) => Response.fromJson(json.decode(str));

String responseToJson(Response data) => json.encode(data.toJson());

class Response {
    String name;
    Data data;

    Response({
        required this.name,
        required this.data,
    });

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        name: json["name"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "data": data.toJson(),
    };
}

class Data {
    int year;
    double price;
    String cpuModel;
    String hardDiskSize;

    Data({
        required this.year,
        required this.price,
        required this.cpuModel,
        required this.hardDiskSize,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        year: json["year"],
        price: json["price"]?.toDouble(),
        cpuModel: json["CPU model"],
        hardDiskSize: json["Hard disk size"],
    );

    Map<String, dynamic> toJson() => {
        "year": year,
        "price": price,
        "CPU model": cpuModel,
        "Hard disk size": hardDiskSize,
    };
}
