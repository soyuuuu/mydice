import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          title: const Text('My Dice',style: TextStyle(fontFamily: 'Quicksand',fontSize: 35),),
          backgroundColor: Colors.blue,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int Dice1Number = 0;
  int Dice2Number = 0;
  int Dice3Number = 0;
  int Sum = 0 ;

  void changeDice1Face() {
    setState(() {
      Dice1Number = Random().nextInt(6) + 1;
    });
  }
  void changeDice2Face() {
    setState(() {
      Dice2Number = Random().nextInt(6) + 1;
    });
  }
  void changeDice3Face() {
    setState(() {
      Dice3Number = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    Sum = Dice1Number+Dice2Number+Dice3Number;
    return Column(
        children:[
          SizedBox(height: 20),
          Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  child: Image.asset(
                    'images/dice$Dice1Number.png',
                  ),
                  onPressed: () {
                    changeDice1Face();
                  },
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Image.asset(
                    'images/dice$Dice2Number.png',
                  ),
                  onPressed: () {
                    changeDice2Face();
                  },
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Image.asset(
                    'images/dice$Dice3Number.png',
                  ),
                  onPressed: () {
                    changeDice3Face();
                  },
                ),
              ),
            ],
          ),
        ),
          SizedBox(height: 20),
          Text(
            'Sum = $Sum',
            style: TextStyle(fontFamily: 'Quicksand',fontSize: 35,color: Colors.white),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontFamily: 'Quicksand',fontSize: 35,color: Colors.white),

              primary: Colors.orange.shade300,
              onPrimary: Colors.orange.shade700,
            ),
            onPressed: () {
              setState(() {
                changeDice1Face();
                changeDice2Face();
                changeDice3Face();
              });
            },
            child: const Text(
                'Reroll',
            ),
          ),
      ],
    );
  }
}
