
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  //const HomePage({super.key});
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('page Home')),
      body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    minimumSize: const Size.fromHeight(50)),
    onPressed: () {
      Deconnexion(context);
    },

    child: Text ('Deconnexion', style: TextStyle(fontSize: 22))),


          )
      ),
    );
  }

  Future <void> Deconnexion(BuildContext context) async{

      prefs = await SharedPreferences.getInstance();
      prefs.setBool("connecte", false);
      Navigator . pushNamedAndRemoveUntil (context, '/authentification', (route) =>
      false);
    }
  }

