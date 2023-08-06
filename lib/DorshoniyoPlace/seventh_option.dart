import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/DorshoniyoPlace/seventh_single.dart';
import 'package:siddikbhai_c/FirstItem/one_single.dart';
import 'package:siddikbhai_c/NetworkCall/model/dorniyo_place.dart';
import 'package:siddikbhai_c/probad/second.dart';
import 'package:siddikbhai_c/probad/second_single.dart';
import 'package:siddikbhai_c/Upazila/uttor_chattagram.dart';
import 'package:siddikbhai_c/Upazila/sixth_main_options.dart';
import 'package:siddikbhai_c/Upazila/dokkhin_chattagram.dart';

import '../NetworkCall/remote_service.dart';
import '../loader.dart';




class SeventhOption extends StatefulWidget {


  @override
  State<SeventhOption> createState() => _SeventhOptionState();
}

class _SeventhOptionState extends State<SeventhOption> {

  List<DorshoniyoPlace>? allItems =[];
  List<seventh_single> list = [];
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
    allItems = await RemoteService().getDorniyoPlaces();
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
        String? description;
        // SixthMainOptions("assets/images/dokkhin.png", "আনোয়ারা পার্ক সমুদ্র সৈকত"),
        list.add(seventh_single(allItems![i].id,allItems![i].name,allItems![i].image,allItems![i].description));
      }
      isLoaded = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.PRIMARYCOLOR,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text("দর্শনীয় স্থান সমূহ",
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
                return GestureDetector(
                  onTap: (){
                  },
                  child:list.elementAt(index) ,
                );



              }
          )
      ),
    );
  }
}
