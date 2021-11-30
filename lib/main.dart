import 'package:flutter/material.dart';

void main() => runApp(const BullsEyeApp());

class BullsEyeApp extends StatelessWidget {
  const BullsEyeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BullsEye',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const GamePage(tittle: 'BullsEye'),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key, this.tittle}) : super(key: key);
  final String? tittle;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool _isAlertVisible = false;
  bool _isWhosThereVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Welcome to my second app :) :P",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
            TextButton(
              onPressed: () {
                _isAlertVisible = true;
                _showAlert(context);
                print("Button pressed!");
              },
              child: const Text(
                'Hit me!',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            TextButton(
              onPressed: () {
                _whoIsThereMethod(context);
              },
              child: const Text('Knock Knock'),
            ),
          ],
        ),
      ),
    );
  }

  void _whoIsThereMethod(BuildContext context) {
    _isWhosThereVisible = true;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Who's there?"),
          content: const Text("Aea mano"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _isWhosThereVisible = false;
              },
              child: const Text("GAAAAAA")
            )
          ],
        );
      },
    );
  }

  void _showAlert(BuildContext context) {
    Widget okButton = TextButton(
        child: const Text("Awesome"),
        onPressed: () {
          Navigator.of(context).pop();
          _isAlertVisible = false;
          print("Awesome pressed! $_isAlertVisible");
        });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Hello there!"),
          content: const Text("This is my first pop-up."),
          actions: <Widget>[okButton],
          elevation: 5,
        );
      },
    );
  }
}
