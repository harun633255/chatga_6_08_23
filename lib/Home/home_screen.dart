import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';
import 'package:siddikbhai_c/BusService/bus_option.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/Baktiborgo/eighth_option.dart';
import 'package:siddikbhai_c/EmegencyNumber/emergency_option.dart';
import 'package:siddikbhai_c/Gan/gan_option.dart';
import 'package:siddikbhai_c/Home/items.dart';
import 'package:siddikbhai_c/KothonpokThon/fifth_option.dart';
import 'package:siddikbhai_c/FirstItem/option_one.dart';
import 'package:siddikbhai_c/Chatga_to_English/fourth_option.dart';
import 'package:siddikbhai_c/Home/single_item.dart';
import 'package:siddikbhai_c/NetworkCall/model/borno.dart';
import 'package:siddikbhai_c/News/news_option.dart';
import 'package:siddikbhai_c/probad/borno_option.dart';
import 'package:siddikbhai_c/DorshoniyoPlace/seventh_option.dart';
import 'package:siddikbhai_c/Upazila/sixth_option.dart';
import 'package:siddikbhai_c/promitToChatga/third_option.dart';

import '../NetworkCall/model/chatga_to_promit.dart';
import '../NetworkCall/remote_service.dart';
import '../probad/second_option.dart';
import '../promitToChatga/third_single.dart';

class Model {
  String id;
  String cName;
  String ImagePath;

  Model({required this.id, required this.cName, required this.ImagePath});
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  BannerAd? bannerAd;
  bool isLoaded = false;



  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  late List<Model> _list;
  List<Model> _searchList = [];

  late bool _IsSearching;
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    init();
  }

  void init() {
    _list = [
      Model(cName: "শব্দসমূহ",ImagePath: "assets/images/sobdo.png",id:"0"),
      Model(cName: "প্রবাদ - প্রবচন",ImagePath: "assets/images/probad.png",id:"0"),
      Model(cName: "প্রমিত থেকে চাটগাঁ",ImagePath: "assets/images/promidtochat.png",id:"0"),
      Model(cName: "চাটগাঁ - ইংরেজী",ImagePath: "assets/images/chatgaenglish.png",id:"0"),
      Model(cName: "কথোপকথন",ImagePath: "assets/images/kotho.png",id:"0"),
      Model(cName: "সব ঊপজেলা",ImagePath: "assets/images/s.jpg",id:"0"),
      Model(cName: "দর্শনীয় স্থান",ImagePath: "assets/images/probad.png",id:"0"),
      Model(cName: "বিশিষ্ট ব্যক্তি",ImagePath: "assets/images/kotho.png",id:"0"),
      Model(cName: "চাটগাঁর গান",ImagePath: "assets/images/promidtochat.png",id:"0"),
      Model(cName: "চাটগাঁইয়া খবর",ImagePath: "assets/images/sobdo.png",id:"0"),
      Model(cName: "চাটগাঁইয়া নাটক",ImagePath: "assets/images/probad.png",id:"0"),
      Model(cName: "চট্রগ্রামের ইতিহাস",ImagePath: "assets/images/chatgaenglish.png",id:"0"),
      Model(cName: "ইমার্জেন্সি নাম্বার",ImagePath: "assets/images/kotho.png",id:"0"),
      Model(cName: "সিটি বাস",ImagePath: "assets/images/promidtochat.png",id:"0"),
      Model(cName: "ছবিতে চাটগাঁ",ImagePath: "assets/images/sobdo.png",id:"0"),
    ];
    _searchList = _list;

    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
          _buildSearchList();
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
          _buildSearchList();
        });
      }
    });
  }











  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-3940256099942544/6300978111",
        listener: BannerAdListener(
          onAdLoaded: (ad)
              {
                setState(() {
                  isLoaded = true;
                });
                print("Banner ad Loaded");
              },
          onAdFailedToLoad: (ad,error)
            {
              ad.dispose();
            }
        ),
        request: AdRequest(),
    );
    bannerAd!.load();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: 50,
            child: isLoaded? AdWidget(
              ad: bannerAd!,):
            SizedBox(),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 10,right: 10,top: 10),
            height: 60,
            width: MediaQuery.of(context).size.width,
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
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child:
                    Expanded(
                      flex: 10,
                      child:Row(
                        children: [
                          SizedBox(width: 10,),
                          Expanded(
                            flex: 1,
                            child: Icon(BootstrapIcons.search,
                              color: Constants.PRIMARYCOLOR,
                            ),
                          ),

                          Expanded(
                            flex: 7,
                            child: TextField(
                              controller: _searchQuery,

                              onChanged: (value)
                              {
                                setState(() {
                                  /*if (value.isEmpty) {
                                    _handleSearchStart();
                                  } else {
                                    _handleSearchEnd();
                                  }*/
                                });
                              },

                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: Constants.BANGLAFONT,
                                  fontSize: 15
                              ),
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "  খুজুন....",
                                hintStyle: TextStyle(color: Colors.grey,
                                    fontFamily: Constants.BANGLAFONT,
                                    fontSize: 16
                                ),
                              ),
                            ),

                          ),
                          Expanded(
                              flex: 2,
                              child:Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: (){

                                    },
                                    child:  Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xFFFFFFFF),
                                          ),
                                          color: Color(0xFFFFFFFF),
                                          borderRadius: BorderRadius.all(Radius.circular(22))),
                                      padding: EdgeInsets.all(5),
                                      child: Center(
                                        child: Icon(
                                          BootstrapIcons.filter,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  )
                              )
                          ),

                        ],
                      ),
                    )

                ),


              ],
            ),
          ),
          SizedBox(height: 15,),
          Expanded(child: GridView.builder(
              itemCount: _searchList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    if(index == 0)
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OptionOne()));
                      }
                    else if(index == 1) {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => BornoOption()));
                    }else if(index == 2) {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => ThirdOption()));
                    } else if(index == 3) {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => FourthOption()));
                    }else if(index == 4) {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => FifthOption()));
                    }
                    else if(index == 5) {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => SixthOption()));
                    }else if(index == 6) {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => SeventhOption()));
                    }
                    else if(index == 7)
                    {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> EighthOption()));
                    }
                    else if(index == 8)
                    {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> GanOptions()));
                    }
                    else if(index == 9){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> NewsOptions()));
                    }
                    else if(index == 12)
                    {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> EmergencyOption()));
                    }
                    else if(index == 13)
                    {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> BusOption()));
                    }

                  },
                  child: GridItem(_searchList[index]),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 4),
              )),),


        ],
      ),
    );


  }
  List<Model> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList = _list;
    } else {
      _searchList = _list
          .where((element) =>
          element.cName.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
      print('${_searchList.length}');
      return _searchList;
    }
  }


  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}

class GridItem extends StatelessWidget {
  final Model model;
  GridItem(this.model);

  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10),
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
                  child: Image.asset(model.ImagePath,height: 10,width: 10,),
                )),
            Container(
              margin: EdgeInsets.only(left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.cName,
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




GestureDetector showItem(String cName,String imagePath,
    BuildContext context,int index) {
  return GestureDetector(
    onTap: ()
    {
      if(index == 0)
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> OptionOne()));
      }
      else if(index == 1)
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> BornoOption()));
      }
      else if(index == 2)
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> ThirdOption()));
      }
      else if(index == 3)
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> FourthOption()));
      }
      else if(index == 4)
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> FifthOption()));
      }
      else if(index == 5)
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> SixthOption()));
      }
      else if(index == 6)
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> SeventhOption()));
      }
      else if(index == 7)
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> EighthOption()));
      }
      else if(index == 8)
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> GanOptions()));
      }
      else if(index == 9){
        Navigator.push(context,MaterialPageRoute(builder: (context)=> NewsOptions()));
      }
      else if(index == 12)
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> EmergencyOption()));
      }
      else if(index == 13)
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> BusOption()));
      }

    },
    child: Container(
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
      child: Row(
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
                child: Image.asset(imagePath,height: 10,width: 10,),
              )),
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cName,
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

    ),
  );
}
