import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int first = 0; // Initialize first with a default value
  int second = 0;
  String result = "", text = "";
  String operation = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )),
            Row(
              children: [
                customOutlinedButton("7"),
                customOutlinedButton("8"),
                customOutlinedButton("9"),
                customOutlinedButton("+"),
                // Add more buttons as needed
              ],
            ),
            Row(
              children: [
                customOutlinedButton("4"),
                customOutlinedButton("5"),
                customOutlinedButton("6"),
                customOutlinedButton("-"),
                // Add more buttons as needed
              ],
            ),
            Row(
              children: [
                customOutlinedButton("1"),
                customOutlinedButton("2"),
                customOutlinedButton("3"),
                customOutlinedButton("x"),
                // Add more buttons as needed
              ],
            ),
            Row(
              children: [
                customOutlinedButton("C"),
                customOutlinedButton("0"),
                customOutlinedButton("="),
                customOutlinedButton("/"),
                // Add more buttons as needed
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded customOutlinedButton(String value) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnClicked(value),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(55.0),
          elevation: 10000.0,
        ),
        child: Text(
          value,
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }

  void btnClicked(String txt) {
    if (txt == 'C') {
      result = "";
      text = "";
      first = 0;
      second = 0;
    } else if (txt == '+' || txt == '-' || txt == 'x' || txt == '/') {
      first = int.parse(text);
      result = "";
      operation = txt;
    } else if (txt == '=') {
      second = int.parse(text);

      if (operation == '+') {
        result = (first + second).toString();
      }
      if (operation == '-') {
        result = (first - second).toString();
      }
      if (operation == 'x') {
        result = (first * second).toString();
      }
      if (operation == '/') {
        result = (first / second).toString();
      }
    } else {
      result = int.parse(text + txt).toString();
    }

    setState(() {
      text = result;
    });
  }
}
