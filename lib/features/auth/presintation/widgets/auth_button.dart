import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color1;
  final Color color2;

  const AuthButton(
      {super.key, required this.onPressed, required this.text, required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          color1,
          color2,
        ], begin: Alignment.bottomLeft,
            end: Alignment.topRight),
        borderRadius: BorderRadius.circular(11)
    ),
      child: ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(370, 60),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent
        )
        , child: Text(text, style: TextStyle(fontSize: 19,
            fontWeight: FontWeight.w600),),),
    );
  }
}
