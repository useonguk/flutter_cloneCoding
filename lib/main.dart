import 'package:flutter/material.dart';
import './dice.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      // home: LogIn(),
      home: Dice(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  // TextEditingController를 사용을 더이상 하지 않을때 리소스낭비를 최소화 할 수 있는 dispose method를 실행시켜줘야한다.

  @override
  void dispose() {
    controller.dispose(); //dispose()를 호출하면 메모리 누수를 방지할 수 있다.
    controller2.dispose();
    super.dispose();
  }

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
      body: Builder(builder: (context) {
        return GestureDetector(
          //사용자의 행동을 감지하는 위젯
          onTap: () {
            FocusScope.of(context).unfocus();
          }, //화면의 빈곳을 누를때 나타남
          child: SingleChildScrollView(
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
                            TextField(
                              // autofocus: true,//실행되자마지 focus주기
                              controller: controller,
                              decoration:
                                  const InputDecoration(labelText: "주사위 시자르"),
                              keyboardType:
                                  TextInputType.emailAddress, //e메일 관련 키보드 올라옴
                            ),
                            TextField(
                              controller: controller2,
                              decoration:
                                  const InputDecoration(labelText: "비밀번호"),
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
                                    onPressed: () {
                                      if (controller.text == "dice" &&
                                          controller2.text == "1234") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const Dice()));
                                      } else if (controller.text != "dice" &&
                                          controller2.text == "1234") {
                                        showSnackBar2(context);
                                      } else if (controller.text == "dice" &&
                                          controller2.text != "1234") {
                                        showSnackBar3(context);
                                      } else {
                                        showSnackBar(context);
                                      }
                                    },
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
      }),
    );
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      '로그인 정보를 다시 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      '비밀번호 일치하지 않음',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

void showSnackBar3(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      '다이스의 철자를 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}
