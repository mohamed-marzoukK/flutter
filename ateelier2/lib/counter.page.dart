import 'package:flutter/material.dart';

class ConterPage extends StatefulWidget {
   ConterPage({super.key});

  @override
  State<ConterPage> createState() => _ConterPageState();
}

class _ConterPageState extends State<ConterPage> {
  int counter =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Text(
            'Counter value => $counter',
            style:TextStyle(color: Colors.deepOrange,fontSize: 22)
        ),
      ),
      floatingActionButton: Row(children: [
        SizedBox(width: 20),



      FloatingActionButton(
        child: Icon(Icons.add),

        onPressed: (){
          setState(() {
            counter++;
            print(counter);
          });


        },
      ),
    FloatingActionButton(
      child: Icon(Icons.remove),
      onPressed: () {
        setState(() {
          counter--;
          print(counter);
        });
      },
      ),
      ],),
    );
  }
}
