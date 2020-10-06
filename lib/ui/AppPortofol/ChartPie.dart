import 'package:flutter/material.dart';

class ChartPie extends StatelessWidget {
  final String text;
  final double amount;
  final double percentage;
  ChartPie(this.text, this.amount, this.percentage);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (cntx, constrain) {
        return Column(children: [
          Container(
              width: 43,
              height: constrain.maxHeight * 0.15,
              child: FittedBox(child: Text('\$${amount.toStringAsFixed(0)}'))),
          Container(
            height: constrain.maxHeight * 0.6,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Color.fromRGBO(220, 220, 220, 1)),
                ),
                FractionallySizedBox(
                  alignment: Alignment.topCenter,
                  heightFactor: percentage,
                  child: Container(
                    height: constrain.maxHeight * 0.2,
                    decoration: BoxDecoration(
                      color: Color(0XFFECFF0B),
                    ),
                  ),
                ),
              ],
            ),

            width: 25,
            padding: EdgeInsets.all(5),
            //margin: EdgeInsets.symmetric(vertical: 5),
          ),
          Text('${text.substring(0, 2)}'),
        ]);
      },
    );
  }
}
