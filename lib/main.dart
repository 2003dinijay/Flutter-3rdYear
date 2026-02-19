import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Ground())); // MaterialApp
}

class Ground extends StatefulWidget {
  const Ground({super.key});

  @override
  State<Ground> createState() => _GroundState();
}

class _GroundState extends State<Ground> {
  int runs = 0;
  int balls = 0;

  void bat() {
    setState(() {
      if (balls < 6) {
        runs += (DateTime.now().millisecondsSinceEpoch % 7).toInt();
        balls++;
      }
    });
  }

  void reset() {
    setState(() {
      runs = 0;
      balls = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "🏏 Mini Cricket",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
        elevation: 5,
      ), // AppBar
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade50, Colors.green.shade100],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Score Cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Runs Card
                    Expanded(
                      child: Card(
                        elevation: 8,
                        shadowColor: Colors.green.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.blue.shade400,
                                Colors.blue.shade600,
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/bat.png",
                                height: 100,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(
                                      Icons.sports_cricket,
                                      size: 100,
                                      color: Colors.white,
                                    ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "RUNS",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "$runs",
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    // Balls Card
                    Expanded(
                      child: Card(
                        elevation: 8,
                        shadowColor: Colors.red.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.red.shade400,
                                Colors.red.shade600,
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/ball.jpg",
                                height: 100,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(
                                      Icons.sports_baseball,
                                      size: 100,
                                      color: Colors.white,
                                    ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "BALLS",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "$balls/6",
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Game Over Message
                AnimatedOpacity(
                  opacity: balls == 6 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade600,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.shade300,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "🎉 GAME OVER 🎉",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Final Score: $runs Runs",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Action Button
                SizedBox(
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: balls < 6 ? bat : reset,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: balls < 6
                          ? Colors.green.shade700
                          : Colors.orange.shade700,
                      foregroundColor: Colors.white,
                      elevation: 10,
                      shadowColor: balls < 6
                          ? Colors.green.shade300
                          : Colors.orange.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      balls < 6 ? "🏏 BAT" : "🔄 RESET",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ); // Scaffold
  }
}
