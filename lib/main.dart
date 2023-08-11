import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 50)),
            const Center(
              child: Image(
                image: AssetImage('image/chef.gif'),
                width: 170,
                height: 190,
              ),
            ),
            Form(
              child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.teal,
                      inputDecorationTheme: const InputDecorationTheme(
                          //텍스트 필드 레이더 디자인을 위한것
                          labelStyle:
                              TextStyle(color: Colors.teal, fontSize: 15))),
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: <Widget>[
                        const TextField(
                          decoration: InputDecoration(labelText: "주사위 시자르"),
                          keyboardType:
                              TextInputType.emailAddress, //e메일 관련 키보드 올라옴
                        ),
                        const TextField(
                          decoration: InputDecoration(labelText: "비밀번호"),
                          keyboardType: TextInputType.text,
                          obscureText: true, //비밀번호 비밀 처리
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ButtonTheme(
                            minWidth: 100, //최소크기
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orangeAccent),
                                child: const Icon(Icons.arrow_forward,
                                    color: Colors.white, size: 35))),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
