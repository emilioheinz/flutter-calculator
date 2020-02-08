import 'package:calculator/components/button.dart';
import 'package:calculator/components/display.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static Color lightGray = Color.fromRGBO(175, 175, 175, 1);
  static Color orange = Color.fromRGBO(255, 149, 0, 1);
  static Color darkGray = Color.fromRGBO(51, 51, 51, 1);

  static Color black = Colors.black;
  static Color white = Colors.white;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = '0';
  String firstAppender = '';
  String secondAppender = '';
  bool appendOnFirst = true;
  String storedOperation = '';

  divide() {
    var operationRes =
        (double.parse(firstAppender) / double.parse(secondAppender)).toString();

    setState(() {
      result = operationRes;
      firstAppender = operationRes;
      secondAppender = '';
    });
  }

  multiply() {
    var operationRes =
        (double.parse(firstAppender) * double.parse(secondAppender)).toString();

    setState(() {
      result = operationRes;
      firstAppender = operationRes;
      secondAppender = '';
    });
  }

  subtract() {
    var operationRes =
        (double.parse(firstAppender) - double.parse(secondAppender)).toString();

    setState(() {
      result = operationRes;
      firstAppender = operationRes;
      secondAppender = '';
    });
  }

  sum() {
    var operationRes =
        (double.parse(firstAppender) + double.parse(secondAppender)).toString();

    setState(() {
      result = operationRes;
      firstAppender = operationRes;
      secondAppender = '';
    });
  }

  hasTouchedOperation(text) {
    if (storedOperation == '/' &&
        firstAppender.isNotEmpty &&
        secondAppender == '0') {
      clear('');
      setState(() {
        result = 'Error';
      });
      return;
    }

    if (appendOnFirst) {
      setState(() {
        appendOnFirst = false;
        storedOperation = text;
      });
    } else {
      switch (storedOperation) {
        case '+':
          sum();
          break;
        case '-':
          subtract();
          break;
        case 'x':
          multiply();
          break;
        case '/':
          divide();
          break;
        default:
          break;
      }
      setState(() {
        storedOperation = text;
      });
    }
  }

  append(String text) {
    if (appendOnFirst) {
      setState(() {
        firstAppender = firstAppender + text;
      });
    } else {
      setState(() {
        secondAppender = secondAppender + text;
      });
    }
  }

  whatVariableIsShowedInDisplay() {
    if (secondAppender.isNotEmpty) {
      return 'secondAppender';
    }

    if (firstAppender.isNotEmpty) {
      return 'firstAppender';
    }

    return 'result';
  }

  clear(text) {
    setState(() {
      result = '0';
      firstAppender = '';
      secondAppender = '';
      appendOnFirst = true;
      storedOperation = '';
    });
  }

  changeDisplayNumberValue(text) {
    switch (whatVariableIsShowedInDisplay()) {
      case 'result':
        setState(() {
          result = (double.parse(result) * -1).toString();
        });
        break;
      case 'firstAppender':
        setState(() {
          firstAppender = (double.parse(firstAppender) * -1).toString();
        });
        break;
      case 'secondAppender':
        setState(() {
          secondAppender = (double.parse(secondAppender) * -1).toString();
        });
        break;
      default:
    }
  }

  changeToPercentage(text) {
    switch (whatVariableIsShowedInDisplay()) {
      case 'result':
        setState(() {
          result = (double.parse(result) / 100).toString();
        });
        break;
      case 'firstAppender':
        setState(() {
          firstAppender = (double.parse(firstAppender) / 100).toString();
        });
        break;
      case 'secondAppender':
        setState(() {
          secondAppender = (double.parse(secondAppender) / 100).toString();
        });
        break;
      default:
    }
  }

  renderFirstLine() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Button(
              onPress: clear,
              contentText: 'AC',
              backgroundColor: HomePage.lightGray,
              textColor: HomePage.black),
          Button(
              onPress: changeDisplayNumberValue,
              contentText: '+/-',
              backgroundColor: HomePage.lightGray,
              textColor: HomePage.black),
          Button(
              onPress: changeToPercentage,
              contentText: '%',
              backgroundColor: HomePage.lightGray,
              textColor: HomePage.black),
          Button(
              onPress: hasTouchedOperation,
              contentText: '/',
              backgroundColor: HomePage.orange,
              textColor: HomePage.white),
        ],
      ),
    );
  }

  renderSecondRow() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Button(
              onPress: append,
              contentText: '7',
              backgroundColor: HomePage.darkGray,
              textColor: HomePage.white),
          Button(
              onPress: append,
              contentText: '8',
              backgroundColor: HomePage.darkGray,
              textColor: HomePage.white),
          Button(
              onPress: append,
              contentText: '9',
              backgroundColor: HomePage.darkGray,
              textColor: HomePage.white),
          Button(
              onPress: hasTouchedOperation,
              contentText: 'x',
              backgroundColor: HomePage.orange,
              textColor: HomePage.white),
        ],
      ),
    );
  }

  renderThirdRow() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Button(
              onPress: append,
              contentText: '4',
              backgroundColor: HomePage.darkGray,
              textColor: HomePage.white),
          Button(
              onPress: append,
              contentText: '5',
              backgroundColor: HomePage.darkGray,
              textColor: HomePage.white),
          Button(
              onPress: append,
              contentText: '6',
              backgroundColor: HomePage.darkGray,
              textColor: HomePage.white),
          Button(
              onPress: hasTouchedOperation,
              contentText: '-',
              backgroundColor: HomePage.orange,
              textColor: HomePage.white),
        ],
      ),
    );
  }

  renderFourthRow() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Button(
              onPress: append,
              contentText: '1',
              backgroundColor: HomePage.darkGray,
              textColor: HomePage.white),
          Button(
              onPress: append,
              contentText: '2',
              backgroundColor: HomePage.darkGray,
              textColor: HomePage.white),
          Button(
              onPress: append,
              contentText: '3',
              backgroundColor: HomePage.darkGray,
              textColor: HomePage.white),
          Button(
              onPress: hasTouchedOperation,
              contentText: '+',
              backgroundColor: HomePage.orange,
              textColor: HomePage.white),
        ],
      ),
    );
  }

  renderFiftRow() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Button(
            onPress: append,
            contentText: '0',
            backgroundColor: HomePage.darkGray,
            textColor: HomePage.white,
            isLong: true,
          ),
          Button(
            onPress: append,
            contentText: ',',
            backgroundColor: HomePage.darkGray,
            textColor: HomePage.white,
          ),
          Button(
            onPress: hasTouchedOperation,
            contentText: '=',
            backgroundColor: HomePage.orange,
            textColor: HomePage.white,
          ),
        ],
      ),
    );
  }

  renderDisplay() {
    var displayContent = result;

    if (firstAppender.isNotEmpty) {
      displayContent = firstAppender;
    }

    if (secondAppender.isNotEmpty) {
      displayContent = secondAppender;
    }

    return Display(
      contentText: displayContent,
    );
  }

  renderContent() {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: renderDisplay(),
        ),
        renderFirstLine(),
        renderSecondRow(),
        renderThirdRow(),
        renderFourthRow(),
        renderFiftRow(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(6, 0, 6, 6),
        color: Colors.black,
        child: renderContent(),
      ),
    );
  }
}
