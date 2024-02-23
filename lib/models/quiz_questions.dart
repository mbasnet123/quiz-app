import 'package:flutter/material.dart';

class QuizQuestion {
  QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}

List<QuizQuestion> questionsList = [
  QuizQuestion("Which ancient civilization built the Great Pyramid of Giza?", [
    "Ancient Egyptians",
    "Ancient Greeks",
    "Mesopotamians",
    "Romans"
  ],),

  QuizQuestion("Who was the first president of the United States?", [
    "George Washington",
    "Thomas Jefferson",
    "Abraham Lincoln",
    "John Adams"
  ],),

  QuizQuestion("Which event marked the beginning of World War II in Europe?", [
    "Invasion of Poland",
    "Attack on Pearl Harbor",
    "Battle of Stalingrad",
    "Bombing of Hiroshima"
  ],),

  QuizQuestion("Who was the first female Prime Minister of the United Kingdom?", [
    "Margaret Thatcher",
    "Theresa May",
    "Queen Elizabeth II",
    "Angela Merkel"
  ],),

  QuizQuestion("What year did the Berlin Wall fall?", [
    "1989",
    "1961",
    "1991",
    "1975"
  ],),

  QuizQuestion("Which ancient civilization is known for its contributions to philosophy, democracy, and the Olympic Games?", [
    "Ancient Greeks",
    "Ancient Romans",
    "Ancient Egyptians",
    "Ancient Mesopotamians"
  ],),

  QuizQuestion("Who was the leader of the Soviet Union during much of the Cold War?", [
    "Joseph Stalin",
    "Vladimir Lenin",
    "Mikhail Gorbachev",
    "Nikita Khrushchev"
  ],),

  QuizQuestion("Which explorer is credited with discovering the sea route to India from Europe?", [
    "Vasco da Gama",
    "Christopher Columbus",
    "Ferdinand Magellan",
    "Marco Polo"
  ],),

  QuizQuestion("In what year did the American colonies declare independence from Britain?", [
    "1776",
    "1789",
    "1800",
    "1812"
  ],),

  QuizQuestion("Which treaty formally ended World War I?", [
    "Treaty of Versailles",
    "Treaty of Paris",
    "Treaty of Brest-Litovsk",
    "Treaty of Trianon"
  ],)
];

