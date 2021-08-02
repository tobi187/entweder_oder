import 'package:entweder_oder/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class GameScreen extends StatefulWidget {
  final List questionList;
  const GameScreen({Key? key, required this.questionList}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List shuffledList = [];
  int questNr = 0;

  void prepareList(List quests) {
    List questList = [];
    quests.forEach((element) => questList.add(element["text"]));
    questList.shuffle();
    shuffledList = questList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prepareList(widget.questionList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGameBg,
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          int sensitivity = 8;
          if (details.primaryVelocity! > sensitivity) {
            setState(() {
              if (questNr == 0) {
                questNr = shuffledList.length;
              }
              questNr--;
            });
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 50),
            Text(
              "Frage: ",
              style: GoogleFonts.notoSans(
                  decoration: TextDecoration.none,
                  color: kDarkest,
                  fontSize: 20.0),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: AutoSizeText(
                  shuffledList == [] ? "Loading" : shuffledList[questNr],
                  style: GoogleFonts.notoSans(
                      decoration: TextDecoration.none, color: Colors.black),
                  maxLines: 6,
                ),
              ),
            ),
            MyButton(
              buttonText: "Entweder",
              onPressEvent: () {
                setState(() {
                  questNr++;
                  if (questNr >= shuffledList.length) {
                    questNr = 0;
                  }
                });
              },
            ),
            SizedBox(height: 50),
            MyButton(
              buttonText: "Oder",
              onPressEvent: () {
                setState(() {
                  questNr++;
                  if (questNr >= shuffledList.length) {
                    questNr = 0;
                  }
                });
              },
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressEvent;
  const MyButton(
      {Key? key, required this.buttonText, required this.onPressEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: kSimilar2,
          onSurface: kDarker,
          elevation: 5,
          minimumSize: Size(300.0, 90.0)),
      child: Text(buttonText),
      onPressed: onPressEvent,
    );
  }
}
