import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:second_app/data/questions.dart';
import 'package:second_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, this.startScreen, {super.key});

  final List<String> chosenAnswers;
  final void Function() startScreen;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer':
            questions[i].answers[0], //First answer in data is correct
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: startScreen,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // Text color
                backgroundColor: Colors.blue, // Background color
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8.0), // Padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
              ),
              child: const Text(
                "Restart Quiz!",
                style: TextStyle(
                  fontSize: 16.0, // Font size
                  fontWeight: FontWeight.bold, // Font weight
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
