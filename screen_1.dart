//What I learnt new 
//simplest way to play audio
//shortcut to navigate to a different page
//Textfield onChanged function
//decide background color of textbutton

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class sc extends StatefulWidget {
  const sc({super.key});

  @override
  State<sc> createState() => _scState();
}

class _scState extends State<sc> {

  addData(value)async{
    await FirebaseFirestore.instance.collection("Teachers").add({'name':value,});       //we have better ways to add data, leave it

  }
  String name="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        children:[
          TextField(
            onChanged: (value){
              setState((){
                name=value;               //this will set name = whatever we type as it will be reflected as soon as we type or erase a letter
              });
            },
            decoration: const InputDecoration(
              hintText: "Enter your name",
            ),keyboardType: TextInputType.text,
          ),
          ElevatedButton(child: const Text("click it to enter data in firestore"),
            onPressed: (){
            addData(name);
          },),
          TextButton(style:ElevatedButton.styleFrom(backgroundColor: Colors.white),    //this is how we give background color to textbutton ,useless bro
            child: const Text("audio",style: TextStyle(color: Colors.white),),
            onPressed: (){
            final assetsAudioPlayer = AssetsAudioPlayer();       //these three lines of code will play audio from asset
            assetsAudioPlayer.open(
            Audio("assets/audio/ramsiya.mp3"),
            );
            },
          ),
          ElevatedButton(onPressed:(){
          Navigator.pushNamed(context, '/sc2');             //shortcut to navigate to a different page , I don't feel to use it as of now
          },child: Text("go to pg 2"))
    ]
    )
    );
  }
}
