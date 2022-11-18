import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_design_patterns/constants.dart';

class MarkdownRepository {
  Future<String> get(String designPatterId) async {
    final path = '$markdownPath$designPatterId.md';
    final markdownString = await rootBundle.loadString(path);

    return markdownString;
  }
}
