import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/models/quiz_questions.dart';
import 'package:quiz/reusable_widgets/answer_button.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key, required this.onSelectAnswer}) : super(key: key);

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var currentQuestionIndex = 0;
  var numCorrectAnswers = 0;
  var answersHistory = <Map<String, String>>[];

  void answerQuestion(String selectedAnswer) {
    final currentQuestion = questionsList[currentQuestionIndex];
    final isCorrect = selectedAnswer == currentQuestion.answers[0];
    if (isCorrect) {
      numCorrectAnswers++; // Increment numCorrectAnswers if answer is correct
    }
    answersHistory.add({
      'question': currentQuestion.text,
      'selectedAnswer': selectedAnswer,
      'correctAnswer': currentQuestion.answers[0],
      'isCorrect': isCorrect.toString(),
    });
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= questionsList.length) {
      // All questions have been answered, show results
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: Text('Quiz Results'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow.shade200, Colors.yellow.shade700],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You guessed $numCorrectAnswers out of ${questionsList.length} questions correctly!',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: answersHistory.length,
                    itemBuilder: (context, index) {
                      final answerData = answersHistory[index];
                      final isCorrect = answerData['isCorrect'] == 'true';
                      return ListTile(
                        title: Text(
                          'Question ${index + 1}: ${answerData['question']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Your answer: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: answerData['selectedAnswer'],
                                style: TextStyle(
                                  color: isCorrect ? Colors.green : Colors.red,
                                ),
                              ),
                              TextSpan(
                                text: '\nCorrect answer: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: answerData['correctAnswer'],
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Restart the quiz
                    setState(() {
                      currentQuestionIndex = 0;
                      numCorrectAnswers = 0;
                      answersHistory.clear();
                    });
                  },
                  child: Text('Restart Quiz'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final currentQuestion = questionsList[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text('Question ${currentQuestionIndex + 1}'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow.shade200, Colors.yellow.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(
                  answer: answer,
                  onPress: () {
                    answerQuestion(answer);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
