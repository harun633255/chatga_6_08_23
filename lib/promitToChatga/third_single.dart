import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:siddikbhai_c/Constants.dart';

import '../play_audio.dart';


class ThirdSingle extends StatefulWidget {

  String? id;
  String? promito;
  String? chatga;
  String? audio;
  ThirdSingle({ required this.id,required this.promito,required this.chatga,required this.audio});

  @override
  State<ThirdSingle> createState() => _ThirdSingleState();
}

class _ThirdSingleState extends State<ThirdSingle> {
  @override
  Widget build(BuildContext context) {
    return

      Container(
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
              onTap: ()
              {
                String audio = widget.audio!;
                String content = widget.promito!+"-"+widget.chatga!;
                // logger.d("content: $audio");
                Navigator.push(context,MaterialPageRoute(builder: (context)=> PlayAudio(audio,content)));
              },
              child: Icon(BootstrapIcons.play_circle, color: Colors.redAccent,size: 35,),),
            Text(widget.promito!,
              style:  TextStyle(
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
            Text(widget.chatga!,
              style:  TextStyle(
                fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: Constants.FONT_SIZE,
              fontFamily: Constants.BANGLAFONT,
            ),
            ),
          ],
        )

      ),


    );
  }
}
