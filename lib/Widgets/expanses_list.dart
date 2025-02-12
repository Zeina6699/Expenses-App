import 'package:expansess_appp/Models/expense.dart';
import 'package:expansess_appp/Widgets/expanses_item.dart';
import 'package:flutter/material.dart';

class expanceListView extends StatelessWidget {
  const expanceListView({
    super.key,
    required this.expenseList, required this.onRemoveExpense,
  });

  final List<Expense> expenseList;
    final void Function(Expense expense) onRemoveExpense;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:expenseList.length,
      itemBuilder:(context,index){
      return Dismissible(
        onDismissed: (direction){onRemoveExpense(expenseList[index]);},
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.7),
          margin: Theme.of(context).cardTheme.margin,
          ),
        
        key: ValueKey(expenseList[index]),
        
        child: ExpansesItem(expenseList[index]) );
    });}
  }
