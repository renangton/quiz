import 'package:flutter/material.dart';
import 'package:quiz/view/quiz_page.dart';
import '../service/load_csv.dart';
import '../service/shuffle.dart';

class QuizApp extends StatelessWidget {
  QuizApp({Key? key}) : super(key: key);
  late List<Map> quizList;

  Future<void> goToQuizApp(BuildContext context) async {
    quizList = shuffle(await getCsvData('assets/quiz1.csv'));
    for (Map row in quizList) {
      debugPrint(row['question']);
    }

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuizPage(quizList)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'クイズ',
            ),
            ElevatedButton(
              onPressed: () {
                goToQuizApp(context);
              },
              child: const Text('スタート'),
            ),
          ],
        ),
      ),
    );
  }
}
