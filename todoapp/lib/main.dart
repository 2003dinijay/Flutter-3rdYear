import 'package:flutter/material.dart';
// import 'package:todoapp/screens/signup.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Todo App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: Colors.grey[200],
//       ),
//       home: const SignUpPage(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'screens/rock_paper_scissors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: RockPaperScissorsScreen(),
    );
  }
}
  String computerChoice = "";
  String resultMessage = "";
  int userScore = 0;
  int computerScore = 0;

  void playGame(String choice) {
    setState(() {
      userChoice = choice;
      computerChoice = choices[Random().nextInt(choices.length)].name;

      if (userChoice == computerChoice) {
        resultMessage = "It's a Draw!";
      } else if ((userChoice == "Rock" && computerChoice == "Scissors") ||
          (userChoice == "Paper" && computerChoice == "Rock") ||
          (userChoice == "Scissors" && computerChoice == "Paper")) {
        resultMessage = "You Win!";
        userScore++;
      } else {
        resultMessage = "Computer Wins!";
        computerScore++;
      }
    });
  }

  void resetGame() {
    setState(() {
      userChoice = "";
      computerChoice = "";
      resultMessage = "";
      userScore = 0;
      computerScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rock Paper Scissors")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Scores",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("You: $userScore", style: TextStyle(fontSize: 18)),
            Text("Computer: $computerScore", style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            Text("Choose your move:", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            SizedBox(height: 30),
            Text("Your Choice: $userChoice", style: TextStyle(fontSize: 18)),
            Text(
              "Computer Choice: $computerChoice",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              resultMessage,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: choices.map((choice) {
                return ElevatedButton(
                  onPressed: () => playGame(choice.name),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(choice.icon, size: 40),
                      SizedBox(height: 5),
                      Text(choice.name),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: resetGame,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text("Reset Game"),
            ),
          ],
        ),
      ),
    );
  }
}
