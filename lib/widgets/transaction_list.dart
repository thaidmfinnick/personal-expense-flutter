import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  // TransactionList({Key key}) : super(key: key);
  final List<Transaction> transactions;
  final Function deleleTransaction;

  TransactionList(this.transactions, this.deleleTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text('No transactions added yet',
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (transaction, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat().format(transactions[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () =>
                          deleleTransaction(transactions[index].id),
                    ),
                  ),
                );
                // return Card(
                //   child: Row(children: [
                //     Container(
                //       margin:
                //           EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //       padding: EdgeInsets.all(10),
                //       decoration: BoxDecoration(
                //           border: Border.all(color: Colors.purple)),
                //       child: Text(
                //         '\$${transactions[index].amount.toStringAsFixed(2)}',
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Colors.purple),
                //       ),
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           transactions[index].title,
                //           style: Theme.of(context).textTheme.headline6,
                //         ),
                //         Text(
                //           DateFormat().format(transactions[index].date),
                //           style: TextStyle(color: Colors.grey),
                //         )
                //       ],
                //     )
                //   ]),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
