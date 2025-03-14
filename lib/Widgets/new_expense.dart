

import 'package:expansess_appp/Models/expense.dart';
import 'package:expansess_appp/Widgets/custom_drop_down_bottom.dart';
import 'package:expansess_appp/Widgets/custom_alert_dialog.dart';
import 'package:expansess_appp/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}



class _NewExpenseState extends State<NewExpense> {

/*  var title='';
  void saveTitle(String inputValue){ setState(() {
    title=inputValue;
  }); }*/
 final TextEditingController titleController=TextEditingController();
 final TextEditingController amountController=TextEditingController();
 DateTime? selectedDate;
 Category selectedCategory=Category.travel;
 final formatter=DateFormat().add_yMd();

 @override
  void dispose(){super.dispose();     
  titleController.dispose();
  amountController.dispose();
  
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(height:300,width:double.infinity,
   child:  Padding(
     padding: const EdgeInsets.symmetric(vertical: 22,horizontal: 15),
     child: SingleChildScrollView(
       child: Column(children: [
         CustomTextField(controller: titleController,title: 'title',maxLength: 50,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
          child:  CustomTextField(controller: amountController,title: 'amount',type: TextInputType.number,prefixText: '\$',),
                ), 
                
               const  SizedBox(width: 30,),
                  Row(
                 
                     children: [
                      Text(selectedDate==null?'No Date Selected':formatter.format(selectedDate!) ),
                       IconButton(onPressed: ()async{
                        final now=DateTime.now();
                        final firstDate=DateTime(now.year-1,now.month,now.day);
                        final DateTime? pickedDate =await  showDatePicker(context: context, firstDate: firstDate, lastDate: now);
                        setState(() {
                          selectedDate=pickedDate;
                        });
                     
                        //.then((value)=>print(value.toString())
                      
                       }, icon:const Icon( Icons.calendar_month))
                    
                  ],
                ),
           ]    )
            ,
       
      Padding(
            padding:const  EdgeInsets.all(8.0),
            child: Row(children: [
              CustomDropDownBottom(selectedCategory: selectedCategory)
                ,const Spacer(),
                     ElevatedButton( onPressed: (){Navigator.pop(context);}, child:const Text('Cancel'))
                    ,ElevatedButton(onPressed: (){
                     final double? enteredAmount=double.tryParse(amountController.text);
                     final bool amountIsInvalid =enteredAmount==null||enteredAmount<=0;
                   if(selectedDate==null||amountIsInvalid){
                showDialog(context: context, builder:(context){
                  return const customAlertDialog();
                });
                   }else{
                    setState(() {
  widget.onAddExpense(Expense(category:selectedCategory, title: titleController.text, amount:enteredAmount, date: selectedDate!));
    
                    });
                  Navigator.of(context).pop();}
   } ,child:const Text('Save Expense'))],),
          )
        ],),
     ),
   ));
  }
}

