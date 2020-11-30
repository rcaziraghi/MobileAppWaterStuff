import 'package:flutter/material.dart';
import 'package:atividadeb/modelos/usuario.dart';
import 'package:atividadeb/modelos/erroApi.dart';
// import 'package:atividadeb/modelos/respostaApi.dart';
import 'package:atividadeb/servicos/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key, this.titulo}) : super(key: key);
  final String titulo;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    String _email;
    String _senha;
    final _formKey = GlobalKey<FormState>();

    void _handleSubmitted() async {
      final FormState form = _formKey.currentState;
      if (!form.validate()) {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text('Favor verificar os erros.')));
      } else {
        form.save();
        var _respostaApi = await login(_email, _senha);
        if ((_respostaApi.ErroApi as ErroApi) == null) {
          // _salvarERedirecionarParaHome();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("email", (_respostaApi.Data as Usuario).email);
          Navigator.pushNamedAndRemoveUntil(
              context, '/home', ModalRoute.withName('/home'),
              arguments: (_respostaApi.Data as Usuario));
        } else {
          Scaffold.of(context).showSnackBar(new SnackBar(
              content: new Text(((_respostaApi.ErroApi as ErroApi).erro))));
        }
      }
    }

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          key: Key("_email"),
                          decoration: InputDecoration(labelText: "Email"),
                          keyboardType: TextInputType.text,
                          onSaved: (String value) {
                            _email = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preencher email';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Senha"),
                          obscureText: true,
                          onSaved: (String value) {
                            _senha = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preencher senha';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        ButtonBar(
                          children: <Widget>[
                            RaisedButton.icon(
                                onPressed: _handleSubmitted,
                                icon: Icon(Icons.arrow_forward),
                                label: Text('Logar')),
                          ],
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }
}
