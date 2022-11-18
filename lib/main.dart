import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/router.dart' as route;
import 'package:flutter_design_patterns/themes.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design Patterns App',
      theme: lightTheme,
      initialRoute: initialRoute,
      onGenerateRoute: route.Router.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
