import 'package:flutter/material.dart';

import 'Constants.dart';

class Model {
  String id;
  String cName;
  String ImagePath;

  Model({required this.id, required this.cName, required this.ImagePath});
}

class SearchList extends StatefulWidget {
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  Widget appBarTitle = Text(
    "Search Demo",
    style: TextStyle(color: Colors.white),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.orange,
  );
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
      Model(cName: "সব ঊপজেলা",ImagePath: "assets/images/s.png",id:"0"),
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
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        appBar:  AppBar(
            centerTitle: true,
            title: appBarTitle,
            iconTheme: IconThemeData(color: Colors.orange),
            backgroundColor: Colors.black,
            actions: <Widget>[
              IconButton(
                icon: actionIcon,
                onPressed: () {
                  setState(() {
                    if (this.actionIcon.icon == Icons.search) {
                      this.actionIcon = Icon(
                        Icons.close,
                        color: Colors.orange,
                      );
                      this.appBarTitle = TextField(
                        controller: _searchQuery,
                        style: TextStyle(
                          color: Colors.orange,
                        ),
                        decoration: InputDecoration(
                            hintText: "Search here..",
                            hintStyle: TextStyle(color: Colors.white)),
                      );
                      _handleSearchStart();
                    } else {
                      _handleSearchEnd();
                    }
                  });
                },
              ),
            ]),
        body: GridView.builder(
            itemCount: _searchList.length,
            itemBuilder: (context, index) {
              return GridItem(_searchList[index]);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            )));
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
      this.actionIcon = Icon(
        Icons.search,
        color: Colors.orange,
      );
      this.appBarTitle = Text(
        "Search Demo",
        style: TextStyle(color: Colors.white),
      );
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