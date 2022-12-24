import 'package:calculator/function.dart';
import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  final String title;
  const CalculatorApp({super.key, required this.title});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String a = "";
  String greya = "";
  bool greytext = false;
  double data = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: greytext == false
                    ? Text(
                        a,
                        textScaleFactor: 3,
                      )
                    : Column(
                        children: [
                          Text(
                            greya,
                            style: const TextStyle(color: Colors.grey),
                            textScaleFactor: 2,
                          ),
                          Text(
                            a,
                            textScaleFactor: 3,
                          )
                        ],
                      ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: (() {
                      setState(() {
                        a = invert(a);
                      });
                    }),
                    child: const Text(
                      "+/-",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (() {
                        greytext = false;
                        setState(() {
                          a = "";
                        });
                      }),
                      child: const Text("C", style: TextStyle(fontSize: 20))),
                  ElevatedButton(
                      onPressed: (() {
                        if (a.isEmpty == true) {}
                        setState(() {
                          a = del(a);
                        });
                      }),
                      child: const Text("DEL", style: TextStyle(fontSize: 20))),
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          a = number('/', a);
                        });
                      }),
                      child: const Text("/", style: TextStyle(fontSize: 20))),
                  const SizedBox(width: 10)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: (() {
                      setState(() {
                        a = number('9', a);
                      });
                    }),
                    child: const Text("9", style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          a = number('8', a);
                        });
                      }),
                      child: const Text("8", style: TextStyle(fontSize: 20))),
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          a = number('7', a);
                        });
                      }),
                      child: const Text("7", style: TextStyle(fontSize: 20))),
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          a = number('*', a);
                        });
                      }),
                      child: const Text("*", style: TextStyle(fontSize: 20))),
                  const SizedBox(width: 10)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: (() {
                      setState(() {
                        a = number('6', a);
                      });
                    }),
                    child: const Text(
                      "6",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          a = number('5', a);
                        });
                      }),
                      child: const Text("5", style: TextStyle(fontSize: 20))),
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          a = number('4', a);
                        });
                      }),
                      child: const Text("4", style: TextStyle(fontSize: 20))),
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          a = number('-', a);
                        });
                      }),
                      child: const Text("-", style: TextStyle(fontSize: 20))),
                  const SizedBox(width: 10)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: (() {
                      setState(() {
                        a = number('3', a);
                      });
                    }),
                    child: const Text(
                      "3",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          a = number('2', a);
                        });
                      }),
                      child: const Text("2", style: TextStyle(fontSize: 20))),
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          a = number('1', a);
                        });
                      }),
                      child: const Text("1", style: TextStyle(fontSize: 20))),
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          a = number('+', a);
                        });
                      }),
                      child: const Text("+", style: TextStyle(fontSize: 20))),
                  const SizedBox(width: 10)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: (() {
                      setState(() {
                        a = number('.', a);
                      });
                    }),
                    child: const Text(
                      ".",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          a = number('0', a);
                        });
                      }),
                      child: const Text("0", style: TextStyle(fontSize: 20))),
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          a = number('%', a);
                        });
                      }),
                      child: const Text("%", style: TextStyle(fontSize: 20))),
                  ElevatedButton(
                      onPressed: (() {
                        greytext = true;
                        data = compute(a);
                        setState(() {
                          greya = a;
                          data;
                          a = data.toString();
                        });
                      }),
                      child: const Text("=", style: TextStyle(fontSize: 20))),
                  const SizedBox(width: 10)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
