import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_card.dart';
class QuizDetailScreen extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   // final scoreNotifier = ref.read(.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Question 1: What is "Hello"in Spanish'),
            ElevatedButton(onPressed: (){
             // scoreNotifier.addPoints(10);
              Navigator.pop(context);
            },
            child: Text('Hola'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            },child: Text('Bonjour'),),
          ],
        ),
      ),
    );
  }
}