import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/Baktiborgo/eight_single.dart';
import 'package:siddikbhai_c/FirstItem/one_single.dart';
import 'package:siddikbhai_c/NetworkCall/model/baktiborgo.dart';
import 'package:siddikbhai_c/loader.dart';
import 'package:siddikbhai_c/probad/second.dart';
import 'package:siddikbhai_c/probad/second_single.dart';
import 'package:siddikbhai_c/Upazila/uttor_chattagram.dart';
import 'package:siddikbhai_c/Upazila/sixth_main_options.dart';
import 'package:siddikbhai_c/Upazila/dokkhin_chattagram.dart';

import '../NetworkCall/remote_service.dart';




class EighthOption extends StatefulWidget {


  @override
  State<EighthOption> createState() => _EighthOptionState();
}

class _EighthOptionState extends State<EighthOption> {

  List<Baktiborgo>? allItems =[];
  List<EightSignle> list = [];
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
    allItems = await RemoteService().getBaktiborgo();
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
        //EightSignle("assets/images/ak.png", "প্রফেসর ডঃ জামাল নজরুল"),
        list.add(EightSignle(allItems![i].id,allItems![i].name,allItems![i].image,allItems![i].description));
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
        title: Text("চাটগাঁর বিশিষ্ট ব্যক্তিবর্গ",
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: !isLoaded ? Loader():
      SafeArea(
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
