import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rand/Models/User_model.dart';
import 'package:rand/Providers/User_provider.dart';
import 'package:rand/Screens/Homme.dart';
import 'package:rand/Screens/Sign_UpPage.dart';
import 'package:rand/Widgets/Custom%20Text.dart';

class Loginpage extends StatelessWidget {

  TextEditingController emailcon=TextEditingController();
  TextEditingController Passcon=TextEditingController();
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
   Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
  var userproviderobject=
  Provider.of<userProvider>(context,listen: false );
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.deepPurple,
      title: Text("Login",style: TextStyle(color: Colors.white),),
      centerTitle: true,
      leading: Icon(Icons.menu),
    ),
    body: Padding(padding: const EdgeInsets.all(20.0),
    child: Form(
      key: formkey,
      child: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: 100,
            ),
            textform(controller: emailcon, label: "Email",  suffixIcon: Icon(Icons.email), obsecure: false),
            SizedBox(height: 10,),
            textform(controller: Passcon, label: "password",  suffixIcon: Icon(Icons.password), obsecure: true),
            SizedBox(height: 10,),
            TextButton(onPressed: ()async{
              if(formkey.currentState!.validate()) {
                await userproviderobject.login(emailcon.text, Passcon.text);
                var st = userproviderobject.userModel?.status;
                if (st == true) {
                  showModalBottomSheet(context: context, builder: (context) {
                    return Padding(
                      padding: EdgeInsets.all(50),
                      child: Text("done"),
                    );
                  });
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Homme()));
                }
                else {
                  showModalBottomSheet(context: context, builder: (context) {
                    return Padding(padding: EdgeInsets.all(50),
                      child: Text("error"),
                    );
                  });
                }
              }
            },
              child: Text("Login"),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("don`t have acc"),
                SizedBox(width: 15,),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUppage()));
                },child: Text("Signup"),
              ),
              ],
            ),



          ],
        ),
      ),
    ),
    ),
  );
  }
}
