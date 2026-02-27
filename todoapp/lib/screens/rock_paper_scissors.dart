import 'dart:math';
import 'package:flutter/material.dart';

class GameOption {
  final String name;
  final IconData icon;
  GameOption(this.name, this.icon);
}

class RockPaperScissorsScreen extends StatefulWidget {
  @override
  _RockPaperScissorsScreenState createState() =>
      _RockPaperScissorsScreenState();
}

class _RockPaperScissorsScreenState extends State<RockPaperScissorsScreen> {
  final List<GameOption> choices = [
    GameOption("Rock", Icons.sports_mma),
    GameOption("Paper", Icons.description),
    GameOption("Scissors", Icons.content_cut),
  ];
  String userChoice = "";
  String computerChoice = "";
  String result = "";

  void playGame(String choice) {
    setState(() {
      userChoice = choice;
      computerChoice = choices[Random().nextInt(choices.length)].name;
      result = getResult(userChoice, computerChoice);
    });
  }

  String getResult(String user, String computer) {
    if (user == computer) return "It's a Draw!";
    if ((user == "Rock" && computer == "Scissors") ||
        (user == "Paper" && computer == "Rock") ||
        (user == "Scissors" && computer == "Paper")) {
      return "You Win!";
    }
    return "You Lose!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rock Paper Scissors')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Choose your option:', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: choices.map((option) {
              return IconButton(
                icon: Icon(option.icon, size: 40),
                onPressed: () => playGame(option.name),
                tooltip: option.name,
              );
            }).toList(),
          ),
          SizedBox(height: 30),
          if (userChoice.isNotEmpty)
            Column(
              children: [
                Text('Your Choice: $userChoice'),
                Text('Computer Choice: $computerChoice'),
                Text(
                  result,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
