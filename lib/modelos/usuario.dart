class Usuario {
  /*
{
   "id": 6,
   "email": "teste6@ftec.com.br",
   "nomeCompleto": "Teste",
   "cidade": null,
   "siglaEstado": null,
   "cargos":    [
      "USUARIO",
      "MODERADOR",
      "ADMIN"
   ],
   "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNjA2Njg3NDg4LCJleHAiOjE2MDY3NzM4ODh9.DHfJc99X18wiqXUKJT_o-XzLVgXg6AEvmUOhEelbVDo"
}
  */
  String _id;
  String _email;
  String _nomeCompleto;
  String _cidade;
  String _siglaEstado;
  List<dynamic> _cargos;
  String _accessToken;

  constructorUsuario(
      {String id,
      String email,
      String nomeCompleto,
      String cidade,
      String siglaEstado,
      List<dynamic> cargos,
      String accessToken}) {
    this._id = id;
    this._email = email;
    this._nomeCompleto = nomeCompleto;
    this._cidade = cidade;
    this._siglaEstado = siglaEstado;
    this._cargos = cargos;
    this._accessToken = accessToken;
  }

  // Properties
  String get id => _id;
  set id(String id) => _id = id;

  String get email => _email;
  set email(String email) => _email = email;

  String get nomeCompleto => _nomeCompleto;
  set nomeCompleto(String nomeCompleto) => _nomeCompleto = nomeCompleto;

  String get cidade => _cidade;
  set cidade(String cidade) => _cidade = cidade;

  String get siglaEstado => _siglaEstado;
  set siglaEstado(String siglaEstado) => _siglaEstado = siglaEstado;

  List<dynamic> get cargos => _cargos;
  set cargos(List<dynamic> cargos) => _cargos = cargos;

  String get accessToken => _accessToken;
  set accessToken(String accessToken) => _accessToken = accessToken;

  // create the user object from json input
  Usuario.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _email = json['email'];
    _nomeCompleto = json['nomeCompleto'];
    _cidade = json['cidade'];
    _siglaEstado = json['siglaEstado'];
    _cargos = json['cargos'];
    _accessToken = json['accessToken'];
  }

  // exports to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['email'] = this._email;
    data['nomeCompleto'] = this._nomeCompleto;
    data['cidade'] = this._cidade;
    data['siglaEstado'] = this._siglaEstado;
    data['cargos'] = this._cargos;
    data['accessToken'] = this._accessToken;
    return data;
  }
}
