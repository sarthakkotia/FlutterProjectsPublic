import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/chart_bar.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<transaction> recenttx;

  Chart(this.recenttx);

  List<Map<String, Object>> get txvalues {
    var test = List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      // for (var a in recenttx) {
      //   print(a.amount);
      //   print(a.date);
      //   print(a.title);
      // }

      var sum = 0.0;
      for (var i = 0; i < recenttx.length; i++) {
        if (recenttx[i].date.day == weekDay.day &&
            recenttx[i].date.month == weekDay.month &&
            recenttx[i].date.year == weekDay.year) {
          sum += recenttx[i].amount;
        }
      }

      // print(DateFormat.E().format(weekDay));
      // print(sum);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 3),
        "amount": sum,
      };
    }).reversed.toList();
    return test;
  }

  double get MaxAmount {
    // fold allows us to change a list to another type with logic we define
    //starting value is 0.0 and the next value is the value which would be added to the starting value
    return txvalues.fold(0.0, (sum, element) {
      return sum + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(txvalues);
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // to tell the elements to spread evenly
          children: //we are taking the getter values and mapping it to a list to create bars for each day
              txvalues.map((data) {
            // now we neeed to return the bar which is to be created but we haven't created that widget yet
            // we wrapped the chart bar with flexible widget so that if the label is large then it can adjust
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  label: data['day'],
                  AmountSpent: data['amount'],
                  AmountPercent: MaxAmount == 0
                      ? 0.0
                      : (((data['amount'] as double) / MaxAmount))
                  // now if the maxamount is zero that is if the transactions haven't been added yet then just all things to zero instead of dividing by zero and causing an error so add a ternary expression
                  // we calculate this amount percent using a getter
                  ),
            );
          }).toList(),
        ),
      ),
      elevation: 6,
      margin: EdgeInsets.all(20),
    );
  }
}
