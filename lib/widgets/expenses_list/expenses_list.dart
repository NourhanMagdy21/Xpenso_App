import 'package:flutter/material.dart';
import 'package:xpenso_app/widgets/expenses_list/expenses_item.dart';
import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses, required this.onRemoveExpense,
  }) ;
  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(

background: Container(
  color: Theme.of(context).colorScheme.error.withOpacity(0.7),
  margin: Theme.of(context).cardTheme.margin,
),
          onDismissed: (direction)=>onRemoveExpense(expenses[index]) ,
            key: ValueKey(expenses[index]),
            child: ExpensesItem(
                expense: expenses[index])));
  }
}