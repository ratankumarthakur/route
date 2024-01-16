import 'package:bmi/screen_1.dart';
import 'package:bmi/screen_2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:  FirebaseOptions(
          apiKey: "AIzaSyAvr9wIyrDBEq6Lv1wAl7e6N30FKt9iJME",
          appId: "1:685103828281:android:0b6b0930185856e2ff2ce8",
          messagingSenderId: "685103828281",
          projectId: "crud-at-firebase-f0e04")
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: sc(),
      routes: {
        '/sc2':(context)=>sc2(),
        '/sc':(context)=>sc(),

      },
    ); // MaterialApp
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result = "";
  var bgcolor = Colors.purple.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BODY MASS INDEX"),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ), body: Container(
      color: bgcolor,
      child: Center(
        child: Container(
          width: 300,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Container(
              height: 20,
            ),
              Image.asset("assets/images/img_1.png", width: 100, height: 100),

              TextField(
                controller: wtcontroller,
                decoration: const InputDecoration(
                    label: Text("enter your weight in kg"),
                    labelStyle: TextStyle(color: Colors.purple),
                    prefixIcon: FaIcon(FontAwesomeIcons.weightScale, size: 20,
                      color: Colors.purple,)
                ), keyboardType: TextInputType.number,
              ),
              Container(
                height: 10,
              ),

              TextField(
                controller: ftcontroller,
                decoration: const InputDecoration(
                    label: Text("enter your height in feet"),
                    labelStyle: TextStyle(color: Colors.purple),
                    prefixIcon: FaIcon(FontAwesomeIcons.horseHead, size: 20,
                      color: Colors.purple,)
                ), keyboardType: TextInputType.number,
              ),
              Container(
                height: 10,
              ),

              TextField(
                controller: incontroller,
                decoration: const InputDecoration(
                    label: Text("enter your height in inches"),
                    labelStyle: TextStyle(color: Colors.purple),
                    prefixIcon: FaIcon(FontAwesomeIcons.horseHead, size: 20,
                      color: Colors.purple,)
                ), keyboardType: TextInputType.number,
              ),
              Container(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.purple),
                child: const Text('Calculate',style: TextStyle(color: Colors.white),),
                onPressed: () {
                  var wt = wtcontroller.text.toString();
                  var ft = ftcontroller.text.toString();
                  var inch = incontroller.text.toString();

                  if (wt != "" && ft != "" && inch != "") {
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var t1 = (iFt * 12) + iInch;
                    var t2 = t1 * 2.54;
                    var t3 = t2 / 100;
                    var bmi = iWt / (t3 * t3);


                    var msg = "";


                    if (bmi > 25) {
                      msg = "You are overweight";
                      bgcolor = Colors.red.shade400;
                    } else if (bmi <= 18) {
                      msg = "You are underweight";
                      bgcolor = Colors.yellow;
                    } else {
                      msg = "You are healthy";
                      bgcolor = Colors.green.shade500;
                    }
                    setState(() {
                      result = "$msg \nYour BMI is : ${bmi.toStringAsFixed(
                          2)} ";
                    });
                  } else {
                    setState(() {
                      result = "please fill all the slots";
                    });
                  }
                },
              ), Container(
                height: 20,
              ),
              Text(result,
                style: const TextStyle(fontSize: 24, color: Colors.black),)

            ],
          ),
        ),
      ),
    ),
        
    );
  }
}