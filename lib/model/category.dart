import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';

class Category {
  int id;
  String label;
  String content;

  Category({this.id, this.label, this.content,});

  static Future<List<Category>> getCategories() async {
    final String response = await rootBundle.loadString('assets/tabs.json');
    //final data = await json.decode(response);
    //final data = jsonDecode(response);
    //print(data);

    List<Category> list = [];
    try {
        Map<String, dynamic> map = json.decode(response);
        for (var map in map['tabs']) {
          list.add(Category(id: map['id'], label: map['label'],content: map['content']));
        }

    } catch (e, _) {
      debugPrint(e.toString());
    }
    return list;
  }
}