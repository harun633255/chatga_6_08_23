import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:siddikbhai_c/NetworkCall/model/baktiborgo.dart';
import 'package:siddikbhai_c/NetworkCall/model/borno.dart';
import 'package:siddikbhai_c/NetworkCall/model/bus_service.dart';
import 'package:siddikbhai_c/NetworkCall/model/dorniyo_place.dart';
import 'package:siddikbhai_c/NetworkCall/model/emergency.dart';
import 'package:siddikbhai_c/NetworkCall/model/emergency_cat.dart';
import 'package:siddikbhai_c/NetworkCall/model/enlish_to_chatga.dart';
import 'package:siddikbhai_c/NetworkCall/model/kothopokthon_cat.dart';
import 'package:siddikbhai_c/NetworkCall/model/news.dart';
import 'package:siddikbhai_c/NetworkCall/model/probad.dart';
import 'package:siddikbhai_c/NetworkCall/model/upazela_cat.dart';
import 'package:siddikbhai_c/NetworkCall/model/upazila.dart';

import '../main.dart';
import 'model/chatga_to_promit.dart';
import 'package:http/http.dart' as http;

import 'model/gan.dart';
import 'model/kothonpokthon.dart';

class RemoteService {
  String BaseUrl = "https://chatga.net";
 /* BuildContext context = NavigationService.navigatorKey
      .currentContext as BuildContext;*/



  // creat get request /promit
  /*Future<List<ChatgaToPromit>?> getChagaToPromit() async {
    var client = http.Client();
    var uri = Uri.parse('$BaseUrl/promit');
    var response = await client.get(uri);
    String body = response.body;
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var json = response.body;
        print(jsonDecode(json));
        return PostFromJson(jsonDecode(json));
        //show data in log
      } else {
       *//* AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.BOTTOMSLIDE,
          title: 'ব্যর্থ!',
          desc: 'আপনার অনুরোধটি ব্যর্থ হয়েছে',
          btnOkOnPress: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          btnOkIcon: Icons.check_circle,
        ).show();*//*
      }
    }
    else {
      *//*AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.BOTTOMSLIDE,
        title: 'ব্যর্থ!',
        desc: 'আপনার অনুরোধটি ব্যর্থ হয়েছে',
        btnOkOnPress: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        },
        btnOkIcon: Icons.check_circle,
      ).show();*//*
    }
  }*/

  Future<List<ChatgaToPromit>?> getChagaToPromit() async {
    var client = http.Client();

    var uri = Uri.parse('$BaseUrl/promit');
    var response = await client.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var json = response.body;
        print(jsonDecode(json));
        var studentl = classListPostFromJson(json);

          return classListPostFromJson(json);


        //show data in log
      }
    }
  }
  Future<List<EnglishToChatga>?> getEnglishToChatga() async {
    var client = http.Client();

    var uri = Uri.parse('$BaseUrl/ctgenglish');
    var response = await client.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var json = response.body;
        print(jsonDecode(json));
          return PostFromJson(json);
        //show data in log
      }
    }
  }
  Future<List<UpazelaCat>?> getUpaZelaCat() async {
    var client = http.Client();

    var uri = Uri.parse('$BaseUrl/upojelacat');
    var response = await client.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var json = response.body;
        print(jsonDecode(json));
          return UpazilaPostFromJson(json);
        //show data in log
      }
    }
  }

  // get upojela api get request
  Future<List<UpazilaDetails>?> getUpaZelaDetails() async {
    var client = http.Client();

    var uri = Uri.parse('$BaseUrl/upojela');
    var response = await client.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var json = response.body;
        print(jsonDecode(json));
        return UpazilaDetailsPostFromJson(json);
        //show data in log
      }
    }
  }
  Future<List<KothopokThonCat>?> getKothopokThonCat() async {
    var client = http.Client();

    var uri = Uri.parse('$BaseUrl/kothopokothoncat');
    var response = await client.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var json = response.body;
        print(jsonDecode(json));
        return KothoPokThonFromJson(json);
        //show data in log
      }
    }
  }
  Future<List<KothopokThon>?> getKothopokThon() async {
    var client = http.Client();

    var uri = Uri.parse('$BaseUrl/kothopokothon');
    var response = await client.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var json = response.body;
        print(jsonDecode(json));
        return KothonPokthonJson(json);
        //show data in log
      }
    }
  }
  Future<List<DorshoniyoPlace>?> getDorniyoPlaces() async {
    var client = http.Client();

    var uri = Uri.parse('$BaseUrl/dorshonio');
    var response = await client.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var json = response.body;
        print(jsonDecode(json));
        return DorshoniyoJson(json);
        //show data in log
      }
    }
  }
  Future<List<Baktiborgo>?> getBaktiborgo() async {
    var client = http.Client();

    var uri = Uri.parse('$BaseUrl/bektiborgo');
    var response = await client.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var json = response.body;
        print(jsonDecode(json));
        return BaktiBorgoJson(json);
        //show data in log
      }
    }
  }
  Future<List<EmergencyCat>?> getEmergencyCat() async {
    var client = http.Client();
    var uri = Uri.parse('$BaseUrl/emergencycategory');
    var response = await client.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var json = response.body;
        print(jsonDecode(json));
        return EmergencyCatJson(json);
        //show data in log
      }
    }
  }
  Future<List<Emergency>?> getEmergency() async {
    var client = http.Client();
    var uri = Uri.parse('$BaseUrl/emergency');
    var response = await client.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var json = response.body;
        print(jsonDecode(json));
        return EmergencyJson(json);
        //show data in log
      }
    }
  }
  Future<List<BusService>?> getBusService() async {
    var client = http.Client();
    var uri = Uri.parse('$BaseUrl/citybus');
    var response = await client.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var json = response.body;
        print(jsonDecode(json));
        return BusServiceJson(json);
        //show data in log
      }
    }
  }
  Future<List<News>?> getNews() async {
    var client = http.Client();
    var uri = Uri.parse('$BaseUrl/news');
    var response = await client.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var json = response.body;
        print(jsonDecode(json));
        return NewsJson(json);
        //show data in log
      }
    }
  }
  Future<List<Gan>?> getGan() async {
    var client = http.Client();
    var uri = Uri.parse('$BaseUrl/gan');
    var response = await client.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var json = response.body;
        print(jsonDecode(json));
        return GanJson(json);
        //show data in log
      }
    }
  }
  Future<List<Borno>?> getBorno() async {
    var client = http.Client();
    var uri = Uri.parse('$BaseUrl/borno');
    var response = await client.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var json = response.body;
        print(jsonDecode(json));
        return BornoJson(json);
        //show data in log
      }
    }
  }
  Future<List<Probad>?> getProbad() async {
    var client = http.Client();
    var uri = Uri.parse('$BaseUrl/probad');
    var response = await client.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var json = response.body;
        print(jsonDecode(json));
        return ProbadJson(json);
        //show data in log
      }
    }
  }

}