import 'dart:developer';

import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amoutController = TextEditingController();

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
          TextField(
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
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    log(_titleController.text);
                    log(_amoutController.text);
                  },
                  child: Text(
                    'Save expense',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )),
              SizedBox(width: 10,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
