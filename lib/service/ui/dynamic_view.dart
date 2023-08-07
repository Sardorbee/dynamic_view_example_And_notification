import 'dart:convert';

import 'package:dynamic_view_example/service/models/dynamic_model.dart';
import 'package:dynamic_view_example/service/ui/widget/global_dynamic.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DynamicViewExample extends StatefulWidget {
  DynamicViewExample({super.key, required this.name});
  String name;

  @override
  State<DynamicViewExample> createState() => _DynamicViewExampleState();
}

class _DynamicViewExampleState extends State<DynamicViewExample> {
  List<DynamicView> dynamicViews = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('https://dynamic-view-api.free.mockoapp.net/views'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> viewsJson = jsonData['dynamic_views'];

      setState(() {
        dynamicViews = viewsJson
            .map((viewJson) => DynamicView.fromJson(viewJson))
            .toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.name),
      ),
      body: ListView.builder(
        itemCount: dynamicViews.length,
        itemBuilder: (context, index) {
          final view = dynamicViews[index];
          return getContainer(GlobalDynamic(dynamicView: view));
        },
      ),
    );
  }
}
// Container(
//               margin: const EdgeInsets.all(8),
//               width: view.width.toDouble(),
//               height: view.height.toDouble(),
//               color: HexColor(view.color),
//               child: Center(
//                 child: Text(
//                   view.title,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//             )

Widget getContainer(Widget widget) {
  return Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 8,
              spreadRadius: 6,
              offset: const Offset(2, 4),
              color: Colors.grey.withOpacity(0.3))
        ]),
    child: widget,
  );
}
