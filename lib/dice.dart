import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  const Dice({super.key});

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
                    Expanded(child: Image.asset('image/dice1.png')),
                    const SizedBox(width: 20),
                    Expanded(child: Image.asset('image/dice2.png')),
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
