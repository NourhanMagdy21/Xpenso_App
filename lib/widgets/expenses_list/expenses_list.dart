import 'package:flutter/material.dart';
import 'package:xpenso_app/widgets/expenses_list/expenses_item.dart';
import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
  }) ;

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => ExpensesItem(expense: expenses[index]));
  }
}