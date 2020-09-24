import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hesap_makinem/hakkinda.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hesap Makinem',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Hesap Makinem'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String defaultOutput = "0";

  String _defaultOutput = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "TEMIZLE") {
      _defaultOutput = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(defaultOutput);
      operand = buttonText;
      _defaultOutput = "0";
    } else if (buttonText == ".") {
      if (_defaultOutput.contains(".")) {
        return;
      } else {
        _defaultOutput = _defaultOutput + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.tryParse(defaultOutput);

      if (operand == "+") {
        _defaultOutput = (num1 + num2).toString();
      }
      if (operand == "-") {
        _defaultOutput = (num1 - num2).toString();
      }
      if (operand == "X") {
        _defaultOutput = (num1 * num2).toString();
      }
      if (operand == "/") {
        _defaultOutput = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _defaultOutput = _defaultOutput + buttonText;
    }
    print(_defaultOutput);

    setState(() {
      if (buttonText == "=") {
        defaultOutput = double.parse(_defaultOutput).toStringAsFixed(2);
      } else {
        defaultOutput = double.parse(_defaultOutput).toStringAsFixed(0);
      }
    });
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
          highlightColor: Colors.purple[300],
          padding: new EdgeInsets.all(24.0),
          child: new Text(
            buttonText,
            style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Calculator',
                // backgroundColor: Colors.yellow,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () => buttonPressed(buttonText)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.purple,
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.info_outline,size: 35,color: Colors.white,),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => (HakkindaApp())));
                }
            )
          ],
        ),
        body: new Container(
            child: new Column(
          children: <Widget>[
            new Container(
                color: Colors.deepPurple[100],
                alignment: Alignment.centerRight,
                padding:
                    new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: new Text(
                  defaultOutput,
                  style: new TextStyle(
                    fontFamily: 'Calculator',
                    fontSize: 75.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            new Expanded(
              // Sonuç ekranı ile tuşlar arasına mesafe koymak için
              //child: new Divider(), // Renk ataması yapılmadığı için kullanmadım
              child: Container(
                color: Colors.deepPurple[100],
              ),
            ),
            new Column(children: [
              new Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/"),
              ]),
              new Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("X"),
              ]),
              new Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-"),
              ]),
              new Row(children: [
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+"),
              ]),
              new Row(children: [
                buildButton("TEMIZLE"),
                buildButton("="),
              ])
            ])
          ],
        )));
  }
}
