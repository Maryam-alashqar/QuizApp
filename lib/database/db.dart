import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static final DB instance = DB._init();
  DB._init();

  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await dbInit();
      return _db;
    } else {
      return _db;
    }
  }

  dbInit() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "quiz.db");
    Database myDb = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return myDb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE 'quiz'(
  'id' INTEGER PRIMARY KEY AUTOINCREMENT ,
  'question' TEXT NOT NULL ,
  'first_answer' TEXT NOT NULL ,
  'second_answer' TEXT NOT NULL ,
  'third_answer' TEXT NOT NULL ,
  'fourth_answer' TEXT NOT NULL ,
  'right_answer' TEXT NOT NULL
)
''');
  }

  Future<List<Question>> fetchQuestions() async {
    Database? myDb = await db;
    final List<Map<String, dynamic>> res = await myDb!.query('quiz');
    return List.generate(
        res.length,
        (i) => Question(
            id: res[i]['id'],
            question: res[i]['question'],
            firstAnswer: res[i]['first_answer'],
            secondAnswer: res[i]['second_answer'],
            thirdAnswer: res[i]['third_answer'],
            fourthAnswer: res[i]['fourth_answer'],
            rightAnswer: res[i]['right_answer']));
  }

  Future<void> insertQuestion(Question question) async {
    Database? myDb = await db;
    await myDb!.insert(
      'quiz',
      question.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteQuestion(int id) async {
    Database? myDb = await db;
    await myDb!.delete(
      'quiz',
      where: 'id =?',
      whereArgs: [id],
    );
  }
}

class Question {
  int id;
  String question;
  String firstAnswer;
  String secondAnswer;
  String thirdAnswer;
  String fourthAnswer;
  String rightAnswer;

  Question({
    this.id = 0,
    required this.question,
    required this.firstAnswer,
    required this.secondAnswer,
    required this.thirdAnswer,
    required this.fourthAnswer,
    required this.rightAnswer,
  });

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'first_answer': firstAnswer,
      'second_answer': secondAnswer,
      'third_answer': thirdAnswer,
      'fourth_answer': fourthAnswer,
      'right_answer': rightAnswer,
    };
  }
}
