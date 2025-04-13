import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dateFormat = DateFormat.yMd();
enum Category {food, skinCare , travel, work}
const categoryIcons = {
Category.food : Icons.lunch_dining,
  Category.travel : Icons.flight_takeoff,
  Category.skinCare : Icons.production_quantity_limits,
  Category.work : Icons.work,

};
class Expense{
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String get formattedDate {
    return dateFormat.format(date);
  }
  Expense({
   required this.title,
    required this.amount,
    required this.category,
    required this.date
}): id = uuid.v4();
}
