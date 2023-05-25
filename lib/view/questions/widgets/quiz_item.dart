import 'package:flutter/material.dart';
import 'package:quiz_app/view/questions/widgets/answer_item.dart';

class QuizItem extends StatelessWidget {
  const QuizItem(
      {super.key,
      required this.question,
      required this.firstAnswer,
      required this.secondAnswer,
      required this.thirdAnswer,
      required this.fourthAnswer,
      this.isListView = false,
      this.delete,
      required this.colorA,
      required this.colorB,
      required this.colorC,
      required this.colorD,
      this.onTapAnswer1,
      this.onTapAnswer2,
      this.onTapAnswer3,
      this.onTapAnswer4,
      this.questionNumber,
      this.questionLength});

  final int? questionNumber;
  final int? questionLength;
  final String question;
  final String firstAnswer;
  final String secondAnswer;
  final String thirdAnswer;
  final String fourthAnswer;
  final bool isListView;
  final Function? delete;
  final Color colorA;
  final Color colorB;
  final Color colorC;
  final Color colorD;
  final Function? onTapAnswer1;
  final Function? onTapAnswer2;
  final Function? onTapAnswer3;
  final Function? onTapAnswer4;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment:
            isListView ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        mainAxisAlignment: isListView
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.center,
        children: [
          if (isListView == true) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  question,
                  style: const TextStyle(fontSize: 15),
                ),
                const Spacer(),
                SizedBox(
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.grey,
                    onPressed: () {
                      delete!();
                    },
                  ),
                ),
              ],
            ),
          ] else ...[
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Question $questionNumber ',
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "/ $questionLength",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: 420,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.teal),
              child: Text(
                question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
          AnswerItem(
              isListView: isListView,
              onTap: () {
                onTapAnswer1!();
              },
              answer: firstAnswer,
              color: colorA),
          AnswerItem(
              isListView: isListView,
              onTap: () {
                onTapAnswer2!();
              },
              answer: secondAnswer,
              color: colorB),
          AnswerItem(
              isListView: isListView,
              onTap: () {
                onTapAnswer3!();
              },
              answer: thirdAnswer,
              color: colorC),
          AnswerItem(
              isListView: isListView,
              onTap: () {
                onTapAnswer4!();
              },
              answer: fourthAnswer,
              color: colorD),
        ],
      ),
    );
  }
}
