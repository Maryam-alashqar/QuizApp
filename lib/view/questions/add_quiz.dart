import 'package:flutter/material.dart';
import 'package:quiz_app/database/db.dart';
import 'package:quiz_app/view/questions/create_quiz.dart';
import 'package:quiz_app/view/questions/widgets/my_text_field.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({super.key});

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  String? dropdownValue = 'A';
  TextEditingController question = TextEditingController();
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  TextEditingController d = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(
          child: Text('Add new Question'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: question,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.question_mark),
                hintText: 'Question',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          MyTextField(
            label: "First answer",
            image:
                "https://ui-avatars.com/api/?background=FFBF00&color=fff&name=A",
            controller: a,
          ),
          const SizedBox(
            height: 8.0,
          ),
          MyTextField(
              controller: b,
              label: "Second answer",
              image:
                  "https://ui-avatars.com/api/?background=00aa00&color=fff&name=B"),
          const SizedBox(
            height: 8.0,
          ),
          MyTextField(
              controller: c,
              label: "Third answer",
              image:
                  "https://ui-avatars.com/api/?background=708090&color=fff&name=C"),
          const SizedBox(
            height: 8.0,
          ),
          MyTextField(
              controller: d,
              label: "Fourth answer",
              image:
                  "https://ui-avatars.com/api/?background=d62977&color=fff&name=D"),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Select the correct answer ",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 50,
                  child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(10),
                      value: dropdownValue,
                      items: <String>['A', 'B', 'C', 'D']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                            value: value,
                            child: Center(
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.teal),
                              ),
                            ));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      }),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 7,
                  backgroundColor: const Color.fromARGB(255, 2, 138, 124),
                  shadowColor: Colors.black,
                  minimumSize: const Size(300, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                setState(() {
                  addQuestion(Question(
                      question: question.text,
                      firstAnswer: a.text,
                      secondAnswer: b.text,
                      thirdAnswer: c.text,
                      fourthAnswer: d.text,
                      rightAnswer: dropdownValue!));
                  question.clear();
                  a.clear();
                  b.clear();
                  c.clear();
                  d.clear();
                  dropdownValue = 'A';
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const CreateQuiz()));
                });
              },
              child: const Text(
                "Add question",
                style: TextStyle(fontSize: 16),
              ))
        ],
      ),
    );
  }

  Future addQuestion(Question question) async {
    await DB.instance.insertQuestion(question);
  }
}
