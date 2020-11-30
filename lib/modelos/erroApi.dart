class ErroApi {
  String _erro;

  ErroApi({String erro}) {
    this._erro = erro;
  }

  String get erro => _erro;
  set erro(String erro) => _erro = erro;

  ErroApi.fromJson(Map<String, dynamic> json) {
    _erro = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this._erro;
    return data;
  }
}
