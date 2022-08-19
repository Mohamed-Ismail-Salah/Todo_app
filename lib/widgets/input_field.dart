import 'package:flutter/material.dart';

class InputField extends StatelessWidget{
  String hint;
  Widget sufIcon;
  final TextEditingController?Controller;


  InputField({ required this.hint,required this.sufIcon, this.Controller}) ;

  @override

  Widget build(BuildContext context) {

    return TextField(
      controller:Controller,
        decoration: InputDecoration(
        labelText: hint,

            suffixIcon:sufIcon ,
        enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.deepPurple,),
    borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(width: 2, color: Colors.red),
    borderRadius: BorderRadius.circular(15),
    ))

    );

  }


}