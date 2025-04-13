import 'package:flutter/material.dart';
import 'package:xpenso_app/widgets/new_expense.dart';

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
      appBar: AppBar(
        title: Center(child: Text('Expenses')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ExpensesList(expenses: expenses),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(30)),
        child: IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context, builder: (c) => NewExpense());
            },
            icon: Icon(
              Icons.add,
              size: 30,
              color: Colors.grey.shade300,
            )),
      ),
    );
  }
}
