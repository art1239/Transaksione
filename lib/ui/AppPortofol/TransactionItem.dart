import 'package:flutter/material.dart';
import 'package:flutter_app/ui/AppPortofol/models/Transaksion.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaksion transactions;
  final Function removeData;
  TransactionItem(this.transactions, this.removeData);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: FittedBox(
                  child: Text(
                    '\$${transactions.amount.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    transactions.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat('yyyy/dd/MM').format(transactions.date),
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 5,
              fit: FlexFit.loose,
              child: Container(
                child: Dismissible(
                  key: UniqueKey(),
                  child: Icon(Icons.backspace),
                  onDismissed: (_) {
                    removeData(transactions);
                  },
                  background: Container(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
