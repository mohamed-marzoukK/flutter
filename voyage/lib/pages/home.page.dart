
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/global.params.dart';
import '../menu/drawer.widget.dart';

class HomePage extends StatelessWidget {
  //const HomePage({super.key});
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text('page Home')),
      body: Center(
        child: Wrap(
          children: [
            ...(GlobalParams.accueil as List).map((item){
              return InkWell(
                child: item['icon'],
                onTap: (){
                  Navigator.pushNamed(context, item['route']);
                },
              );
            }).toList(),
           /* InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/meteo.png',),
              ),
              onTap: (){
                Navigator.pushNamed(context, '/meteo');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/gallerie.png',),
              ),
              onTap: (){
                Navigator.pushNamed(context, '/gallerie');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/pays.png',),
              ),
              onTap: (){
                Navigator.pushNamed(context, '/pays');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/contact.png',),
              ),
              onTap: (){
                Navigator.pushNamed(context, '/contact');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/parametres.png',),
              ),
              onTap: (){
                Navigator.pushNamed(context, '/parametres');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('images/deconnexion.png',),
              ),
              onTap: (){
                Navigator.pushNamed(context, '/deconnexion');
              },
            ),*/
          ],
        ),
      )
    );
  }

  Future <void> Deconnexion(BuildContext context) async{

      prefs = await SharedPreferences.getInstance();
      prefs.setBool("connecte", false);
      Navigator . pushNamedAndRemoveUntil (context, '/authentification', (route) => false);
    }




  }


