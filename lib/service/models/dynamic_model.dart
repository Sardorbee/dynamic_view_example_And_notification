// To parse this JSON data, do
//
//     final dynamicModel = dynamicModelFromJson(jsonString);

import 'dart:convert';

DynamicModel dynamicModelFromJson(String str) => DynamicModel.fromJson(json.decode(str));

String dynamicModelToJson(DynamicModel data) => json.encode(data.toJson());

class DynamicModel {
    List<DynamicView> dynamicViews;

    DynamicModel({
        required this.dynamicViews,
    });

    factory DynamicModel.fromJson(Map<String, dynamic> json) => DynamicModel(
        dynamicViews: List<DynamicView>.from(json["dynamic_views"].map((x) => DynamicView.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dynamic_views": List<dynamic>.from(dynamicViews.map((x) => x.toJson())),
    };
}

class DynamicView {
    String title;
    int sort;
    String group;
    int width;
    int height;
    String color;
    String type;

    DynamicView({
        required this.title,
        required this.sort,
        required this.group,
        required this.width,
        required this.height,
        required this.color,
        required this.type,
    });

    factory DynamicView.fromJson(Map<String, dynamic> json) => DynamicView(
        title: json["title"],
        sort: json["sort"],
        group: json["group"],
        width: json["width"],
        height: json["height"],
        color: json["color"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "sort": sort,
        "group": group,
        "width": width,
        "height": height,
        "color": color,
        "type": type,
    };
}
