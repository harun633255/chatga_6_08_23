import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/EmegencyNumber/emergency_single.dart';
import 'package:siddikbhai_c/FirstItem/one_single.dart';
import 'package:siddikbhai_c/NetworkCall/model/emergency_cat.dart';

import '../NetworkCall/remote_service.dart';
import '../loader.dart';




class EmergencyOption extends StatefulWidget {


  @override
  State<EmergencyOption> createState() => _EmergencyOptionState();
}

class _EmergencyOptionState extends State<EmergencyOption> {

  List<EmergencyCat>? allItems =[];
  List<EmergencySingle> list = [];
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
    allItems = await RemoteService().getEmergencyCat();
    list.clear();
    setState(() {
      // print all elements from allItems
      for (int i = 0; i < allItems!.length; i++) {
        var logger = Logger();
        print("allItems[i].id: ${allItems![i].id}");
        int size = allItems!.length;
        String? id;
        String? name;
        String? image;
        //    EmergencySingle("Metropoliton police", "assets/images/promidtochat.png"),
        list.add(EmergencySingle(allItems![i].id,allItems![i].name,allItems![i].image));
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
        title: Text("ইমারজেন্সি নাম্বার সমূহ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: !isLoaded ? Loader(): SafeArea(
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 3,
          shrinkWrap: true,
          childAspectRatio:0.8,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(list.length, (index) {
            return  GestureDetector(
                onTap: (){

                },
                child:  Center(
                    child: list.elementAt(index)
                ));
          }),

        )

      ),
    );
  }
}
