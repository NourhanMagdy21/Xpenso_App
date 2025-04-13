import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Card(
        child: Column(
          children: [
            Text(expense.title, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
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
