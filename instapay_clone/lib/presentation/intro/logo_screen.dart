import 'package:flutter/material.dart';
import 'package:instapay_clone/ui/color.dart' as color;

class LogoScreen extends StatelessWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: color.key
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('imgs/logo_white.png',scale: 0.8,),
          ],
        ),
      ),
    );
  }
}
