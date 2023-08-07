import 'package:dynamic_view_example/service/models/dynamic_model.dart';
import 'package:flutter/material.dart';

class GlobalDynamic extends StatelessWidget {
  const GlobalDynamic({Key? key, required this.dynamicView}) : super(key: key);

  final DynamicView dynamicView;

  @override
  Widget build(BuildContext context) {
    switch (dynamicView.type) {
      case "container":
        {
          return Column(
            children: [
              Container(
                width: dynamicView.width.toDouble(),
                height: dynamicView.height.toDouble(),
                color: HexColor(dynamicView.color),
                child: Center(
                  child: Text(
                    dynamicView.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        }
      case "column":
        {
          return Column(
            children: [
              Container(
                width: dynamicView.width.toDouble(),
                height: dynamicView.height.toDouble(),
                color: HexColor(dynamicView.color),
                child: Center(
                  child: Text(
                    dynamicView.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          );
        }
      case "raw":
        {
          return Row(
            children: [
              Container(
                width: dynamicView.width.toDouble(),
                height: dynamicView.height.toDouble(),
                color: HexColor(dynamicView.color),
                child: Center(
                  child: Text(
                    dynamicView.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          );
        }
      case "sizedbox":
        {
          return Column(
            children: [
              SizedBox(
                width: dynamicView.width.toDouble(),
                height: dynamicView.height.toDouble(),
                child: Container(
                  color: HexColor(dynamicView.color),
                  child: Center(
                    child: Text(
                      dynamicView.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          );
        }
      default:
        return const Text("No Input found");
    }
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
