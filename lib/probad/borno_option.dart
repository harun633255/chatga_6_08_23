import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/EmegencyNumber/emergency_single.dart';
import 'package:siddikbhai_c/FirstItem/one_single.dart';
import 'package:siddikbhai_c/NetworkCall/model/borno.dart';
import 'package:siddikbhai_c/NetworkCall/model/emergency_cat.dart';
import 'package:siddikbhai_c/probad/borno_single.dart';
import 'package:siddikbhai_c/probad/second_single.dart';

import '../NetworkCall/model/probad.dart';
import '../NetworkCall/remote_service.dart';
import '../loader.dart';




class BornoOption extends StatefulWidget {


  @override
  State<BornoOption> createState() => _BornoOptionState();
}

class _BornoOptionState extends State<BornoOption> {

  List<Borno>? allItems =[];
  List<BornoSingle> list = [];
  List<Probad>? allIProbad =[];
  List<SecondSingle>? list2 =[];
  bool isLoaded = false;




  @override
  initState() {
    super.initState();
    setState(() {
      var logger = Logger();
      logger.d("fdjflkdjflkd");
      _getAllItems();
      //_getAllProbad();
    });

  }

  Future<void> _getAllItems() async {
    allItems = await RemoteService().getBorno();
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
        list.add(BornoSingle(allItems![i].id,allItems![i].borno,));
      }
      isLoaded = true;
    });
  }
  Future<void> _getAllProbad() async {
    allIProbad = await RemoteService().getProbad();
    setState(() {
      // print all elements from allItems
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
        title: Text("বর্ণ অনুযায়ী প্রবাদ",
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
          crossAxisCount: 4,
          shrinkWrap: true,
          childAspectRatio:1.0,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(list.length, (index) {
            return  GestureDetector(
                onTap: (){
                  var logger = Logger();
                  logger.d("fdjflkdjflkd tapped");
                  print("Tapped!!!.........................");

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
