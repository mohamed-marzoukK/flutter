import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Parametres extends StatelessWidget {
  const Parametres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parametres'),
      ),
      body: Center(
        child: Text('text centrer',style: TextStyle(fontSize: 24,color: Colors.blue),),
      ),
    );
  }
}
