import 'package:flutter/material.dart ';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function add;
  NewTransaction(this.add);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime _selectedDate;

  void _submit() {
    final enteredtitle = _titlecontroller.text;
    final enteredamount = double.parse(_amountcontroller.text);

    if (enteredtitle.isEmpty || enteredamount < 0 || _selectedDate == null) {
      return;
    }

    widget.add(
      enteredtitle,
      enteredamount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime.now(),
      // then method added will provide a function which will be executed once user chooses the date
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(3),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              autocorrect: true,
              decoration: InputDecoration(labelText: "Title"),
              controller: _titlecontroller,
              onSubmitted: ((_) => _submit()),
              // onChanged: ((value) {
              //   titleinput = value;
              // }),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: ((_) => _submit()),
              // onChanged: (value) {
              //   amountinput = value;
              // },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // this following row is for the date picker
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Text(_selectedDate == null
                          ? "No Date Chosen!"
                          : DateFormat.MMMEd().format(_selectedDate)),
                      TextButton(
                        child: Text(
                          "Choose date",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: _datePicker,
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: ((_submit)),
                  child: Text("Add transaction"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
