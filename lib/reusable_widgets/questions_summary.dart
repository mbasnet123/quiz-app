// import 'package:flutter/material.dart';
//
// class QuestionsSummary extends StatelessWidget {
//   const QuestionsSummary(this.summaryData,{super.key});
//
//   final List<Map<String, Object>> summaryData;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 400,
//       child: Container(
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [Colors.yellow.shade200, Colors.yellow.shade700],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight)),
//         // margin: const EdgeInsets.symmetric(horizontal: 20,),
//         child: SingleChildScrollView(
//           child: Column(
//             children: summaryData.map((data) {
//               bool isCorrect = data["user_answer"] == data["correct_answer"];
//               Color answerColor = isCorrect? Colors.green:Colors.red;
//               return Row(
//                 children: [
//                   Text(((data["question_index"] as int) + 1).toString(),
//                     style: const TextStyle(
//                       fontSize: 20,
//                     ),),
//                   Expanded(
//                     child: Column(
//                       children: [
//                         Text(data["question"] as String,
//                           style: const TextStyle(
//                             fontSize: 18,
//                           ),
//                           textAlign: TextAlign.center,),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(data["user_answer"] as String,
//                           style: TextStyle(
//                               color: answerColor,
//                               fontSize: 20
//                           ),),
//                         if(!isCorrect)
//                           Text(data["correct_answer"] as String,
//                             style: const TextStyle(
//                               color: Colors.green,
//                               fontSize: 20,
//                             ),),
//                       ],
//                     ),
//                   )
//                 ],
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }
