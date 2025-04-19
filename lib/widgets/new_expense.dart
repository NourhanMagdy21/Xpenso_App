import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xpenso_app/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amoutController = TextEditingController();
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
                label: Text(
              'Title',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amoutController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
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
              SizedBox(
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
                        icon: Icon(Icons.calendar_month_sharp)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
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
                      if(newCat == null) {
                        return;
                      }
                      _selectedCategory = newCat;
                    });
                  }),
              Spacer(),

              ElevatedButton(
                  onPressed: () {
                    log(_titleController.text);
                    log(_amoutController.text);
                  },
                  child: Text(
                    'Save expense',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
