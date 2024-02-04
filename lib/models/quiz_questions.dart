//Questions blueprint we are creating objects using classes

class QuizQuestion {
  //Constructor function
  const QuizQuestion(this.text, this.answers);

  //Properties
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    //List.of will create a copy of the answers list.
   final shuffledList = List.of(answers);
   //shuffle the copied list, so original is not affected.
   shuffledList.shuffle();
   return shuffledList;
  }
}