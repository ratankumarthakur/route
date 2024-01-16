import 'package:bmi/screen_1.dart';
import 'package:flutter/material.dart';

class sc2 extends StatefulWidget {
  const sc2({super.key});

  @override
  State<sc2> createState() => _sc2State();
}

class _sc2State extends State<sc2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(onPressed: (){
        Navigator.pushNamed(context, '/sc');
      },child: Text("go to page 1"),),
    );
  }
}
