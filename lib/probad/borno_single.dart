import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/NetworkCall/model/probad.dart';
import 'package:siddikbhai_c/probad/second_option.dart';
import 'package:siddikbhai_c/probad/second_single.dart';

import '../NetworkCall/model/emergency.dart';
import '../NetworkCall/remote_service.dart';

class BornoSingle extends StatefulWidget {

  String? id;
  String? name;

  BornoSingle(this.id,this.name,);

  @override
  State<BornoSingle> createState() => _BornoSingleState();
}

class _BornoSingleState extends State<BornoSingle> {

  List<Probad>? allItems =[];
  List<SecondSingle>? list =[];
  bool isLoaded = false;




  @override
  initState() {
    super.initState();
    setState(() {
      var logger = Logger();
      logger.d("fdjflkdjflkd");
      _getAllItems();
    });

  }

  Future<void> _getAllItems() async {
    allItems = await RemoteService().getProbad();
    setState(() {
      // print all elements from allItems
      isLoaded = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondOption(widget.id,widget.name,)),
          );

        },
        child:
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width*0.30,
          margin: EdgeInsets.only(left: 5,right: 5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.amber,
                spreadRadius: 1,
                blurRadius: 1.0,
                offset: Offset(2.0, 2.0),
              ),

            ],
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child:  Text(
                    widget.name!,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Constants.PRIMARYCOLOR,
                      fontFamily: "bangla",
                    ),
                  ),
                )

              ],
            ),
          ),
        )
    );
  }
}
