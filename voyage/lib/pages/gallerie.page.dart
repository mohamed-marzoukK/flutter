import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';
import 'package:voyage/pages/gallerie-details.page.dart';

class Gallerie extends StatelessWidget {


  TextEditingController txt_gallerie =new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Page Gallerie')),
        drawer: MyDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: txt_gallerie,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.photo_library),
                    hintText: "Keyword",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1)
                    )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                onPressed: () {
                  _onGetGallerieDetails(context);
                },
                child: Text('Chercher', style: TextStyle(fontSize: 22),),
              ),
            ),
          ],
        )
    );
  }
  void _onGetGallerieDetails( BuildContext context) {
    String v = txt_gallerie.text;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GallerieDetailsPage(v)));
    txt_gallerie.text = "";
  }
}
