import 'package:flutter/material.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/FirstItem/one_single.dart';




class OptionOne extends StatefulWidget {


  @override
  State<OptionOne> createState() => _OptionOneState();
}

class _OptionOneState extends State<OptionOne> {

  List allItems = [
    OneSingle("আই"),
    OneSingle("আই"),
    OneSingle("আই"),
    OneSingle("আই"),
    OneSingle("আই"),
    OneSingle("আই"),
    OneSingle("আই"),
    OneSingle("আই"),
    OneSingle("আই"),
    OneSingle("আই"),
    OneSingle("আই"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xF3F5F4F4),
      appBar: AppBar(
        backgroundColor: Constants.PRIMARYCOLOR,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text("চাঁটগা ও চলিত শব্দ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: allItems.length,
            itemBuilder: (context,index){
              return allItems.elementAt(index);
            }
        )
      ),
    );
  }
}
