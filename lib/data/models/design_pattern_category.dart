import 'package:flutter_design_patterns/data/models/design_pattern.dart';

class DesignPatternCategory {
  final String id;
  final String title;
  final int color;
  final List<DesignPattern> patterns;

  const DesignPatternCategory({
    required this.id,
    required this.title,
    required this.color,
    required this.patterns,
  });

  factory DesignPatternCategory.fromJson(Map<String, dynamic> json) {
    final designPatternJsonList = json['patterns'] as List;
    final designPatternList = designPatternJsonList
        .map(
          (designPatternJson) => DesignPattern.fromJson(designPatternJson),
        )
        .toList();

    return DesignPatternCategory(
      id: json['id'],
      title: json['title'],
      color: int.parse(json['color']),
      patterns: designPatternList,
    );
  }
}
