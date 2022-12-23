import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

String number(String n, String a) {
  print(n);
  print(a);
  if (n == '9' ||
      n == '8' ||
      n == '7' ||
      n == '6' ||
      n == '5' ||
      n == '4' ||
      n == '3' ||
      n == '2' ||
      n == '1' ||
      n == '0' ||
      n == '00') {
    if ((n == '0' || n == '00') && a.isEmpty == true) {
      a = '';
      return a;
    }
    a += n;
  } else if (n == '+' || n == '-' || n == '*' || n == '/') {
    if (n == '-' && a.isEmpty == true) {
      a = "-";
    } else {
      a += n;
    }
  }
  // double result = double.parse(a);
  // print(result);
  return a;
}

double compute(String a) {
  Parser p = Parser();
  Expression exp = p.parse(a);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  return eval;
}

class function_calc extends StatelessWidget {
  const function_calc({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
