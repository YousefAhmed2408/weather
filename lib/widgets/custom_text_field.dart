import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget{

  TextEditingController controller=TextEditingController();
  TextInputType textInputType;
  Icon suffixIcon;
  String label;
  bool obscureText;

  CustomTextFormField({required  this.textInputType,required  this.controller,required  this.label ,required  this.suffixIcon,this.obscureText=false});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter This field';
        }
        // if(label.trim().toLowerCase()=="password"&&value.length < 8){
        //   return 'Password must be at least 8 characters';
        // }
        return null;
      },
      decoration: InputDecoration(
          suffixIcon:suffixIcon,
          label: Text(label),
          border: OutlineInputBorder()
      ),
    );
  }
}

