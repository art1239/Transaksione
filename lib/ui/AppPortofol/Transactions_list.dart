import 'package:flutter/material.dart';
import '../AppPortofol/models/Transaksion.dart';

import 'TransactionItem.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaksion> transactions;
  final Function removeData;
  TransactionsList({this.transactions, this.removeData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Column(children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  height: 200,
                  fit: BoxFit.cover,
                ),
              )
            ])
          : ListView.builder(
              itemBuilder: (context, index) {
                return TransactionItem(transactions[index], removeData);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
