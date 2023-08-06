import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:siddikbhai_c/Constants.dart';

import '../play_audio.dart';


class FifthSingle extends StatefulWidget {

  String? id;
  String? promito;
  String? chatga;
  String? audio;
  FifthSingle(this.id,this.promito,this.chatga,this.audio);

  @override
  State<FifthSingle> createState() => _FifthSingleState();
}

class _FifthSingleState extends State<FifthSingle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      height: 100,
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
          alignment: Alignment.center,
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width:15),
              GestureDetector(
                onTap: (){
                  String content = widget.promito!+"-"+widget.chatga!;
                  String audio = widget.audio!;
                  var logger = Logger();
                  logger.d("content: $audio");
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> PlayAudio(audio,content)));
                },
                behavior: HitTestBehavior.opaque,
                child:
              Icon(BootstrapIcons.play_circle, color: Colors.redAccent,size: 35,),),

              Expanded(child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.promito!, style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: Constants.BANGLAFONT,
                  ),),
                  Image.asset("assets/images/transfer.png",
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                  Text(widget.chatga!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: Constants.BANGLAFONT,
                    ),
                  ),
                ],
              ))

            ],
          )

      ),


    );
  }
}
