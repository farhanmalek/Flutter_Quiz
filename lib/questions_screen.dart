// import packages
import 'package:flutter/material.dart';
import 'package:second_app/answer_button.dart';
//import google fonts
import 'package:google_fonts/google_fonts.dart';

//import questions
import 'package:second_app/data/questions.dart';

//This widget is stateful.
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer,{super.key});

  final void Function (String answer) onSelectAnswer;

  //We dont add build methods for stateful widgets, work with 2 classes when using stateful widgets
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    //widget, accesses all the props and methods of the widget class for us to use in the state class
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    //We use sizebox here over container, its more simpler, is focused on providing fixed w and h, and doesnt get too fancy w design.
    return SizedBox(
      //Takes up all horizontal space within parent container.
      width: double.infinity,
      //Column arrangement for question and button
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          //this is like flexbox where all the items are centered
          mainAxisAlignment: MainAxisAlignment.center,
          //stretch out all the items in the horz direction to take up width of screen.
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ) ,
              //Center text
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: 30,
            ),
            //when iterating over values inside the children arg: because it can only accept a list of widgets,
            // we need to spread our mapped array.
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answer,
              () {
                answerQuestion(answer);
              },
              );
            })
          ],
        ),
      ),
    );
  }
}
