import 'package:flutter/material.dart';
import 'package:siddikbhai_c/probad/second.dart';

import 'package:flutter/material.dart';
import 'package:siddikbhai_c/Constants.dart';

import 'general_discussion.dart';

class FifthAllOptions extends StatefulWidget {

  String? id;
  String? title;
  bool? isEnglish;

  FifthAllOptions(this.id,this.title,this.isEnglish);

  @override
  State<FifthAllOptions> createState() => _FifthAllOptionsState();
}

class _FifthAllOptionsState extends State<FifthAllOptions> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> GeneralDiscussion(widget.id,widget.title)));
      },
      child: Container(
        height: 60,
        width: 60,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 3,
              blurRadius: 2.0,
              offset: Offset(2.0, 2.0),
            ),

          ],
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*Container(
                  height: 60,
                  width: 60,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                            imagePath).image,
                      )
                  )
              ),*/
              Text(widget.title!,
                style: TextStyle(
                  fontSize: widget.isEnglish! ? 15 : 17,
                  fontWeight: FontWeight.bold,
                  color: Constants.PRIMARYCOLOR,
                  fontFamily: "bangla",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

