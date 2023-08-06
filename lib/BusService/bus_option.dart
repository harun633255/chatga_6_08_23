import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:siddikbhai_c/BusService/bus_single.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/FirstItem/one_single.dart';
import 'package:siddikbhai_c/NetworkCall/model/bus_service.dart';
import 'package:siddikbhai_c/promitToChatga/third_single.dart';

import '../NetworkCall/remote_service.dart';




class BusOption extends StatefulWidget {


  @override
  State<BusOption> createState() => _BusOptionState();
}

class _BusOptionState extends State<BusOption> {


  List<BusService>? allItems =[];
  List<BusSingle> list = [];
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
    allItems = await RemoteService().getBusService();
    list.clear();
    setState(() {
      // print all elements from allItems
      for (int i = 0; i < allItems!.length; i++) {
        var logger = Logger();
        print("allItems[i].id: ${allItems![i].id}");
        int size = allItems!.length;

        list.add(BusSingle(allItems![i].id,allItems![i].name,allItems![i].details));
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
        title: Text("সিটি বাস সার্ভিস",
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
            itemCount: list.length,
            itemBuilder: (context,index){
              return list.elementAt(index);
            }
        )
      ),
    );
  }
}
