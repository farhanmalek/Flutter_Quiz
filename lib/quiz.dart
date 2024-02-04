//All our imports, material package and other widgets
import 'package:second_app/data/questions.dart';
import 'package:second_app/questions_screen.dart';
import 'package:second_app/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:second_app/results_screen.dart';

//Creating a stateful widget, standard jargon, 
//Made up of 2 parts, stateful and stateless. 
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

//Manipulate state in here.
class _QuizState extends State<Quiz> {
  //empty list to store selected answers
  List<String> selectedAnswers = [];

  //initial screen of the app
  var activeScreen = 'start-screen';

//A method which can let us change what screen we see based on the click of a button
  void switchScreen() {
    // we can call setState inside any class that extends state, perform state
    //change
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

//method will add answers to selectedAnswers list.
  void chooseAnswer(String answer) {
    //kinda like js .push.
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        
        activeScreen = 'results-screen';
      });
    }

  }

  void startScreen () {
    setState(() {
      activeScreen = 'start-screen';
    });
  }


  @override
  //build method runs when widget mounts and anything the state changes essentially causing a re-render.
  Widget build(BuildContext context) {
    //initially set to the mainscreen, if button is pressed, change to questions screen.
    //screenWidget is of type Widget. switchscreen is passed into the StartScreen widget as an argument so we can use it inside that widget. Like props.
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
        screenWidget =  QuestionsScreen(chooseAnswer);

    }

    if(activeScreen == 'results-screen') {
      screenWidget =  ResultsScreen(selectedAnswers, startScreen);
    }

    if(activeScreen == 'start-screen') {
      selectedAnswers = [];
      screenWidget =  StartScreen(switchScreen);
    }

//All apps will mainly start with material app.
//Scaffold is like the skeleton, provides layout structure.
//Container like a div in html, we use BoxDecoration to affect appearance of a container.
//child of the container is the screenWidget, which will either be the start screen or the questions screen.
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.deepPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
