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
    await FirebaseFirestore.instance.collection("Teachers").add({'name':value,});

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
                name=value;
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
          TextButton(style:ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: const Text("audio",style: TextStyle(color: Colors.white),),
            onPressed: (){
            final assetsAudioPlayer = AssetsAudioPlayer();
            assetsAudioPlayer.open(
            Audio("assets/audio/ramsiya.mp3"),
            );
            },
          ),
          ElevatedButton(onPressed:(){
          Navigator.pushNamed(context, '/sc2');
          },child: Text("go to pg 2"))
    ]
    )
    );
  }
}
