import 'package:flutter/material.dart';
import 'package:siddikbhai_c/Constants.dart';

import 'items.dart';

class SingleItem extends StatefulWidget {

  Items? items;
  SingleItem(this.items);

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.all(10.0),
        height: 70,
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFD4D2D2),
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child:
        Row(
          children: [
            Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFD4D2D2),
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Constants.PRIMARYCOLOR,
                  ),
                  child: Image.asset(widget.items!.imagePath,height: 10,width: 10,),
                )),
            Container(
              margin: EdgeInsets.only(left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.items!.cName,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: "bangla",
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            )
          ],
        ),

      );
  }
}
