import 'package:flutter/material.dart';
import 'package:xpenso_app/widgets/chart/chat_bar.dart';
import '../../models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket(Category.food, expenses),
      ExpenseBucket(Category.work, expenses),
      ExpenseBucket(Category.skinCare, expenses),
      ExpenseBucket(Category.travel, expenses),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;
    for (var element in buckets) {
      if (element.totalExpenses > maxTotalExpense) {
        maxTotalExpense = element.totalExpenses;
      }
    }
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: double.infinity,
      height: 175,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.3),
              Theme.of(context).colorScheme.primary.withOpacity(0.0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final ele in buckets)
                  ChartBar(
                    fill: ele.totalExpenses == 0 ? 0 :
                         ele.totalExpenses / maxTotalExpense,
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: buckets
                .map(
                  (e) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      child: Icon(categoryIcons[e.category],
                      color: isDarkMode?
                      Theme.of(context).colorScheme.primary :
                      Theme.of(context).colorScheme.primary.withOpacity(0.9),),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
