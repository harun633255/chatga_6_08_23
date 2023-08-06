import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:siddikbhai_c/Constants.dart';


class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  SpinKitRing(
        color: Constants.PRIMARYCOLOR,
        size: 50.0,
      ),
    );

  }
}
