// ignore_for_file: prefer_const_constructors

//import 'package:dailymoney/models/transaction.dart';
import 'package:dailymoney/models/transaction.dart';
import 'package:dailymoney/widgets/chart.dart';
//import 'package:dailymoney/widgets/body_transactions.dart';
import 'package:dailymoney/widgets/new_transaction.dart';
import 'package:dailymoney/widgets/user_transaction.dart';
// import 'package:dailymoney/widgets/new_transaction.dart';
// import 'package:dailymoney/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  final List<Transaction> usertransaction = [
    // Transaction(
    //     id: 'ti', title: "new shoes", amount: 1200, date: DateTime.now())
  ];

  List<Transaction> get recentTransaction {
    return usertransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void addtransaction(
    String txtitle,
    double txamount,
    DateTime choseDate,
  ) {
    final adtx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: choseDate);

    setState(() {
      usertransaction.add(adtx);
    });
  }

  void showTransactionModel(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: Usertransaction(addtransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      usertransaction.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DailyMoney",
          style:
              TextStyle(fontFamily: 'QuickSand', fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () => showTransactionModel(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(recentTransaction),
            Newtransaction(usertransaction, _deleteTransaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showTransactionModel(context),
        child: Icon(Icons.insert_chart),
      ),
    );
  }
}
