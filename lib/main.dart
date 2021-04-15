import 'package:flutter/material.dart';
import 'package:vigenere/decipher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

const _padding = EdgeInsets.all(16.0);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String cipherText = "";
  String shiftKey = "";
  String result = "";
  @override
  Widget build(BuildContext context) {
    final cipherTextInputWidget = Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            // key: _inputKey,
            // style: Theme.of(context).textTheme.display1,
            decoration: InputDecoration(
              // labelStyle: Theme.of(context).textTheme.display1,
              // errorText: _showValidationError ? 'Invalid number entered' : null,
              labelText: 'Cipher Text',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            keyboardType: TextInputType.name,
            onChanged: _updateCipherText,
          ),
        ],
      ),
    );
    final keyInputWidget = Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            // key: _inputKey,
            // style: Theme.of(context).textTheme.display1,
            decoration: InputDecoration(
              // labelStyle: Theme.of(context).textTheme.display1,
              // errorText: _showValidationError ? 'Invalid number entered' : null,
              labelText: 'Key',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            keyboardType: TextInputType.name,
            // onChanged: _updateInputValue,
            onChanged: _updateKeyText,
            // labelStyle: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
    );

    final output = Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InputDecorator(
            child: Text(
              // "Output",
              result,
              // style: Theme.of(context).textTheme.display1,
            ),
            decoration: InputDecoration(
              labelText: 'Output',
              // labelStyle: Theme.of(context).textTheme.display1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
        ],
      ),
    );

    final button = RaisedButton(
      onPressed: () {
        setState(() {
          result = Vigenere.decrypt(cipherText, shiftKey);
          print("rseult");
          print(result);
        });
      },
      child: Text("Decipher"),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            cipherTextInputWidget,
            keyInputWidget,
            output,
            button
          ],
        ),
      ),
    );
  }

  void _updateCipherText(String input) {
    setState(() {
      if (input == null || input.isEmpty) {
        cipherText = '';
      } else {
        cipherText = input;
      }
      print("New cipher : " + cipherText);
    });
  }

  void _updateKeyText(String input) {
    setState(() {
      if (input == null || input.isEmpty) {
        shiftKey = '';
      } else {
        shiftKey = input;
      }
      print("New key : " + shiftKey);
    });
  }
}
