import 'package:dynamic_view_example/service/network/api.dart';
import 'package:dynamic_view_example/service/service/notification/notify_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:dynamic_view_example/service/models/response.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Response> postData() async {
    print('ishladi');
    final Map<String, dynamic> data = {
      "name": "1202 Ultra Max Phone",
      "data": {
        "year": 2050,
        "price": 9999.99,
        "CPU model": "Eplab bo'miydigan cpu",
        "Hard disk size": "Cheksiz",
      }
    };

    final http.Response response = await http.post(
      Uri.parse('https://api.restful-api.dev/objects'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      print("Data sent successfully!");
      Response res = Response.fromJson(json.decode(response.body));
      LocalNotificationService.localNotificationService.showNotification(
          id: 1, title: "Yangi item qo'shdik", body: res.name);
      return res;
    } else {
      print("Error sending data. Status code: ${response.statusCode}");
      throw Exception('Failed to send data');
    }
  }

  @override
  void initState() {
    postData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
