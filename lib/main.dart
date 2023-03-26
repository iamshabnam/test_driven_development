import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Addition App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Addition App',
        controller: AdditionController(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.controller})
      : super(key: key);
  final String title;
  final AdditionController controller;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  TextEditingController textFieldController1 = TextEditingController();
  TextEditingController textFieldController2 = TextEditingController();

  @override
  void dispose() {
    textFieldController1.dispose();
    textFieldController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: textFieldController1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter an integer',
              ),
            ),
            TextField(
              controller: textFieldController2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter an integer',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                int val1 = int.tryParse(textFieldController1.text) ?? 0;
                int val2 = int.tryParse(textFieldController2.text) ?? 0;
                setState(() {
                  int result = widget.controller.calculateSum(val1, val2);
                  widget.controller.setResult(result);
                });
              },
              child: const Text('Add'),
            ),
            const SizedBox(height: 16),
            Text(
              'Result: ${widget.controller.getResult()}',
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class AdditionController {
  int _result = 0;

  int calculateSum(int val1, int val2) {
    return val1 + val2;
  }

  int getResult() {
    return _result;
  }

  void setResult(int result) {
    _result = result;
  }
}
