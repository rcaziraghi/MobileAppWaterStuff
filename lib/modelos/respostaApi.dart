class RespostaApi {
  // _data will hold any response converted into
  // its own object. For example user.
  Object _data;
  // _apiError will hold the error object
  Object _erroApi;

  Object get Data => _data;
  set Data(Object data) => _data = data;

  Object get ErroApi => _erroApi as Object;
  set ErroApi(Object error) => _erroApi = error;
}
