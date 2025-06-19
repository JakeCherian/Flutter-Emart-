import 'package:emart/HomePage.dart';
import 'package:flutter/material.dart';
final List<String> filters = const['All', 'Nike', 'Adidas', 'Puma'];
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shopping App",
      home: HomePage(),
      theme:ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Orbitron",
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.black,
        )
      ),
    );
  }
}