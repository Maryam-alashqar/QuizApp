import 'package:flutter/material.dart';
import 'package:quiz_app/database/db.dart';
import 'package:quiz_app/view/questions/result_screen.dart';
import 'package:quiz_app/view/questions/widgets/quiz_item.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({super.key});

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  List<Question> questions = [];
  late PageController pageController;
  int score = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    DB.instance.fetchQuestions().then((question) => setState(
          () {
            questions = question;
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: questions.length >= 5
            ? const Center(child: Text('Quiz started'))
            : const Center(child: Text("Quiz App")),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: questions.length >= 5
          ? PageView.builder(
              controller: pageController,
              itemCount: questions.length,
              itemBuilder: (BuildContext context, int i) {
                return QuizItem(
                  questionNumber: i + 1,
                  questionLength: questions.length,
                  question: questions[i].question,
                  firstAnswer: questions[i].firstAnswer,
                  secondAnswer: questions[i].secondAnswer,
                  thirdAnswer: questions[i].thirdAnswer,
                  fourthAnswer: questions[i].fourthAnswer,
                  colorA: Colors.white,
                  colorB: Colors.white,
                  colorC: Colors.white,
                  colorD: Colors.white,
                  onTapAnswer1: () {
                    if (i + 1 < questions.length) {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                      if (questions[i].rightAnswer == 'A') {
                        score += 1;
                      } else {
                        score += 0;
                      }
                    } else if (i + 1 == questions.length) {
                      if (questions[i].rightAnswer == 'A') {
                        score += 1;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ResultScreen(score: score, q: questions)));
                      } else {
                        score += 0;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ResultScreen(score: score, q: questions)));
                      }
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                    q: questions,
                                    score: score,
                                  )));
                    }
                  },
                  onTapAnswer2: () {
                    if (i + 1 < questions.length) {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                      if (questions[i].rightAnswer == 'B') {
                        score += 1;
                      } else {
                        score += 0;
                      }
                    } else if (i + 1 == questions.length) {
                      if (questions[i].rightAnswer == 'B') {
                        score += 1;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ResultScreen(score: score, q: questions)));
                      } else {
                        score += 0;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ResultScreen(score: score, q: questions)));
                      }
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            q: questions,
                            score: score,
                          ),
                        ),
                      );
                    }
                  },
                  onTapAnswer3: () {
                    if (i + 1 < questions.length) {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                      if (questions[i].rightAnswer == 'C') {
                        score += 1;
                      } else {
                        score += 0;
                      }
                    } else if (i + 1 == questions.length) {
                      if (questions[i].rightAnswer == 'C') {
                        score += 1;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ResultScreen(score: score, q: questions)));
                      } else {
                        score += 0;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ResultScreen(score: score, q: questions)));
                      }
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            q: questions,
                            score: score,
                          ),
                        ),
                      );
                    }
                  },
                  onTapAnswer4: () {
                    if (i + 1 < questions.length) {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                      if (questions[i].rightAnswer == 'D') {
                        score += 1;
                      } else {
                        score += 0;
                      }
                    } else if (i + 1 == questions.length) {
                      if (questions[i].rightAnswer == 'D') {
                        score += 1;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ResultScreen(score: score, q: questions)));
                      } else {
                        score += 0;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ResultScreen(score: score, q: questions)));
                      }
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                    q: questions,
                                    score: score,
                                  )));
                    }
                  },
                );
              })
          : Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Sorry!",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "You must add at least 5 questions to start",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Image.asset(
                      "assets/images/faq.png",
                      width: 300,
                      height: 300,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        child: const Text(
                          "Back to home",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ]),
            ),
    );
  }
}
