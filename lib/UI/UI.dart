import 'package:flutter/material.dart';
import '../utilities/functions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String input = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.white,
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Text(input ?? "",
                    style: TextStyle(color: Colors.black, fontSize: 60)),
              ),
            ),
            // All numbers and operators
            Expanded(
              child: Column(
                children: [
                  buildGrid("AC", "C", "%", "+"),
                  buildGrid("1", "2", "3", "-"),
                  buildGrid("4", "5", "6", "x"),
                  buildGrid("7", "8", "9", "/"),
                  // buildGrid("0", ".", "=", "="),
                  Row(
                    children: [
                      buildBlocks("0"),
                      buildBlocks("."),
                      buildBlocks("="),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// Widget Functions

  Row buildGrid(String a, String b, String c, String d) {
    return Row(
      children: [
        buildBlocks(a),
        buildBlocks(b),
        buildBlocks(c),
        buildBlocks(d),
      ],
    );
  }

  Expanded buildBlocks(String text) {
    return Expanded(
      child: Container(
        height: 90,
        child: FlatButton(
          onPressed: () => setState(() {
            if (text == "C") {
              if (input != null && input.length > 0) {
                input = input.substring(0, input.length - 1);
              }
            } else if (text == "AC") {
              if (input != null && input.length > 0) {
                input = input.substring(0, input.length - input.length);
              }
            } else if (text == "=") {
              // TODO: Exception Handling Required Here
              for (int i = 1; i < input.length; i++) {
                if (input[i] == "x") {
                  input = convert(input, "x");
                } else if (input[i] == "+") {
                  input = convert(input, "+");
                } else if (input[i] == "/") {
                  input = convert(input, "/");
                } else if (input[i] == "-") {
                  // ! Check of -a-b condition
                  input = convert(input, "-");
                } else if (input[i] == "%") {
                  input = convert(input, "%");
                }
              }
              //   var result;
              //   expression = equation;
              //   expression = expression.replaceAll('×', '*');
              //   expression = expression.replaceAll('÷', '/');
              //   try {
              //     Parser p = Parser();
              //     Expression exp = p.parse(expression);
              //     ContextModel cm = ContextModel();
              //     result = '${exp.evaluate(EvaluationType.REAL, cm)}';
              //   } catch (e) {
              //     result = "Error";
              //   }
            } else {
              input += text;
            }
          }),
          child: Text(text),
        ),
      ),
    );
  }
}
