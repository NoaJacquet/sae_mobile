import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccueilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Les dernieres annonces'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
              ),

        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AccueilPage(),
  ));
}
