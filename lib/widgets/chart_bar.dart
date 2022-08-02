import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOftotal;
  ChartBar(this.label, this.spendingAmount, this.spendingPctOftotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child:
              FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
          height: 20,
        ),
        const SizedBox(
          height: 4,
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: 60,
          width: 10,
          child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10)),
            ),
            FractionallySizedBox(
              heightFactor: spendingPctOftotal,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
