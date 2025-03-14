import 'package:expansess_appp/Models/expense.dart';
import 'package:flutter/material.dart';

class ExpansesItem extends StatelessWidget {
  const ExpansesItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title,style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20,),
            Row(children: [
              Text('\$${expense.amount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(children: [
                Icon(categoryIcons[expense.category]),
              const SizedBox(width: 10,),
                Text(expense.formattedDate)
              
              
              ],
              
              
              )
            ],)
          ],
        ),
      ),
    );
  }
}