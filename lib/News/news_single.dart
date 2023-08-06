import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:siddikbhai_c/News/newsplay.dart';
import 'package:siddikbhai_c/probad/second.dart';

import 'package:flutter/material.dart';
import 'package:siddikbhai_c/Constants.dart';

class News_Single extends StatefulWidget {

  String? id;
  String? name;
  String? image;
  String? youtubeLink;


  News_Single(this.id,this.name,this.image,this.youtubeLink);

  @override
  State<News_Single> createState() => _News_SingleState();
}

class _News_SingleState extends State<News_Single> {
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          // go to home
           String? link = widget.youtubeLink;
           // explode link by ?v= get the second part
            List<String> parts = link!.split("?v=");
            String? id = parts[1];
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsPlay(id!)),
          );

        },
        child:
        Container(
          height: MediaQuery.of(context).size.height*0.45,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height*0.30,
                    padding: EdgeInsets.only(top: 15,left: 15,right: 15),
                    //width: MediaQuery.of(context).size.width*0.80,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15),),
                        shape: BoxShape.rectangle,
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                              widget.image!).image,
                        )
                    )
                ),
                SizedBox(height: 10,),
                Text(widget.name!,
                  style: TextStyle(
                    fontSize: 16 ,
                    fontWeight: FontWeight.bold,
                    color: Constants.PRIMARYCOLOR,
                    fontFamily: "bangla",
                  ),
                ),
              ],
            ),
          ),
        )
      );
  }
}

