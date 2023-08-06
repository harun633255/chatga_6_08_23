import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/DorshoniyoPlace/seventh_single.dart';
import 'package:siddikbhai_c/FirstItem/one_single.dart';
import 'package:siddikbhai_c/Gan/gan_single.dart';
import 'package:siddikbhai_c/NetworkCall/model/dorniyo_place.dart';
import 'package:siddikbhai_c/NetworkCall/model/gan.dart';
import 'package:siddikbhai_c/NetworkCall/model/news.dart';
import 'package:siddikbhai_c/News/news_single.dart';
import 'package:siddikbhai_c/probad/second.dart';
import 'package:siddikbhai_c/probad/second_single.dart';
import 'package:siddikbhai_c/Upazila/uttor_chattagram.dart';
import 'package:siddikbhai_c/Upazila/sixth_main_options.dart';
import 'package:siddikbhai_c/Upazila/dokkhin_chattagram.dart';

import '../NetworkCall/remote_service.dart';
import '../loader.dart';




class GanOptions extends StatefulWidget {


  @override
  State<GanOptions> createState() => _GanOptionstate();
}

class _GanOptionstate extends State<GanOptions> {

  List<Gan>? allItems =[];
  List<Gan_Single> list = [];
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
    allItems = await RemoteService().getGan();
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
        String? link = allItems![i].youtubelink;
        // explode link by ?v= get the second part
        List<String> parts = link!.split("?v=");
        String? ids = parts[1];

        String images =  "http://img.youtube.com/vi/"+ids+"/maxresdefault.jpg";
        print("$link");
        print("$images");
        list.add(Gan_Single(allItems![i].id,allItems![i].name,images,allItems![i].youtubelink));
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
        title: Text("গান",
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
