import 'package:flutter/material.dart';
import 'package:flutter_app/ui/AppPortofol/Transactions_list.dart';
import 'package:intl/intl.dart';

import '../AppPortofol/AddTransactions.dart';

import 'Chart.dart';
import 'models/Transaksion.dart';

class Portofol extends StatefulWidget {
  @override
  _PortofolState createState() => _PortofolState();
}

class _PortofolState extends State<Portofol> {
  final List<Transaksion> transaksione = [];

  void _addNewTransaksion(String title, double amount, String date) {
    final newTs = new Transaksion(
        title: title,
        amount: amount,
        date: getdateOfTransaction(date),
        id: DateTime.now().toString());
    setState(() {
      transaksione.add(newTs);
    });
  }

  void removeData(Transaksion t) {
    setState(() {
      transaksione.remove(t);
    });
  }

  showTheDialogBox(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return AddTransaction(_addNewTransaksion);
        });
  }

  DateTime getdateOfTransaction(String dayOfWeek) {
    int i = DateTime.now().weekday;

    while (true) {
      DateTime correctDay = DateTime.now().add(Duration(days: i));
      if (DateFormat('EEEE').format(correctDay) == dayOfWeek) {
        return correctDay;
      }
      i = (i + 1) % 7;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bar = AppBar(
      title: Text('Portofilio'),
      actions: [
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showTheDialogBox(context);
            })
      ],
    );
    return Scaffold(
      appBar: bar,
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    bar.preferredSize.height) *
                0.3,
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 5.9,
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Chart(this.transaksione),
              ),
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    bar.preferredSize.height) *
                0.7,
            child: TransactionsList(
                transactions: this.transaksione, removeData: removeData),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showTheDialogBox(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
