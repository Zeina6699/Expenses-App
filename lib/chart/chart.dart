import 'package:expansess_appp/Models/expense.dart';
import 'package:expansess_appp/chart/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});
   final List<Expense> expenses;

    List<ExpansesBucket> get buckets{
    return [
    ExpansesBucket.forCategory(expenses, Category.food),
    ExpansesBucket.forCategory(expenses, Category.leisure),
    ExpansesBucket.forCategory(expenses, Category.travel),
    ExpansesBucket.forCategory(expenses, Category.work)
    ];
   }

   get MaxTotalExpense{
  double maxTotalExpense=0;
 for(var e in buckets){
  if(e.totalExpense>maxTotalExpense){
    maxTotalExpense=e.totalExpense;
  }
 }
   return maxTotalExpense;

   }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode=MediaQuery.of(context).platformBrightness==Brightness.dark;
   
    return Container(
      margin:EdgeInsets.all(16),
      padding:EdgeInsets.symmetric(horizontal: 8,vertical: 16),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
          Theme.of(context).colorScheme.primary.withOpacity(0.3),
          Theme.of(context).colorScheme.primary.withOpacity(0.0)

        ])
      ),
      child: Column(
        children: [
        Expanded(
          child: Row(
            crossAxisAlignment:CrossAxisAlignment.end,

            children: [
            for(final e in buckets) ChartBar(fill:e.totalExpense==0?0:e.totalExpense/MaxTotalExpense)
          ],),
        ),
      const  SizedBox(height: 12,),
        Row(
          children:buckets.map((e)=>Expanded(child: 
        Padding(
        child: Icon(categoryIcons[e.category],
        color:isDarkMode? Theme.of(context).colorScheme.primary
        :Theme.of(context).colorScheme.primary.withOpacity(0.7)
        ),
          padding:const  EdgeInsets.symmetric(horizontal: 4) ))).toList(),
        
        )
        ],
        
      ),
    );
  }
}