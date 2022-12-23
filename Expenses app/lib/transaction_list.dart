import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<transaction> transactions;
  final Function deletetx;
  TransactionList(this.transactions, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    "No transactions yet!",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      ))
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  //insterad of using the card widget we could use the listtile which have almost same styling as we did and better optimized as it's a flutter widget
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: ListTile(
                      //a widget that is positioned at the beggineing
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: FittedBox(
                              child: Text("\$${transactions[index].amount}")),
                        ),
                      ),
                      title: Text(transactions[index].title,
                          style: Theme.of(context).textTheme.headline6),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date)),
                      trailing: IconButton(
                        onPressed: (() => deletetx(transactions[index].id)),
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  );

                  // return Card(
                  //   child: Row(children: [
                  //     Container(
                  //       margin:
                  //           EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  //       decoration: BoxDecoration(
                  //           border: Border.all(
                  //         color: Theme.of(context).primaryColor,
                  //         width: 2,
                  //       )),
                  //       padding: EdgeInsets.all(10),
                  //       child: Row(
                  //         children: [
                  //           Text(
                  //             '\$${transactions[index].amount.toStringAsFixed(2)}',
                  //             style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 20,
                  //               color: Theme.of(context).primaryColor,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(transactions[index].title,
                  //             style: Theme.of(context).textTheme.headline6),
                  //         Text(
                  //           DateFormat('d MMMM yyyy')
                  //               .add_jm()
                  //               .format(transactions[index].date),
                  //           style: TextStyle(fontSize: 14, color: Colors.grey),
                  //         ),
                  //       ],
                  //     )
                  //   ]),
                  // );
                },
                itemCount: transactions.length,
              ));
  }
}
