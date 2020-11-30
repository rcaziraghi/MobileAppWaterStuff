import 'package:atividadeb/modelos/respostaApi.dart';
import 'package:flutter/material.dart';
import 'package:atividadeb/modelos/respostaApi.dart';
import 'package:atividadeb/servicos/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modelos/erroApi.dart';
import 'modelos/usuario.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  String _userId = "";

  @override
  void initState() {
    super.initState();
    _carregaInfoUsuario();
  }

  _carregaInfoUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userId = (prefs.getString('userId') ?? "");
    if (_userId == "") {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login', ModalRoute.withName('/login'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
