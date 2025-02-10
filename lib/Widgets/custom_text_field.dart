
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
 CustomTextField({
    super.key,
    required this.controller,
     required this.title,
    this.type,
    this.maxLength,
     this.prefixText
  });

  final TextEditingController controller;
  final String title;
  TextInputType? type;
  int? maxLength;
  String? prefixText;
  

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
     // onChanged: saveTitle,
      maxLength: maxLength,
    keyboardType:type ,
      decoration: InputDecoration(
        prefixText:prefixText ,

        border:const OutlineInputBorder(),
        label: Text(title),),
    );
  }
}