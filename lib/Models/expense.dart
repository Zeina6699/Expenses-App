import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
const uuid =Uuid();

enum Category {food,travel,leisure,work}
final dateTime=DateFormat.yMd();


const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};


class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate{return dateTime.format(date);}

  Expense({required this.category,required this.title, required this.amount, required this.date}):id=uuid.v4();
}

