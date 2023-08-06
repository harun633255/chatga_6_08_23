import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/FirstItem/one_single.dart';
import 'package:siddikbhai_c/NetworkCall/model/upazila.dart';
import 'package:siddikbhai_c/probad/second.dart';
import 'package:siddikbhai_c/probad/second_single.dart';
import 'package:siddikbhai_c/Upazila/six_single.dart';
import 'package:siddikbhai_c/Upazila/sixth_main_options.dart';

import '../NetworkCall/remote_service.dart';
import '../loader.dart';




class UttorChattagram extends StatefulWidget {


  @override
  State<UttorChattagram> createState() => _UttorChattagramState();
}

class _UttorChattagramState extends State<UttorChattagram> {


  List<UpazilaDetails>? allItems =[];
  List<SixSingle> list = [];
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
    allItems = await RemoteService().getUpaZelaDetails();
    list.clear();
    setState(() {
      // print all elements from allItems
      for (int i = 0; i < allItems!.length; i++) {
        var logger = Logger();
        print("allItems[i].id: ${allItems![i].id}");
        int size = allItems!.length;
        if(allItems![i].catid == "1")
          {
            list.add(SixSingle(allItems![i].id,allItems![i].name,allItems![i].history,allItems![i].bittranto,allItems![i].emergency,allItems![i].catid));
          }
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
        title: Text("উত্তর চট্রগ্রাম",
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
                    if(index == 0)
                    {
                    //  Navigator.push(context,MaterialPageRoute(builder: (context)=> GeneralDiscussion()));
                    }
                  },
                  child:list.elementAt(index) ,
                );



              }
          )
      ),
    );
  }
}
