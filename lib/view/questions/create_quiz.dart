import 'package:flutter/material.dart';
import 'package:quiz_app/view/questions/widgets/quiz_item.dart';
import '../../database/db.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({super.key});

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  List<Question> questions = [];
  @override
  void initState() {
    super.initState();
    questions.clear();
    DB.instance.fetchQuestions().then((q) => setState(
          () {
            questions = q;
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text('Create Quiz'),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () =>
                      {Navigator.pushReplacementNamed(context, 'AddQ')},
                  child: const Text(
                    "+ Add new question",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 600,
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: questions.length,
                  itemBuilder: (BuildContext context, int i) {
                    return QuizItem(
                      colorA: questions[i].rightAnswer == 'A'
                          ? Colors.green
                          : Colors.white,
                      colorB: questions[i].rightAnswer == 'B'
                          ? Colors.green
                          : Colors.white,
                      colorC: questions[i].rightAnswer == 'C'
                          ? Colors.green
                          : Colors.white,
                      colorD: questions[i].rightAnswer == 'D'
                          ? Colors.green
                          : Colors.white,
                      isListView: true,
                      delete: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Delete Question"),
                                content: const Text(
                                    "Are you sure you want to delete this question?"),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("Cancel")),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            DB.instance.deleteQuestion(
                                                questions[i].id);
                                            questions.removeWhere((element) =>
                                                element.id == questions[i].id);
                                          });
                                          Navigator.pop(context);
                                          const snackBar = SnackBar(
                                              content:
                                                  Text("Question Deleted"));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        },
                                        child: const Text(
                                          "Delete",
                                          style: TextStyle(color: Colors.teal),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            });
                      },
                      question: questions[i].question,
                      firstAnswer: questions[i].firstAnswer,
                      secondAnswer: questions[i].secondAnswer,
                      thirdAnswer: questions[i].thirdAnswer,
                      fourthAnswer: questions[i].fourthAnswer,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
