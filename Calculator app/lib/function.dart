import 'package:math_expressions/math_expressions.dart';

String number(String n, String a) {
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
      n == '.') {
    if ((n == '0' || n == '00') && a.isEmpty == true) {
      a = '';
      return a;
    }
    a += n;
  } else if (n == '+' || n == '-' || n == '*' || n == '/' || n == '%') {
    if (a.endsWith('+') == true ||
        a.endsWith('-') == true ||
        a.endsWith('*') == true ||
        a.endsWith('/') == true ||
        a.endsWith('%')) {
      if (n == '-' && a.endsWith('*')) {
        a += n;
      }
      return a;
    }
    if (n == '-' && a.isEmpty == true) {
      a = "-";
    } else {
      a += n;
    }
  }
  return a;
}

String del(String a) {
  return a.substring(0, a.length - 1);
}

double compute(String a) {
  Parser p = Parser();
  Expression exp = p.parse(a);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  String inString = eval.toStringAsFixed(4);
  eval = double.parse(inString);

  return eval;
}

String invert(String a) {
  if (a[0] == '-') {
    a = a.substring(1, a.length);
  } else {
    a = "-$a";
  }
  return a;
}
