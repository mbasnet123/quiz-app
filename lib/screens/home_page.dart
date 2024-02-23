import 'package:flutter/material.dart';
import 'package:quiz/screens/question_screen.dart';

class HomePage extends StatelessWidget {
  // const HomePage(this.startQuiz, {super.key});
  const HomePage({super.key});

  // final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.yellow.shade200, Colors.yellow.shade700],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Opacity(
                opacity: 0.5,
                child: Image.network(
                    "https://media.istockphoto.com/id/1436198045/photo/question-mark-with-speech-bubble-on-yellow-background.jpg?s=2048x2048&w=is&k=20&c=j5F_wF9lBZu_oCxB_EnK-Janm8zehpqMODhqTCagWag="),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Learn history the easy way",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return QuestionPage(onSelectAnswer: (String answer) {  },);
                  },));
                },
                icon: const Icon(Icons.start),
                label: const Text("Run Quiz"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
