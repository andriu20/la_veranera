import 'dart:async';

String _message = "";
String _codeError = "";
bool _sendcode = false;
String _sedID = "";

set setIdPush(String id) {
  _sedID = id;
}

get getIdPush => _sedID;
set setMesageError(String? message) {
  _message = message!;
}

set setCode(bool? code) {
  _sendcode = code!;
}

get getMessageError => _message;
set setCodeError(String? code) {
  _codeError = code!;
}

get getCodeError => _codeError;
get sentCode => _sendcode;

StreamController<bool> codeSent = StreamController.broadcast();
Stream<bool> get getcodeSent => codeSent.stream;
