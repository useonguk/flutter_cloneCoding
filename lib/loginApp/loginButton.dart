import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    this.image,
    this.onPressed,
    this.color,
    this.radius,
    this.text,
  }) : super(key: key);

  final Widget? image;
  final Widget? text;
  final Color? color;
  final double? radius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.white, // 원하는 색상으로 설정 가능
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(radius ?? 0.0), // 원하는 radius로 설정 가능
          ),
        ),
        onPressed: onPressed, // 실제 onPressed 함수 연결
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (image != null) image!, //null safety랑 관련된 !
              if (text != null) text!,
              Opacity(
                opacity: 0,
                child: Image.asset(
                  'assets/images/dice2.png', // 이미지 경로 수정
                  width: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
