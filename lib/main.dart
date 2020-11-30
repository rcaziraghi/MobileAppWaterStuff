import 'package:flutter/material.dart';
import 'package:atividadeb/telas/home.dart';
import 'package:atividadeb/telas/login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'landing.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      routes: {
        '/': (context) => Landing(),
        '/login': (context) => Login(),
        '/home': (context) => MyHomePage(title: 'Waterstuff'),
      },
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
    );
  }
}
