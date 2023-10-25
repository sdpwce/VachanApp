import 'package:flutter/material.dart';
//import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/utils/color_utils.dart';
import 'package:vachanapp/widgets/Heading.dart';
import 'package:vachanapp/Screens/Alphabate.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var cwidgth = MediaQuery.of(context).size.width*0.8;
    return Scaffold(
     // appBar: Appbar(AppBarText: "वाचन", flag: false,),
      body:Container(
          width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
      gradient: LinearGradient(
      colors: [
      hexStringToColor("FCE5F1"),
      hexStringToColor("FAD2E3"),] , begin: Alignment.topCenter, end: Alignment.bottomCenter
      ),
      ),
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: cwidgth*0.1,),
          InkWell( onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AlphabatePage()),
            );
          }
              ,child: Heading(HeadingText: "Reading Alphabates", Cwidgth: cwidgth,)),
          SizedBox(height: cwidgth*0.1,),
          Image.asset('images/alphabate.jpg', width: cwidgth,),
          SizedBox(height: cwidgth*0.1),
          Heading(HeadingText: "Reading Numbers", Cwidgth: cwidgth,),
          SizedBox(height: cwidgth*0.1,),
          Image.asset('images/numbers.jpg',  width: cwidgth,),
        ],

      ),
    )));
  }
}
