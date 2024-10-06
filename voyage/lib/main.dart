import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/authentification.page.dart';

import 'pages/home.page.dart';
import 'pages/inscription.page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final routes = {
  '/home': (context) =>HomePage(),
    '/inscription': (context) =>InscriptionPage(),
    '/authentification': (context) =>AuthentificationPage(),

  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
    home: FutureBuilder(
    future: SharedPreferences. getInstance(),
    builder: (context, snapshot)
    {
    if (snapshot. hasData) {
    bool conn = snapshot.data ?. getBool ('connecte') ?? false;
    if (conn)
    return HomePage () ;
    }

    return AuthentificationPage();
    })
    );
  }
}

