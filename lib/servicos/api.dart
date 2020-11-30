import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:atividadeb/modelos/erroApi.dart';
import 'package:atividadeb/modelos/respostaApi.dart';
import 'package:atividadeb/modelos/usuario.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String _api = DotEnv().env['REACT_APP_API_URL_AUTH'];

Future<RespostaApi> login(String email, String senha) async {
  RespostaApi _respostaApi = new RespostaApi();

  try {
    final response = await http.post('${_api}login', body: {
      'email': email,
      'senha': senha,
    });

    switch (response.statusCode) {
      case 200:
        _respostaApi.Data = Usuario.fromJson(json.decode(response.body));
        break;
      case 401:
        _respostaApi.ErroApi = ErroApi.fromJson(json.decode(response.body));
        break;
      default:
        _respostaApi.ErroApi = ErroApi.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    _respostaApi.ErroApi = ErroApi(erro: "Erro. Favor tentar novamente.");
  }
  return _respostaApi;
}
