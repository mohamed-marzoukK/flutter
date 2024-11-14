import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GallerieDetailsPage extends StatefulWidget {
  String gallerie = "";
  GallerieDetailsPage(this.gallerie);

  @override
  State<GallerieDetailsPage> createState() => _GallerieDetailsPageState();
}

class _GallerieDetailsPageState extends State<GallerieDetailsPage> {
  var galleryData;
  int currentPage = 1;
  int size = 10;
  int totalPages = 0;
  ScrollController _scrollController = ScrollController();
  List<dynamic> hits = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getGalleryData(widget.gallerie);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent &&
          currentPage < totalPages &&
          !isLoading) {
        currentPage++;
        getGalleryData(widget.gallerie);
      }
    });
  }

  void getGalleryData(String gallerie) {
    if (isLoading) return; // Eviter de lancer plusieurs requêtes simultanées

    setState(() {
      isLoading = true; // Indicateur de chargement
    });

    String url =
        "https://pixabay.com/api/?key=15646595-375eb91b3408e352760ee72c8&q=${gallerie}&page=${currentPage}&per_page=${size}";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.galleryData = json.decode(resp.body);
        if (galleryData['hits'] != null) {
          // Ajout des nouveaux résultats à la liste existante
          hits.addAll(galleryData['hits']);
          totalPages = (galleryData['totalHits'] / size).ceil();
        }
        isLoading = false; // Chargement terminé
      });
    }).catchError((err) {
      setState(() {
        isLoading = false;
      });
      print("Erreur: $err");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: totalPages == 0
            ? Text('Pas de résultats')
            : Text("${widget.gallerie}, Page ${currentPage} / ${totalPages}"),
      ),
      body: (galleryData == null && !isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
          controller: _scrollController,
          itemCount: hits.length + (isLoading ? 1 : 0), // Ajouter un loader
          itemBuilder: (context, index) {
            if (index == hits.length) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                // Card pour afficher les tags
                Card(
                  color: Colors.blue,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      hits[index]['tags'],
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // Card pour afficher l'image
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Card(
                    child: Image.network(
                      hits[index]['largeImageURL'], // URL de l'image
                      fit: BoxFit.fitWidth, // Adapter l'image à la largeur
                    ),
                  ),
                ),
              ],
            );
          })),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
