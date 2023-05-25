import 'package:flutter/material.dart';
import 'package:quiz_app/view/home/home_page.dart';
import 'package:quiz_app/view/questions/add_quiz.dart';
import 'package:quiz_app/view/questions/create_quiz.dart';
import 'package:quiz_app/view/questions/start_quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=> const HomePage(),
        'CreateQ':(context) => const CreateQuiz(),
        'StartQ':(context) => const StartQuiz(),
        'AddQ':(context) => const AddQuiz(),

      },
    );
  }
}
