import 'package:expansess_appp/Models/expense.dart';
import 'package:flutter/material.dart';

class CustomDropDownBottom extends StatefulWidget {
 CustomDropDownBottom({super.key, required this.selectedCategory});
 Category selectedCategory;

  @override
  State<CustomDropDownBottom> createState() => _CustomDropDownBottomState();
}

class _CustomDropDownBottomState extends State<CustomDropDownBottom> {
  @override
  Widget build(BuildContext context) {
     return DropdownButton(
                dropdownColor: Colors.grey,
                value: widget.selectedCategory,
                items:Category.values.map((e)=>DropdownMenuItem(value: e, child: Text(e.name.toUpperCase()))).toList(),
                onChanged:(newCat){
                if(newCat==null){return;}
                setState(() {
                widget.selectedCategory=newCat; 
                });
                });
  }
}