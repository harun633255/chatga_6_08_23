import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:siddikbhai_c/Chatga_to_English/fourth_option.dart';
import 'package:siddikbhai_c/Constants.dart';
import 'package:siddikbhai_c/Home/home_screen.dart';
import 'package:siddikbhai_c/FirstItem/option_one.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:siddikbhai_c/KothonpokThon/fifth_option.dart';
import 'package:siddikbhai_c/Upazila/sixth_option.dart';
import 'package:siddikbhai_c/test.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.', // description
  importance:Importance.high,
  playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  //firebase notification
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home:Home() ,

      debugShowCheckedModeBanner: false,
    );
  }
  @override
  void initState() {
    super.initState();
    // Load ads.
    final BannerAd myBanner = BannerAd(
      adUnitId: '<ca-app-pub-3940256099942544/6300978111>',
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(),
    );
   /* myBanner.load();
    final AdWidget adWidget = AdWidget(ad: myBanner);
    final Container adContainer = Container(
      alignment: Alignment.center,
      child: adWidget,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
    );*/
  }
}


class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;

  double bottom_icon_size = 20;

  double bottom_font_size = 12;

  double bottom_gap_between_icon_text = 4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription:channel.description,
              icon: 'launch_background',
              color: Colors.blue,
              playSound: true,
            ),
          ),
        );
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription:channel.description,
              icon: 'launch_background',
              color: Colors.blue,
              playSound: true,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  BootstrapIcons.grid,
                  color: Colors.grey, // Change Custom Drawer Icon Color
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
        title:Container(
      child:
      Stack(
      children: <Widget>[
        Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.only(right: 50,top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 2),
                height: 50.0,
                width: 100.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: new BoxDecoration(
                            //borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15),),
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset("assets/images/ll.png",
                              ).image,
                        )
                    ),
                    )

                   /* Text(
                      "Chatga",
                      style: TextStyle(
                          fontFamily: "bangla",
                          fontSize: 18,
                          color:Color(0xFF282C7D),
                      ),
                    ),*/
                    /*Text(
                      "চাটগাঁ",
                      style: TextStyle(
                          fontFamily: "bangla",
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Align(
          alignment: Alignment.centerRight,
          child:
          Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFF5F4F4),
                ),
                color: Color(0xFFEFEFEF),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: EdgeInsets.all(5),
            child: Center(
              child: Image.asset("assets/images/crown.png"
              ,width: 30,height: 30,)
            ),
          ))
      ],
    )),
      ),
      body:HomeScreen() ,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF043E99),
                ),
                child: Center(
                  child:

                  Text(
                    'চাটগাঁ',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "bangla"
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.description),
                title: const Text(' শব্দ সমূহ '),
                trailing:Icon(Icons.chevron_right_sharp) ,
                onTap: () {
                 //go to option one
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OptionOne()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: const Text(' English to Chatga '),
                trailing:Icon(Icons.chevron_right_sharp) ,
                onTap: () {
                 /* setState(() {
                    pageIndex = 1;
                  });*/
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FourthOption()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: const Text(' Chatga Story '),
                trailing:Icon(Icons.chevron_right_sharp) ,
                onTap: () {
                 /* setState(() {
                    pageIndex = 2;
                  });*/
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person_add),
                title: const Text(' কথোপকথন '),
                trailing:Icon(Icons.chevron_right_sharp) ,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FifthOption()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.ac_unit),
                title: const Text(' প্রবাদ-প্রচ্চন '),
                trailing:Icon(Icons.chevron_right_sharp) ,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OptionOne()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.place),
                title: const Text('ঊপজেলা'),
                trailing:Icon(Icons.chevron_right_sharp) ,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SixthOption()),
                  );
                },
              ),
            ],
          ),
        ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 65,
      margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
      padding: EdgeInsets.only(left: 10,right: 10),
      decoration: BoxDecoration(
        color:  Color(0xFFE1E2FD),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFD4D2D2),
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 15.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width*0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Constants.PRIMARYCOLOR,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFD4D2D2),
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            alignment: Alignment.center,
            child:Center(
              child:MaterialButton(
                onPressed: () {
                  /* setState(() {
                  pageIndex = 0;
                });*/
                },
                child: Icon(
                  BootstrapIcons.house,
                  size: 20,
                  color: Colors.white,
                  /* color: pageIndex == 0 ? Colors.redAccent : Colors.grey,
                    size: bottom_icon_size,*/
                ),
              ) ,
            )
            ,
          ),
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width*0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color(0xFFE1E2FD),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFD4D2D2),
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            alignment: Alignment.center,
            child:Center(
              child:MaterialButton(
                onPressed: () {
                  /* setState(() {
                  pageIndex = 0;
                });*/
                },
                child: Icon(
                  BootstrapIcons.airplane,
                  size: 20,
                  color: Constants.PRIMARYCOLOR,
                  /* color: pageIndex == 0 ? Colors.redAccent : Colors.grey,
                    size: bottom_icon_size,*/
                ),
              ) ,
            )
            ,
          ),
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width*0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color(0xFFE1E2FD),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFD4D2D2),
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            alignment: Alignment.center,
            child:Center(
              child:MaterialButton(
                onPressed: () {
                  /* setState(() {
                  pageIndex = 0;
                });*/
                },
                child: Icon(
                  BootstrapIcons.grid,
                  size: 20,
                  color: Constants.PRIMARYCOLOR,
                  /* color: pageIndex == 0 ? Colors.redAccent : Colors.grey,
                    size: bottom_icon_size,*/
                ),
              ) ,
            )
            ,
          ),
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width*0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color(0xFFE1E2FD),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFD4D2D2),
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            alignment: Alignment.center,
            child:Center(
              child:MaterialButton(
                onPressed: () {
                  /* setState(() {
                  pageIndex = 0;
                });*/
                },
                child: Icon(
                  BootstrapIcons.heart,
                  size: 20,
                  color: Constants.PRIMARYCOLOR,
                  /* color: pageIndex == 0 ? Colors.redAccent : Colors.grey,
                    size: bottom_icon_size,*/
                ),
              ) ,
            )
            ,
          ),
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width*0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color(0xFFE1E2FD),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFD4D2D2),
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            alignment: Alignment.center,
            child:Center(
              child:MaterialButton(
                onPressed: () {
                  /* setState(() {
                  pageIndex = 0;
                });*/
                },
                child: Icon(
                  BootstrapIcons.person,
                  size: 20,
                  color: Constants.PRIMARYCOLOR,
                  /* color: pageIndex == 0 ? Colors.redAccent : Colors.grey,
                    size: bottom_icon_size,*/
                ),
              ) ,
            )
            ,
          ),


        ],
      ),
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
}






