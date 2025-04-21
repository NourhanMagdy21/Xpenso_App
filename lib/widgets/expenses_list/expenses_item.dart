import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('${expense.amount.toString()}\$'),
                  Spacer(),
                  Row(children: [
                    Icon(categoryIcons[expense.category]),
                    SizedBox(width: 8,),
                    Text(expense.formattedDate),
                  ],)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
