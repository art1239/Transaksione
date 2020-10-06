import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './models/Transaksion.dart';

import 'ChartPie.dart';
import 'models/Transaksion.dart';

class Chart extends StatelessWidget {
  final List<Transaksion> tran;
  static List<String> dayOfWeeks = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  final Map<String, double> transaksione = {};
  Chart(this.tran) {
    fillTrans();
  }

  void fillTrans() {
    for (String k in dayOfWeeks) {
      transaksione.putIfAbsent(k, () => 0.0);
    }
    for (Transaksion tr in tran) {
      String key = DateFormat('EEEE').format(tr.date);
      if (transaksione[key] == 0.0) {
        transaksione[key] = tr.amount;
      } else {
        transaksione[key] += tr.amount;
      }
    }
  }

  double get getSum {
    var res = tran.fold(0.0, (initial, element) => initial + element.amount);

    return res == 0 ? 1 : res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...transaksione.entries
              .map((e) => Flexible(
                  fit: FlexFit.tight,
                  child: ChartPie(e.key, e.value, e.value / getSum)))
              .toList(),
        ],
      ),
    );
  }
}
