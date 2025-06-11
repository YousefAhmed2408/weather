import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rand/Models/User_model.dart';
import 'package:rand/Services/User_services.dart';
class userProvider with ChangeNotifier {
  UserModel ?userModel;

  login(String email, String pass) async {
    userModel = await UserService.login(email, pass);
    notifyListeners();
  }

  Signup(String name, email, phone, pass) async {
    userModel = await UserService.signUp(name, email, phone, pass);
    notifyListeners();
  }
}