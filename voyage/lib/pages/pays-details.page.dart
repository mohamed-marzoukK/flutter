import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PaysDetailsPage extends StatefulWidget {
  final String ville;

  PaysDetailsPage(this.ville);

  @override
  State<PaysDetailsPage> createState() => _PaysDetailsPageState();
}

class _PaysDetailsPageState extends State<PaysDetailsPage> {
  Map<String, dynamic>? paysData;
  void initState() {
    super.initState();
    getPaysData(widget.ville);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Pays Details ${widget.ville}')),
      body: paysData == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  paysData!['flags']['png'],
                  width: 200,
                  height: 100,
                ),
              ),
              SizedBox(height: 10),
              Text(
                paysData!['name'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                paysData!['nativeName'] ?? '',
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
              SizedBox(height: 20),
              _style('Administration'),
              Text('Capitale: ${paysData!['capital']}'),
              Text('Langue(s): ${paysData!['languages'].map((lang) => lang['nativeName']).join(', ')}'),
              SizedBox(height: 20),
              _style('Géographie'),
              Text('Région: ${paysData!['region']}'),
              Text('Superficie: ${paysData!['area']} km²'),
              Text('Fuseau Horaire: ${paysData!['timezones'][0]}'),
              SizedBox(height: 20),
              _style('Démographie'),
              Text('Population: ${paysData!['population']}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _style(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
    );
  }

  Future<void> getPaysData(String ville) async {
    final url = 'https://restcountries.com/v2/name/$ville';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          paysData = json.decode(utf8.decode(response.bodyBytes))[0];
        });
      } else {
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

