import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Usertransaction extends StatefulWidget {
  //Usertransaction({Key key}) : super(key: key);
  final Function adtx;

  Usertransaction(this.adtx);

  @override
  State<Usertransaction> createState() => _UsertransactionState();
}

class _UsertransactionState extends State<Usertransaction> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();
  DateTime _selectedDate;

  void submitted() {
    if (amountcontroller.text.isEmpty) {
      return;
    }
    final enterTitle = titlecontroller.text;
    final enterAmount = double.parse(amountcontroller.text);
    if (enterTitle.isEmpty || enterAmount <= 0 || _selectedDate == null) {
      return;
    } else {
      widget.adtx(
        enterTitle,
        enterAmount,
        _selectedDate,
      );
    }
    Navigator.of(context).pop();
  }

  void _presenDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // ignore: avoid_unnecessary_containers
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(label: Text("title")),
              controller: titlecontroller,
              onSubmitted: (_) => submitted(),
            ),
            TextField(
              decoration: const InputDecoration(label: Text("amount")),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitted(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen! '
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                  ),
                  TextButton(
                      // ignore: void_checks
                      onPressed: _presenDatePicker,
                      child: const Text(
                        "Choose Date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            OutlinedButton(
                onPressed: submitted,
                child: const Text(
                  "add transaction",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }

  void adtx(String enterTitle, double enterAmount) {}
}
