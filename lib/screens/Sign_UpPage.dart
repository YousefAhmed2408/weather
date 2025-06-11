import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rand/Providers/User_provider.dart';
import 'package:rand/Screens/LoginPage.dart';
import 'package:rand/Widgets/Custom%20Text.dart';

class SignUppage extends StatelessWidget {
  TextEditingController emailCon=TextEditingController();
  TextEditingController passcon=TextEditingController();
  TextEditingController phonecon=TextEditingController();
  TextEditingController namecon=TextEditingController();
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
   SignUppage({super.key});
  @override
  Widget build(BuildContext context) {
    var userprovideobject=Provider.of<userProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: Icon(Icons.menu),
      ),
       body: Padding(padding: EdgeInsets.all(20.0),
       child: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              textform(controller: namecon, label: "Name", obsecure: false, suffixIcon: Icon(Icons.person)),
              SizedBox(height: 20,),
              textform(controller: phonecon, label: "Phone", obsecure: false, suffixIcon: Icon(Icons.phone)),
              SizedBox(height: 20,),
              textform(controller: emailCon, label: 'email', obsecure: false, suffixIcon: Icon(Icons.email)),
              SizedBox(height: 20,),
              textform(controller: passcon, label: "Password", obsecure: true, suffixIcon: Icon(Icons.password)),
              SizedBox(height: 20,),
              TextButton(onPressed: ()async{
                if(formkey.currentState!.validate()){
                  await userprovideobject.Signup(namecon.text, emailCon.text, phonecon.text, passcon.text);
                  var st=userprovideobject.userModel?.status;
                  if(st==true){
                    showModalBottomSheet(context: context, builder: (context){
                      return Padding(padding: EdgeInsets.all(20),
                        child: Text("done"),
                      );
                    });
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Loginpage()));
                  }
                  else{
                    showModalBottomSheet(context: context, builder: (context){
                      return Padding(padding: EdgeInsets.all(20),
                      child: Text("error"),
                      );
                    });
                  }
                }
              },child: Text("signUp"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("have acc?"),
                   SizedBox(width: 2,),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage(),));
                  },
                    child: Text("login"),
                  )
                ],
              )
            ],
          ),
        )
        ),
      )
    );
  }
}
