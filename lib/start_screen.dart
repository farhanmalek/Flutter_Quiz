import 'package:flutter/material.dart';

// Define positions for our background gradient
const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

//Start Screen is a stateless widget, its UI is not changing.

class StartScreen extends StatelessWidget {
  // Define constructor function for initialization
  //We are telling startscreen what arg to expect.
  //startQuiz represents that switchscreen function thats been passed down.
  const StartScreen(this.startQuiz, {super.key});

  //Add final variable for the function arg
  final void Function() startQuiz;

//Here, we use the Center widget to center our widget in the container,
//Column will arrange our items in a column lay out, top to bottom, with the image, then text etc.
//SizedBox(), empty div essentially to provide some gapping initially no content inside.
//
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 200,
            color: const Color.fromARGB(176, 252, 252, 252),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            "Learn Flutter the fun way!!",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          //Using outlined button, when clicked will execute the startQuiz Function which will take us to the questions screen.
          //.icon allows us to include an icon in out cause the --->
          OutlinedButton.icon(
            onPressed: () {
              //executing the passing through function in an anon function
              startQuiz();
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Start Quiz"),
          )
        ],
      ),
    );
  }
}
