import 'package:audioplayers/audioplayers.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:siddikbhai_c/Constants.dart';

import '../play_audio.dart';


class FourthSingle extends StatefulWidget {

  String? id;
  String? chatga;
  String? english;
  String? audio;
  bool isPlaying = false;
  int? size;



  FourthSingle({required this.id,required this.chatga,required this.english,required this.audio,required this.size});

  @override
  State<FourthSingle> createState() => _FourthSingleState();
}

class _FourthSingleState extends State<FourthSingle> {


  AudioPlayer audioPlayer = AudioPlayer();
  Map<String,AudioPlayer> allPlayers = {};
  Map<String,bool> allPlaying = {};

  late AudioCache cache; // you have this
  AudioPlayer player= AudioPlayer();
  bool isPlaying = false;
  @override
  void initState() {
    // TODO: implement initState
    //initialize allPlayers
    for(int i = 0; i < widget.size!; i++){
      allPlayers[widget.id!] = AudioPlayer();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      height: 70,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.5, 0.5), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child:Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                //Goto audio playing page
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayAudio(widget.audio!,widget.english!+"-"+widget.chatga!)));
              },
              child:  Icon(BootstrapIcons.play_circle, color: Colors.redAccent,
              ),
            ),

            Text(widget.chatga!,
              style: TextStyle(
                color: Colors.black,
                fontSize: Constants.FONT_SIZE,
                fontFamily: Constants.BANGLAFONT,
              ),
            ),
            Image.asset("assets/images/transfer.png",
              width: 20,
              height: 20,
              fit: BoxFit.cover,
            ),
            Text(widget.english!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: Constants.ENG_FONT_SIZE,
                fontFamily: Constants.BANGLAFONT,
              ),
            ),
          ],
        )

      ),


    );
  }
}
