import 'package:flutter/material.dart';
import 'package:quiz_app/database/db.dart';
import 'package:quiz_app/view/home/home_page.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.score,
    required this.q,
  });
  final int score;
  final List<Question> q;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String getTitle() {
    if (widget.score >= widget.q.length * 0.75) {
      return "Congrats!";
    } else if (widget.score >= widget.q.length * 0.50) {
      return "Good job!";
    } else {
      return "Oops!";
    }
  }

  String getBody() {
    if (widget.score >= widget.q.length * 0.75) {
      return 'assets/images/result.jpg';
    } else if (widget.score >= widget.q.length * 0.50) {
      return 'assets/images/result.jpg';
    } else {
      return 'assets/images/fail.png';
    }
  }

  String getMessage() {
    if (widget.score >= widget.q.length * 0.75) {
      return "You did great!";
    } else if (widget.score >= widget.q.length * 0.50) {
      return "You passed!";
    } else {
      return "Sorry, better luck next time!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            getTitle(),
            style: const TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Image.asset(getBody()),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Your Score : ${widget.score} / ${widget.q.length}',
            style: const TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            getMessage(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const HomePage();
                    }));
                  });
                },
                child: const Text(
                  "Back to home",
                  style: TextStyle(fontSize: 18),
                )),
          ),
        ],
      ),
    );
  }
}
