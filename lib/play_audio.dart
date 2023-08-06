import 'package:audioplayers/audioplayers.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:siddikbhai_c/Constants.dart';

class PlayAudio extends StatefulWidget {

  String audio;
  String content;
  PlayAudio(this.audio,this.content);

  @override
  State<PlayAudio> createState() => _PlayAudioState();
}


class _PlayAudioState extends State<PlayAudio> {

  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = true;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  initState() {
    super.initState();
    audioPlayer.play(UrlSource(widget.audio));
    setState(() {
      audioPlayer.onPlayerComplete.listen((event) {
        Navigator.pop(context);
      });
    });
   audioPlayer.onDurationChanged.listen((newDuration) {
     setState(() {
       duration = newDuration;
     });
   });
   audioPlayer.onPositionChanged.listen((newPosition) {
     setState(() {
       position = newPosition;
     });
   });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.pause();
    audioPlayer.stop();
    audioPlayer.dispose();
    audioPlayer.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: GestureDetector(child:
        Container(
          alignment: Alignment.center,
          color: Colors.white,
          padding: EdgeInsets.only(top: 80,left: 20,right: 20,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/ll.png",height: 120,width: 120,),
              ),
              Slider(
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey,
                  thumbColor: Constants.PRIMARYCOLOR,
                  min:0,
                  max:duration.inSeconds.toDouble(),
                  value:position.inSeconds.toDouble(),
                  onChanged: (value)async{
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);
                  }
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // show the position in timeformat in textview
                  Text(position.toString().split(".")[0],style: TextStyle(color: Colors.black,fontSize: 15),),
                 // Text(position.toString()),
                  Text((duration-position).toString().split(".")[0],style: TextStyle(color: Colors.black,fontSize: 15),),
                ],
              ),
              SizedBox(height: 30,),
              Text(widget.content,
              style: TextStyle(
                fontSize: 18,
                fontFamily: Constants.BANGLAFONT,
                color: Colors.black,
              ),
              ),
              SizedBox(height: 30,),
              Icon(isPlaying ? BootstrapIcons.pause_circle : BootstrapIcons.play_circle, color: Constants.PRIMARYCOLOR,size: 60,),
            ],
          ),
        ),
          onTap: (){
            setState(() {

              if(isPlaying){
                audioPlayer.pause();
              }else{
                audioPlayer.resume();
              }
              isPlaying = !isPlaying;
            });
          },
        ),
      ),
    );
  }
}
