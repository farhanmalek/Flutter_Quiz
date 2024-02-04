import "package:flutter/material.dart";

//re-usable button widget. 
//Takes in 2 args, the answer text and the onTap which when pressed will take us to the next widget.

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        //symmetric allows us to change v and h padding individually
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          backgroundColor: const Color.fromARGB(255, 12, 4, 61),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      child: Text(answerText, textAlign: TextAlign.center,),
    );
  }
}
