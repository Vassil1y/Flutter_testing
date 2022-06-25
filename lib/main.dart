
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_app/supply.dart';

import 'page/home_page.dart';
import 'page/point_raiting_page.dart';
import 'page/timetable_page.dart';

void main() async {
  await  get();
 // HttpOverrides.global = MyHttpOverrides();
 runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  int index=1;
  final screens = [
    TimeTablePage(),
    HomePage(),
    PointRaitingPage(),
  ];

  @override
  Widget build(BuildContext context) {

    final items = <Widget>[
      Icon(Icons.search, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.settings, size: 30)
    ];

    return Scaffold(
      body: screens[index],
      backgroundColor: Colors.white,

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.grey,
        index: index,
        items: items,
        onTap: (index)=> setState(() => this.index = index),
      ),
    );
  }
}
//
//
// class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext? context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }