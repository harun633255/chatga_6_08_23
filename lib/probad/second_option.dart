import 'package:flutter/material.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/FirstItem/one_single.dart';
import 'package:siddikbhai_c/probad/second.dart';
import 'package:siddikbhai_c/probad/second_single.dart';

import '../NetworkCall/model/probad.dart';
import '../NetworkCall/remote_service.dart';
import '../loader.dart';




class SecondOption extends StatefulWidget {

  String? id;
  String? borno;
  SecondOption(this.id,this.borno);


  @override
  State<SecondOption> createState() => _SecondOptionState();
}

class _SecondOptionState extends State<SecondOption> {


  List<Probad>? allIProbad =[];
  List<SecondSingle>? list2 =[];
  bool isLoaded = false;

  @override
  initState() {
    super.initState();
    setState(() {
      _getAllProbad();
    });

  }

  Future<void> _getAllProbad() async {
    allIProbad = await RemoteService().getProbad();
    setState(() {
      // print all elements from allItems
      for(int i = 0; i < allIProbad!.length; i++)
        {
          if(allIProbad![i].bornoid == widget.id)
            {
              list2!.add(SecondSingle(widget.borno, allIProbad![i].probad,allIProbad![i].onubad , allIProbad![i].mormartho, allIProbad![i].english, allIProbad![i].audio,Constants.PRIMARYCOLOR));
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
        title: Text("প্রবাদ থেকে প্রবচন",
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
              itemCount: list2!.length,
              itemBuilder: (context,index){
                return list2!.elementAt(index);
              }
          )
      ),
    );
  }
}
