import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:siddikbhai_c/Constants.dart';


class OneSingle extends StatelessWidget {

  String content;

  OneSingle(this.content);

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
            Icon(BootstrapIcons.play_circle,
            color: Colors.redAccent,
            ),
            Text(content,
              style: TextStyle(
                fontFamily: Constants.BANGLAFONT,
                fontSize: Constants.FONT_SIZE,
              ),
            ),
            Image.asset("assets/images/transfer.png",
              width: 20,
              height: 20,
              fit: BoxFit.cover,
            ),
            Text(content,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: Constants.BANGLAFONT,
                fontSize: Constants.FONT_SIZE,
              ),
            ),
          ],
        )
        
      ),


    );
  }
}
