import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    home: const Home(),
    theme: ThemeData.dark(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.lightBlue,
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 40.0),
        child: CalcBody(),
      ),
    );
  }
}

class CalcBody extends StatefulWidget {
  const CalcBody({Key? key}) : super(key: key);

  @override
  State<CalcBody> createState() => _CalcBodyState();
}

class _CalcBodyState extends State<CalcBody> {
  var tController = TextEditingController();
  bool dec = false;
  bool isOperator(String s) {
    if (s[s.length - 1] == "\u00F7" ||
        s[s.length - 1] == "\u00D7" ||
        s[s.length - 1] == "-" ||
        s[s.length - 1] == "\u002B" ||
        s[s.length - 1] == "." ||
        s[s.length - 1] == "%") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 120.0,
        ),
        Container(
          padding: const EdgeInsets.all(22.0),
          child: TextField(
            textAlign: TextAlign.right,
            decoration: const InputDecoration(
              hintText: "0",
            ),
            style: const TextStyle(
              fontSize: 45.0,
            ),
            controller: tController,
            readOnly: true,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: GridView.count(
            crossAxisSpacing: 10,
            crossAxisCount: 4,
            children: [
              InkWell(
                child: const Center(
                  child: Text(
                    "AC",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    tController.text = "";
                    dec = false;
                  });
                },
              ),
              InkWell(
                child: const Icon(
                  Icons.backspace,
                  color: Colors.lightBlue,
                ),
                onTap: () {
                  setState(() {
                    if (tController.text.isNotEmpty) {
                      tController.text = tController.text
                          .substring(0, tController.text.length - 1);
                    }
                  });
                },
              ),
              InkWell(
                child: const Icon(
                  Icons.percent,
                  color: Colors.lightBlue,
                ),
                onTap: () {
                  setState(() {
                    if (!isOperator(tController.text)) {
                      tController.text += "%";
                      dec = false;
                    }
                  });
                },
              ),
              InkWell(
                child: const Center(
                  child: FaIcon(
                    FontAwesomeIcons.divide,
                    color: Colors.lightBlue,
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!isOperator(tController.text)) {
                      tController.text += "\u00F7";
                      dec = false;
                    }
                  });
                },
              ),
              InkWell(
                child: const Center(
                  child: Text(
                    "7",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    tController.text += "7";
                  });
                },
              ),
              InkWell(
                child: const Center(
                  child: Text(
                    "8",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    tController.text += "8";
                  });
                },
              ),
              InkWell(
                child: const Center(
                  child: Text(
                    "9",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    tController.text += "9";
                  });
                },
              ),
              InkWell(
                child: const Center(
                  child: FaIcon(
                    FontAwesomeIcons.xmark,
                    color: Colors.lightBlue,
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!isOperator(tController.text)) {
                      tController.text += "\u00D7";
                      dec = false;
                    }
                  });
                },
              ),
              InkWell(
                child: const Center(
                  child: Text(
                    "4",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    tController.text += "4";
                  });
                },
              ),
              InkWell(
                child: const Center(
                  child: Text(
                    "5",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    tController.text += "5";
                  });
                },
              ),
              InkWell(
                child: const Center(
                  child: Text(
                    "6",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    tController.text += "6";
                  });
                },
              ),
              InkWell(
                child: const Center(
                  child: FaIcon(
                    FontAwesomeIcons.minus,
                    color: Colors.lightBlue,
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!isOperator(tController.text)) {
                      tController.text += "-";
                      dec = false;
                    }
                  });
                },
              ),
              InkWell(
                highlightColor: Colors.grey,
                splashColor: Theme.of(context).canvasColor,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    tController.text += "1";
                  });
                },
              ),
              InkWell(
                child: const Center(
                  child: Text(
                    "2",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    tController.text += "2";
                  });
                },
              ),
              InkWell(
                child: const Center(
                  child: Text(
                    "3",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    tController.text += "3";
                  });
                },
              ),
              InkWell(
                child: const Center(
                  child: FaIcon(
                    FontAwesomeIcons.plus,
                    color: Colors.lightBlue,
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!isOperator(tController.text)) {
                      tController.text += "\u002B";
                      dec = false;
                    }
                  });
                },
              ),
              const InkWell(),
              InkWell(
                child: const Center(
                  child: Text(
                    "0",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    tController.text += "0";
                  });
                },
              ),
              InkWell(
                child: const Center(
                  child: Text(
                    ".",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!dec && !isOperator(tController.text)) {
                      tController.text += ".";
                      dec = true;
                    }
                  });
                },
              ),
              InkWell(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.lightBlue,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.equals,
                      color: Colors.purple,
                    ),
                  ),
                ),
                onTap: () {
                  String expression = '';
                  for (int i = 0; i < tController.text.length; i++) {
                    if (tController.text[i] == '×') {
                      expression += '*';
                    } else if (tController.text[i] == '÷') {
                      expression += '/';
                    } else {
                      expression += tController.text[i];
                    }
                  }
                  try {
                    Parser p = Parser();
                    Expression exp = p.parse(expression);
                    ContextModel cm = ContextModel();
                    double eval = exp.evaluate(EvaluationType.REAL, cm);
                    setState(() {
                      tController.text = '$eval';
                    });
                  } catch (e) {
                    setState(() {
                      tController.text = 'ERR';
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
