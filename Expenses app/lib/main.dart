import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/new_transaction.dart';
import 'package:flutter_complete_guide/transaction_list.dart';
import 'models/transaction.dart';
import './chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.amber,
          fontFamily: "Montserrat",
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontFamily: "Open Sans",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ))),
      // theme: ThemeData(
      //   primarySwatch: Colors.deepPurple,
      //   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
      //       .copyWith(secondary: Colors.grey),
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<transaction> _userTransactions = [
    // transaction(
    //   id: 't1',
    //   title: "New Shoes",
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // transaction(
    //   id: 't2',
    //   title: "New mouse",
    //   amount: 84.03,
    //   date: DateTime.now(),
    // ),
  ];

  List<transaction> get _recenttx {
    var a = _userTransactions.where((tx) {
      var b = tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
      // print(b);
      return b;
    }).toList();
    // for (var j in a) {
    //   print(j.date);
    // }
    // print(a);
    return a;
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
    );
    setState(() {
      _userTransactions.add(newTx);
    });
    // print(
    //     "*******************************************************************");
    // for (var tx in _userTransactions) {
    //   print(tx.amount);
    //   print(tx.date);
    // }
    // print(
    //     "*******************************************************************");
  }

  // String titleinput;
  void startaddnewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: null,
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: [
          IconButton(
              onPressed: () => startaddnewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Chart(_recenttx),
              TransactionList(_userTransactions, _deleteTransaction),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startaddnewTransaction(context),
      ),
    );
  }
}
