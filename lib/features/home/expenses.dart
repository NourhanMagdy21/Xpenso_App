import 'package:flutter/material.dart';

import '../../models/expense.dart';
import '../../widgets/expenses_list/expenses_list.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> expenses = [
    Expense(
        title: 'SkinCare',
        amount: 200,
        category: Category.skinCare,
        date: DateTime.now()),
    Expense(
        title: 'Pasta',
        amount: 150,
        category: Category.food,
        date: DateTime.now()),
    Expense(
        title: 'USA',
        amount: 1500,
        category: Category.travel,
        date: DateTime.now()),
    Expense(
        title: 'fun',
        amount: 800,
        category: Category.work,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Expenses')),),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ExpensesList(expenses: expenses),
          )
        ],
      ),
    ));
  }
}


