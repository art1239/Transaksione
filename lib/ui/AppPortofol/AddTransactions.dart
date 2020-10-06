import 'package:flutter/material.dart';

import 'Chart.dart';

class AddTransaction extends StatefulWidget {
  final Function _addTransaction;
  AddTransaction(this._addTransaction);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = new TextEditingController();

  final amountController = new TextEditingController();

  String selected = 'Monday';
  void submittData() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    final date = selected;
    if (title != '' && amount >= 0 && amount.toString() != '') {
      print('hey');
      widget._addTransaction(
          titleController.text, double.parse(amountController.text), date);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submittData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                controller: amountController,
                onSubmitted: (_) => submittData(),
              ),
              Container(
                height: 70,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton<String>(
                        items: Chart.dayOfWeeks.map((String e) {
                          return DropdownMenuItem<String>(
                            value: e.toString(),
                            child: Text(e.toString()),
                          );
                        }).toList(),
                        onChanged: (String newVal) {
                          setState(() {
                            this.selected = newVal;
                          });
                        },
                        value: this.selected,
                      ),
                      FlatButton(
                          color: Colors.red,
                          onPressed: submittData,
                          child: Text(
                            'Add a transaction',
                            style: TextStyle(color: Colors.white),
                          ))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
