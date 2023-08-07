import 'package:dynamic_view_example/service/network/api.dart';
import 'package:dynamic_view_example/service/service/notification/notify_service.dart';
import 'package:dynamic_view_example/service/ui/dynamic_view.dart';
import 'package:dynamic_view_example/service/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    LocalNotificationService.localNotificationService.init(navigatorKey);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      navigatorKey: navigatorKey,
    );
  }
}
