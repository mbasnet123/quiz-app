import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({super.key,
    required this.answer,
    required this.onPress});

  final String answer;
  final void Function() onPress;

  @override
  Widget build(BuildContext context){
    return ElevatedButton(onPressed: onPress,
        style: ElevatedButton.styleFrom(
          // maximumSize: Size(30, 15),
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(28))
            )
        ),
        child: Text(answer));
  }
}