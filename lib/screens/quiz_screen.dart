import 'package:flutter/material.dart';
import 'quiz_detail_screen.dart';
class QuizScreen extends StatelessWidget {
  final List<String>quiz=[
    'Quiz 1: Basic Greetings',
    'Quiz 2: Number Recognition',
    'Quiz 3: Color identification',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: ListView.builder(itemCount: quiz.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(quiz[index]),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>QuizDetailScreen()),
              );
            },
          );
        },
    ),
    );
  }
}