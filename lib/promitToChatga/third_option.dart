import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/FirstItem/one_single.dart';
import 'package:siddikbhai_c/NetworkCall/model/chatga_to_promit.dart';
import 'package:siddikbhai_c/promitToChatga/third_single.dart';

import '../NetworkCall/remote_service.dart';
import '../loader.dart';




class ThirdOption extends StatefulWidget {


  @override
  State<ThirdOption> createState() => _ThirdOptionState();
}

class _ThirdOptionState extends State<ThirdOption> {

  List<ChatgaToPromit>? allItems =[];
  List<ThirdSingle> list = [];
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
    allItems = await RemoteService().getChagaToPromit();
    list.clear();
    setState(() {
      // print all elements from allItems
      for (int i = 0; i < allItems!.length; i++) {
        var logger = Logger();
        print("allItems[i].id: ${allItems![i].id}");
        list.add(ThirdSingle(id:allItems![i].id,promito:allItems![i].promit,chatga:allItems![i].ctg,audio: allItems![i].audio,));
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
        title: Text("প্রমিত থেকে চাটগা",
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
            itemCount: list?.length,
            itemBuilder: (context,index){
              return list.elementAt(index);
            }
        )
      ),
    );
  }
}
