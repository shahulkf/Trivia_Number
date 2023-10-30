import 'package:flutter/material.dart';
import 'package:number_trivia/api.dart';

class NumberTrivia extends StatefulWidget {
  NumberTrivia({super.key});

  @override
  State<NumberTrivia> createState() => _NumberTriviaState();
}

class _NumberTriviaState extends State<NumberTrivia> {
  final numberInputController = TextEditingController();

  String resultText = 'Type Number To Get Result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TRIVIA')),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: numberInputController,
                decoration: InputDecoration(
                    hintText: 'Enter Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(29))),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: ()async {
                    final numbers = numberInputController.text;
                   final _result =  await getNumberFact(number: numbers);
                     print(_result.text);
                     setState(() {
                       resultText =_result.text??'No Trivia Found';
                     });
                  },
                  child: Text('Result')),
                  SizedBox(height: 25,),

              Text(resultText),
            ],
          ),
        ),
      )),
    );
  }
}
