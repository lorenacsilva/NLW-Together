import 'package:counter_app/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
//  var _isAuthenticated = false; //_ usado para variável ser privada
  userModel? _user;

  userModel get user =>
      _user!; //Instância única do usuário //! só chama depois que estiver logado(se não estiver null)

  void setUser(BuildContext context, userModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      Navigator.pushReplacementNamed(context, "/home");
    } else
      Navigator.pushReplacementNamed(context, "/login");
  }

  Future<void> saveUser(userModel user) async {
    final instance = await SharedPreferences.getInstance();
    instance.setString("user", user.toJSon());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (instance.containsKey("user")) {
      final json = await instance.get("user") as String;
      setUser(context, userModel.fromJson(json));
      return;
    } else {
      setUser(context, null);
    }
  }
}
