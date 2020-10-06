import 'package:flutter/material.dart';

class Prova extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 400,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  color: Colors.black,
                  height: 50,
                  child: Text('h'),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  height: 50,
                  color: Colors.green,
                  child: Text('hey'),
                ),
              ),
              Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    height: 50,
                    color: Colors.red,
                    child: Text('hey you'),
                  )),
            ],
          )),
    );
  }
}
