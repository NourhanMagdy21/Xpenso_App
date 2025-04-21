import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xpenso_app/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  final formatter = DateFormat.yMd();
  Category _selectedCategory = Category.skinCare;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                maxLength: 50,
                decoration: const InputDecoration(
                    label: Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          prefixText: '\$',
                          label: Text(
                            'Amout',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_selectedDate == null
                            ? 'No selected date'
                            : formatter.format(_selectedDate!)),
                        IconButton(
                            onPressed: () async {
                              final now = DateTime.now();
                              final firstDate =
                                  DateTime(now.year - 1, now.month, now.day);
                              final DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: now,
                                  firstDate: firstDate,
                                  lastDate: now);
                              setState(() {
                                _selectedDate = pickedDate;
                              });
                            },
                            icon: const Icon(Icons.calendar_month_sharp)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                      value: _selectedCategory,
                      items: Category.values
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.name.toUpperCase()),
                            ),
                          )
                          .toList(),
                      onChanged: (newCat) {
                        setState(() {
                          if (newCat == null) {
                            return;
                          }
                          _selectedCategory = newCat;
                        });
                      }),
                  Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        final double? enteredAmount =
                            double.tryParse(_amountController.text);
                        final bool amountInvalid =
                            enteredAmount == null || enteredAmount <= 0;
                        if (_titleController.text.trim().isEmpty ||
                            amountInvalid == null ||
                            _selectedDate == null) {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                    title: const Text('Invalid input'),
                                    content: const Text(
                                        'Please make sure valid title, amount, date and category was entered.'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(ctx);
                                          },
                                          child: const Text(
                                            'Okay',
                                            style: TextStyle(color: Colors.black),
                                          )),
                                    ],
                                  ));
                        } else {
                          widget.onAddExpense(Expense(
                              title: _titleController.text,
                              amount: enteredAmount!,
                              category: _selectedCategory,
                              date: _selectedDate!));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        'Save expense',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
