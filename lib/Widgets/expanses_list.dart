import 'package:expansess_appp/Models/expense.dart';
import 'package:expansess_appp/Widgets/expanses_item.dart';
import 'package:flutter/material.dart';

class expanceListView extends StatelessWidget {
  const expanceListView({
    super.key,
    required this.expenseList,
  });

  final List<Expense> expenseList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:expenseList.length,
      itemBuilder:(context,index){
      return ExpansesItem(expenseList[index]);
    });
  }
}