import 'package:flutter/material.dart';
import 'screens/homescreen.dart';



// App's Main Entry Point
void main() {
  runApp(MyApp());
}


// Root Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Basic UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: HomeScreen(),
    );
  }
}



