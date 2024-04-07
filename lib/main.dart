import 'package:flutter/material.dart';
import 'accueil.dart';
import 'ajoutAnnonce.dart';
import 'profil.dart';
import 'login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://bghelhpycpjtvnsrgssz.supabase.co/',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJnaGVsaHB5Y3BqdHZuc3Jnc3N6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTIwMzk2MTksImV4cCI6MjAyNzYxNTYxOX0.dfB8QC6fxBlffzCvW0c-jwwMe317Xxh3399LW-QEIyI',
  );
  runApp(MyApp());
}

final client = Supabase.instance.client;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Allo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoggedIn = false;
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    AccueilPage(),
    AjoutAnnonce(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Allo'),
      ),
      body: Center(
        child: _isLoggedIn ? _widgetOptions.elementAt(_selectedIndex) : LoginPage(),
      ),
      bottomNavigationBar: Visibility(
        visible: _isLoggedIn,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Ajouter Annonce',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }

  void _handleRegistrationSuccess() {
    setState(() {
      _isLoggedIn = true;
    });
  }
}
