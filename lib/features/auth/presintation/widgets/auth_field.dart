import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller ;
  final bool isPassword;
  const AuthField({super.key,this.isPassword = false, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      obscureText:  isPassword,

      validator: (value) {
        if(value!.isEmpty){
          return "$hintText is missing";
        }
        else {
          return null;
        }
      },
    ) ;
  }
}
