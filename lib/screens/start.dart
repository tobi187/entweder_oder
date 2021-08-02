import 'package:entweder_oder/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:entweder_oder/globals.dart' as globals;
import 'game_screen.dart';
import 'package:entweder_oder/data/questions.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(image: AssetImage("assets/images/logo.png")),
            Text(
              "Entweder",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text(
              "     vs",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "Oder",
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            MySwitchTile(),
            MyButton(),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(100, 100),
        primary: Colors.teal,
        shadowColor: Colors.teal[800],
        elevation: 10,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameScreen(
                questionList: globals.familyFriendly
                    ? familyFriendlyQuestions
                    : questions),
          ),
        );
      },
      child: Text("Start"),
    );
  }
}

class MySwitchTile extends StatefulWidget {
  const MySwitchTile({Key? key}) : super(key: key);

  @override
  _MySwitchTileState createState() => _MySwitchTileState();
}

class _MySwitchTileState extends State<MySwitchTile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        activeColor: kSimilar2,
        title: Text("Family friendly?"),
        value: globals.familyFriendly,
        onChanged: (val) {
          setState(() {
            globals.familyFriendly = val;
          });
        });
  }
}
