import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category.all({
    required this.id,
    required this.title,
    required this.color,
  });

  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  const Category.amber({
    required this.id,
    required this.title,
  }) : color = Colors.amber;

  const Category.green(String newID, String title)
      : this.all(id: newID, title: title, color: Colors.green);

  factory Category.fromJSON(Map<String, dynamic> json) {
    final result = json["color"] != null
        ? Category.all(
            id: json["id"],
            title: json["title"],
            color: json["color"],
          )
        : Category(
            id: json["id"],
            title: json["title"],
          );
    return result;
  }

  @override
  String toString() => "id: $id"
      "title: $title "
      "color: $color";
}
