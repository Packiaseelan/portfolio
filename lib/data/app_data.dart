import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class AppData {
  late Map<String, dynamic> stringMap;

 init() async {
    stringMap = await parseJsonFromAssets('assets/data/temp.json');
  }

  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }
}
