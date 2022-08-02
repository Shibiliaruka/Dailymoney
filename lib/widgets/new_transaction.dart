import 'package:dailymoney/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Newtransaction extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deletTx;

  const Newtransaction(this.transaction, this.deletTx, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
    return Container(
      height: 500,
      child: transaction.isEmpty
          ? Column(
              children: <Widget>[
                const Spacer(
                  flex: 1,
                ),
                const Text(
                  "No transaction are here!",
                  style: TextStyle(fontFamily: 'Opensans', fontSize: 30),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                    height: 100,
                    child: const Image(
                        image: AssetImage('assets/image/waiting.png')))
              ],
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                            child: Text('\$${transaction[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transaction[index].date)),
                    trailing: IconButton(
                      onPressed: () => deletTx(transaction[index].id),
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
