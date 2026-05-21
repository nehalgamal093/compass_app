import 'package:compass_app/core/features/home/providers/compass_provider.dart';
import 'package:compass_app/core/resources/strings_manager.dart';
import 'package:compass_app/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringsManager.appName,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CompassProvider()),
        ],
        child: HomePage(),
      ),
    );
  }
}
