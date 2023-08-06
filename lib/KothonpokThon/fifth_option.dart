import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/KothonpokThon/fifth_all_options.dart';
import 'package:siddikbhai_c/KothonpokThon/general_discussion.dart';
import 'package:siddikbhai_c/FirstItem/one_single.dart';
import 'package:siddikbhai_c/NetworkCall/model/kothopokthon_cat.dart';
import 'package:siddikbhai_c/probad/second.dart';
import 'package:siddikbhai_c/probad/second_single.dart';

import '../NetworkCall/remote_service.dart';
import '../loader.dart';




class FifthOption extends StatefulWidget {


  @override
  State<FifthOption> createState() => _FifthOptionState();
}

class _FifthOptionState extends State<FifthOption> {



  List<KothopokThonCat>? allItems =[];
  List<FifthAllOptions> list = [];
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
    allItems = await RemoteService().getKothopokThonCat();
    list.clear();
    setState(() {
      // print all elements from allItems
      for (int i = 0; i < allItems!.length; i++) {
        var logger = Logger();
        print("allItems[i].id: ${allItems![i].id}");
        int size = allItems!.length;
      list.add(FifthAllOptions( allItems![i].id, allItems![i].name,false));
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
        title: Text("কথোপকথন",
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
        body: !isLoaded ? Loader() : SafeArea(
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context,index){

                return GestureDetector(
                  onTap: (){
                    /*if(index == 0)
                      {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> GeneralDiscussion()));
                      }*/
                  },
                  child: list.elementAt(index),
                );

              }
          )
      ),
    );
  }
}
