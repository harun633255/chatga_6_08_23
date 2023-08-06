import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/KothonpokThon/fifth_single.dart';
import 'package:siddikbhai_c/FirstItem/one_single.dart';
import 'package:siddikbhai_c/Chatga_to_English/fourth_single.dart';
import 'package:siddikbhai_c/NetworkCall/model/kothonpokthon.dart';
import 'package:siddikbhai_c/promitToChatga/third_single.dart';

import '../NetworkCall/remote_service.dart';
import '../loader.dart';




class GeneralDiscussion extends StatefulWidget {

  String? id;
  String? title;
  GeneralDiscussion(this.id,this.title);

  @override
  State<GeneralDiscussion> createState() => _GeneralDiscussionState();
}

class _GeneralDiscussionState extends State<GeneralDiscussion> {
  List<KothopokThon>? allItems =[];

  List<FifthSingle> list = [];

  bool isLoaded = false;

//
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
    allItems = await RemoteService().getKothopokThon();
    list.clear();
    setState(() {
      // print all elements from allItems
      for (int i = 0; i < allItems!.length; i++) {
        var logger = Logger();
        print("allItems[i].id: ${allItems![i].id}");
        int size = allItems!.length;
        //FifthSingle("আমি খাই?","আই হাই"),
        if(allItems![i].catid == widget.id){
          list.add(FifthSingle(allItems![i].id,allItems![i].kothopokothon,allItems![i].ctg, allItems![i].audio));
        }

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
        title: Text(widget.title!,
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
