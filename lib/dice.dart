import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
            backgroundColor: Colors.redAccent, title: const Text('Dice game')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //가로 가운데 정렬
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,//세로 가운데 정렬
                  children: [
                    Expanded(child: Image.asset('image/dice$leftDice.png')),
                    const SizedBox(width: 20),
                    Expanded(child: Image.asset('image/dice$rightDice.png')),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ButtonTheme(
                minWidth: 100,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      leftDice = Random().nextInt(6) + 1;
                      rightDice = Random().nextInt(6) + 1;
                    });
                    flutterToast("L: {$leftDice} / R: {$rightDice}");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

void flutterToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      backgroundColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16,
      textColor: Colors.black);
}
