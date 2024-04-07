import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AjoutAnnonce extends StatefulWidget {
  @override
  _AjoutAnnonceState createState() => _AjoutAnnonceState();
}

class _AjoutAnnonceState extends State<AjoutAnnonce> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _imageFichier;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFichier = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final client = Supabase.instance.client;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une annonce'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (_imageFichier != null) ...[
              Image.file(_imageFichier!),
              SizedBox(height: 20.0),
            ],
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Choisir une photo'),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _nomController,
              decoration: InputDecoration(
                labelText: 'Nom de l\'annonce',
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description de l\'annonce',
              ),
              maxLines: null,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String nom = _nomController.text;
                String description = _descriptionController.text;
                print('Nom: $nom, Description: $description');
                Navigator.pop(context);
              },
              child: Text('Ajouter l\'annonce'),
            ),
          ],
        ),
      ),
    );
  }
}
