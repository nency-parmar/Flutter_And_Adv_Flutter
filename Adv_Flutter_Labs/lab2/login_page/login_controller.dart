import 'package:advance_flutter_lab/utils/import_export.dart';
class LoginController{

  LoginModel _loginModel = LoginModel();

  String? validateName(value) => _loginModel.validateName(value);

  addUser(user) => _loginModel.addUser(user);
  List<dynamic> getUserList() => _loginModel.getUser();

  String? validateEmail(value) => _loginModel.validateEmail(value);
  String? validateNumber(value) => _loginModel.validateNumber(value);
  String? validatePassword(value) => _loginModel.validatePassword(value);
  String? validateConfrimPassword(value,pass) => _loginModel.validateConfrimPassword(value, pass);
}