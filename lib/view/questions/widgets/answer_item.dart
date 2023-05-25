import 'package:flutter/material.dart';

class AnswerItem extends StatelessWidget {
  const AnswerItem(
      {super.key,
      required this.onTap,
      required this.answer,
      required this.color,
      required this.isListView});

  final Function onTap;
  final String answer;
  final Color color;
  final bool isListView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          onTap();
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 40,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: isListView == false
                ? Border.all(color: Colors.teal, width: 1)
                : null,
            color: color,
          ),
          child: Text(
            answer,
          ),
        ),
      ),
    );
  }
}
