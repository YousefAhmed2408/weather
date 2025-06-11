import 'package:dio/dio.dart';
import 'package:rand/Models/User_model.dart';
 class UserService{
  static Dio dio=Dio();
  static Future<UserModel>login(String email,String pass)async {
    var url = "https://elsewedyteam.runasp.net/api/Login/CheckUser";
    try {
      Response response = await dio.post(url,
          data: {
            "email": email,
            "password": pass
          }
      );
      if (response.statusCode == 200) {
        return UserModel.Fromjson(response.data);
      }
      else {
        throw Exception("error");
      }
    }
    catch(e){
      throw Exception("error in login$e");
    }
  }
   static Future<UserModel>signUp(String name,String email,String phone,String pass )async {
     var url = "https://elsewedyteam.runasp.net/api/Register/AddUser";
     try {
       Response response = await dio.post(url, data: {
         "email": email,
         "name": name,
         "phone": phone,
         "pass": pass,

       });
       if (response.statusCode == 200) {
         return UserModel.Fromjson(response.data);
       }

       else {
         throw Exception("err");
       }
     }
     catch(e){
       throw Exception("error");
     }
   }

}