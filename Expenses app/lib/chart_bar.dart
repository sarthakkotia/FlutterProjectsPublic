import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  //We need the label for the chart
  String label;
  // we need the amount that we have spent
  double AmountSpent;
  // to color the bar according to the percent of total spending each day we need to find the percent spent in that day variable\
  double AmountPercent;

  //constructor
  ChartBar({this.label, this.AmountPercent, this.AmountSpent});

  @override
  Widget build(BuildContext context) {
    // the bars would be a row of columns but specifically each bar would be a column with partyially filled color and items on top of each other
    return Column(
      children: [
        // we first write the amount spent on that day and used to stringasfixed to remove all decimal places
        //fitted box widget forces its child into the available space and text shrinks
        Container(
          height: 20,
          child: FittedBox(
            child: Text("\$${AmountSpent.toStringAsFixed(0)}"),
          ),
        ),
        // to add some space we add sizedbos
        SizedBox(height: 4),
        // add container which would be partially filled acting as bar
        Container(
          height: 60,
          width: 10,
          child:
              //here we use a stack widget in it it allows element to be placed on top of each other ie overlapping each other unlike column
              Stack(children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  // for rounded corners we use border radius),
                  borderRadius: BorderRadius.circular(20)),
            ),
            // we use a fractionally sized box it allows to create a box as a fraction of another value
            FractionallySizedBox(
              heightFactor: AmountPercent,
              //1 would be as large as previous one ie 60 but we need it to be according to the percent spent
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)),
              ),
            )
          ]),
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
