import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/FirstItem/one_single.dart';
import 'package:siddikbhai_c/Chatga_to_English/fourth_single.dart';
import 'package:siddikbhai_c/NetworkCall/model/enlish_to_chatga.dart';
import 'package:siddikbhai_c/promitToChatga/third_single.dart';

import '../NetworkCall/remote_service.dart';

import 'package:audioplayers/audioplayers.dart';

import '../loader.dart';
class FourthOption extends StatefulWidget {


  @override
  State<FourthOption> createState() => _FourthOptionState();
}

class _FourthOptionState extends State<FourthOption> {

  List<EnglishToChatga>? allItems =[];
  List<FourthSingle> list = [];
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
    allItems = await RemoteService().getEnglishToChatga();
    list.clear();
    setState(() {
      // print all elements from allItems
      for (int i = 0; i < allItems!.length; i++) {
        var logger = Logger();
        print("allItems[i].id: ${allItems![i].id}");
        int size = allItems!.length;
        list.add(FourthSingle(id:allItems![i].id,english:allItems![i].english,chatga:allItems![i].ctg,audio: allItems![i].audio,size: size,));
      }
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xF3F5F4F4),
      appBar: AppBar(
        backgroundColor: Constants.PRIMARYCOLOR,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text("চাটগা থেকে ইংরেজী",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: !isLoaded ? Loader(): SafeArea(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context,index){
              return list.elementAt(index);
            }
        )
      ),
    );
  }
}
