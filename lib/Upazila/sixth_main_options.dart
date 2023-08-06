import 'package:flutter/material.dart';
import 'package:siddikbhai_c/probad/second.dart';

import 'package:flutter/material.dart';
import 'package:siddikbhai_c/Constants.dart';

class SixthMainOptions extends StatelessWidget {

  String imagePath,title;


  SixthMainOptions(this.imagePath,this.title);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: MediaQuery.of(context).size.height*0.35,
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
          //padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height*0.28,
                  //width: MediaQuery.of(context).size.width*0.80,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15),),
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                            imagePath).image,
                      )
                  )
              ),
              SizedBox(height: 10,),
              Text(title,
                style: TextStyle(
                  fontSize: 25 ,
                  fontWeight: FontWeight.bold,
                  color: Constants.PRIMARYCOLOR,
                  fontFamily: "bangla",
                ),
              ),
            ],
          ),
        ),
      );
  }
}

