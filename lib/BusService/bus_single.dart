import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:siddikbhai_c/Constants.dart';


class BusSingle extends StatefulWidget {

  String? id;
  String? name;
  String? details;

  BusSingle(this.id,this.name,this.details);

  @override
  State<BusSingle> createState() => _BusSingleState();
}

class _BusSingleState extends State<BusSingle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          //show awsomedialog
          AwesomeDialog(
            context: context,
            dialogType: DialogType.noHeader,
            // animType: AnimType.BOTTOMSLIDE,
            title: widget.name,
            desc: widget.details!,
            /* btnOkOnPress: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => Home()));
                    },*/
            // btnOkIcon: Icons.check_circle,
          ).show();
        },
        child:
        Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          height: 60,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.5, 0.5), //(x,y)
                blurRadius: 2.0,
              ),
            ],
          ),
          child:Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(BootstrapIcons.car_front_fill,
                    color: Constants.PRIMARYCOLOR,
                  ),
                  SizedBox(width: 10,),
                  Text(widget.name!,
                    style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: Constants.FONT_SIZE,
                      fontFamily: Constants.BANGLAFONT,
                    ),
                  ),
                ],
              )

          ),


        )
    );
  }
}
