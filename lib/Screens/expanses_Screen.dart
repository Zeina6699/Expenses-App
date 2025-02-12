import 'package:expansess_appp/Models/expense.dart';
import 'package:expansess_appp/Widgets/expanses_list.dart';
import 'package:expansess_appp/Widgets/new_expense.dart';
import 'package:expansess_appp/chart/chart.dart';
import 'package:flutter/material.dart';

class Expanses extends StatefulWidget {
 const Expanses({super.key});


  @override
  State<Expanses> createState() => _ExpansesState();
}

class _ExpansesState extends State<Expanses> {
final List<Expense> expenseList=[
Expense(category: Category.work, title:'Flutter course', amount:29.9, date: DateTime.now()),
Expense(category: Category.food, title:'Breakfast', amount:31.3, date: DateTime.now()),
Expense(category: Category.leisure, title:'Cinema', amount:9.71, date: DateTime.now())
];

void addExpense(Expense expense){
 setState(() {
     expenseList.add(expense);
 });}

 void removeExpense(Expense expense){
 setState(() {
     expenseList.remove(expense);
 });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Flutter Exprnse Trucker'),centerTitle: true,
      actions: [IconButton(onPressed:(){
                    showModalBottomSheet (context: context, builder:(context){
      return NewExpense(onAddExpense: addExpense,);
});

      }, icon:const Icon(Icons.add)) ],
      ),
      body:Column(
        children: [
           Expanded(child: Chart(expenses: expenseList,)),
          Expanded(child: expanceListView(expenseList: expenseList, onRemoveExpense: (Expense expense) {  },)),
          
            // SingleChildScrollView(
           //   child: Column(
             //   children: [
            //   ...expenseList.map((e)=>Text(e.title)
           //   )],
              
        ],
      ),
        );
   
  }
}



