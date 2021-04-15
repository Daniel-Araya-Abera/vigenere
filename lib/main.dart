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
  String key = "";
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
          // _createDropdown(_fromValue.name, _updateFromConversion),
        ],
      ),
    );
    final keyInputWidget = Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // This is the widget that accepts text input. In this case, it
          // accepts numbers and calls the onChanged property on update.
          // You can read more about it here: https://flutter.io/text-input
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
            // Since we only want numerical input, we use a number keyboard. There
            // are also other keyboards for dates, emails, phone numbers, etc.
            keyboardType: TextInputType.name,
            // onChanged: _updateInputValue,
            onChanged: _updateKeyText,
          ),
          // _createDropdown(_fromValue.name, _updateFromConversion),
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
              // _convertedValue,
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
          // _createDropdown(_toValue.name, _updateToConversion),
        ],
      ),
    );

    final button = RaisedButton(
      onPressed: () {
        setState(() {
          result = Vigenere().decrypt(cipherText, key);
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
        // Even though we are using the numerical keyboard, we still have to check
        // for non-numerical input such as '5..0' or '6 -3'
        try {
          // _showValidationError = false;
          cipherText = input;
          // _updateConversion();
        } on Exception catch (e) {
          print('Error: $e');
          // _showValidationError = true;
        }
      }
    });
  }

  void _updateKeyText(String input) {
    setState(() {
      if (input == null || input.isEmpty) {
        cipherText = '';
      } else {
        // Even though we are using the numerical keyboard, we still have to check
        // for non-numerical input such as '5..0' or '6 -3'
        try {
          // _showValidationError = false;
          key = input;
          // _updateConversion();
        } on Exception catch (e) {
          print('Error: $e');
          // _showValidationError = true;
        }
      }
    });
  }
}
