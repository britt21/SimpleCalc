import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var result = 0;
  var textInput = TextEditingController();

  @override
  void initState() {
    calculateAddedvalue(45, 70);
    calculatesubtraction(60, 40);
    Dividedvalue(60, 40);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text("Simple Calc"), backgroundColor: Colors.blue),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 550,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    padding: EdgeInsets.all(16),
                    child: TextField(
                      controller: textInput,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '0',
                      ),
                    ),
                  ),
                  buildRow(["1", "2", "3"]),
                  buildRow(["4", "5", "6"]),
                  buildRow(["7", "8", "9"]),
                  buildRow(["0", "+", "-"]),
                  buildRow(["C", "*", "/"]),
                  buildRow(["=", "."]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(List<String> buttons) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons
            .map(
              (button) => ElevatedButton(
            onPressed: () => onButtonPressed(button),
            child: Text(button),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
            ),
          ),
        )
            .toList(),
      ),
    );
  }

  void onButtonPressed(String buttonText) {
    if (buttonText == "C") {
      clear();
    } else if (buttonText == "=") {
      calculateResult();
    } else {
      updateInput(buttonText);
    }
  }

  void clear() {
    setState(() {
      textInput.text = "";
      result = 0;
    });
  }

  void updateInput(String buttonText) {
    setState(() {
      textInput.text += buttonText;
    });
  }

  void calculateResult() {
    try {
      // Basic parsing and calculation
      String expression = textInput.text;
      List<String> operators = ['+', '-', '*', '/'];
      for (String operator in operators) {
        List<String> parts = expression.split(operator);
        if (parts.length == 2) {
          int operand1 = int.parse(parts[0]);
          int operand2 = int.parse(parts[1]);
          switch (operator) {
            case '+':
              result = operand1 + operand2;
              break;
            case '-':
              result = operand1 - operand2;
              break;
            case '*':
              result = operand1 * operand2;
              break;
            case '/':
              result = operand1 ~/ operand2; // Integer division
              break;
          }
          textInput.text = result.toString();
          return;
        }
      }
    } catch (e) {
      setState(() {
        result = 0;
        textInput.text = "Error";
      });
    }
  }

  void calculateAddedvalue(int valueA, int valueB){
    var takevalueA = valueA;
    var takevalueB = valueB;
    var finalValue = takevalueA + takevalueB;

    print("Addedvalue is ${finalValue}" );
  }

  void calculatesubtraction(int valueA, int valueB){
    var takevalueA = valueA;
    var takevalueB = valueB;
    var finalValue = takevalueA - takevalueB;

    print("Subtractedvalue is ${finalValue}" );


  }

  void Dividedvalue(int valueA, int valueB){
    var takevalueA = valueA;
    var takevalueB = valueB;
    var finalValue = takevalueA - takevalueB;

    print("Dividedvalue is ${finalValue}" );
  }
}
