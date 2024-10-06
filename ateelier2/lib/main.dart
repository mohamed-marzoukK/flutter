
import 'package:ateelier2/counter.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: ConterPage(),
    );
  }
}


