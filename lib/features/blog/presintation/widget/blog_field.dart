import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const BlogField({super.key, required this.controller, required this.hintText, });

  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: controller,decoration: InputDecoration(
      hintText: hintText
    ),maxLines: 2,
      validator: (value){
      if(value!.isEmpty){
        return'$hintText is missing';
      }
      return null;
      },
    );
  }
}
