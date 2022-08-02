import 'package:dailymoney/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          fontFamily: 'QuickSand',
          textTheme: const TextTheme(
              titleMedium: TextStyle(fontFamily: 'Opensans', fontSize: 18)),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(fontFamily: 'Opensans', fontSize: 20)),
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.amber,
          )),
      home: const Homepage(),
    );
  }
}
