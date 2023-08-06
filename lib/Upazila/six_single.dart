import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/probad/second.dart';

class SixSingle extends StatefulWidget {

  String? id;
  String? name;
  String? history;
  String? bittranto;
  String? emergency;
  String? catid;


  SixSingle(this.id,this.name,this.history,this.bittranto,this.emergency,this.catid);

  @override
  State<SixSingle> createState() => _SixSingleState();
}

class _SixSingleState extends State<SixSingle> {
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
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.star_border,color: Constants.PRIMARYCOLOR,),
                  Text(widget.name!,
                    style: TextStyle(
                      color: Constants.PRIMARYCOLOR,
                      fontFamily: Constants.BANGLAFONT,
                      fontSize: 25,
                    ),
                  ),

                ],
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  //show awsomedialog
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.noHeader,
                   // animType: AnimType.BOTTOMSLIDE,
                    title: 'ইতিহাস',
                    desc: widget.history!,
                   /* btnOkOnPress: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => Home()));
                    },*/
                   // btnOkIcon: Icons.check_circle,
                  ).show();
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.history_edu,color: Constants.PRIMARYCOLOR,),
                        Text(" ইতিহাস",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Constants.FONT_SIZE,
                            fontFamily: Constants.BANGLAFONT,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Constants.PRIMARYCOLOR,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  //show awsomedialog
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.noHeader,
                   // animType: AnimType.BOTTOMSLIDE,
                    title: 'উপজেলা বৃত্তান্ত',
                    desc: widget.bittranto!,
                   /* btnOkOnPress: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => Home()));
                    },*/
                   // btnOkIcon: Icons.check_circle,
                  ).show();
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.description,color: Constants.PRIMARYCOLOR,),
                        Text(" উপজেলা বৃত্তান্ত",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Constants.FONT_SIZE,
                            fontFamily: Constants.BANGLAFONT,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Constants.PRIMARYCOLOR,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  //show awsomedialog
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.noHeader,
                   // animType: AnimType.BOTTOMSLIDE,
                    title: 'ইমার্জেন্সি',
                    desc: widget.emergency!,
                   /* btnOkOnPress: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => Home()));
                    },*/
                   // btnOkIcon: Icons.check_circle,
                  ).show();
                },
                child:
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.emergency_outlined,color: Constants.PRIMARYCOLOR,),
                        Text(" ইমার্জেন্সি",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Constants.FONT_SIZE,
                            fontFamily: Constants.BANGLAFONT,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Constants.PRIMARYCOLOR,
                    ),
                  ],
                ),
              ),






            ],
          ),
        ),
      );
  }
}

