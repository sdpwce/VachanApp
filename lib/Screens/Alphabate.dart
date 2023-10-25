import 'package:flutter/material.dart';
//import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/utils/color_utils.dart';
import 'package:vachanapp/widgets/AlphaBox.dart';


class AlphabatePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AlphabatePage> {

  @override
  Widget build(BuildContext context) {
    var Cwidgth = MediaQuery.of(context).size.height*0.38;
    var Cheight = MediaQuery.of(context).size.height*0.38;
    return Scaffold(
     // appBar:  Appbar(AppBarText: "वाचन", flag: true,),
      body: SingleChildScrollView(
        child: Container(
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
                SizedBox(
                  height: Cheight*0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Lets Test Yourself->", style: TextStyle(
                            fontSize:Cwidgth * 0.06,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 169,
                                113, 253),
                          ),),
                    SizedBox(width: Cwidgth*0.1,)
                  ],
                ),

                SizedBox(
                  height: Cheight*0.02,
                ),
                Container(
                    height: Cheight*1.8,
                    width: Cwidgth*1.1,
                    child: SingleChildScrollView(
                      child: Column(

                          children: [
                            SizedBox(height: Cwidgth*0.02,),
                            Row(children: [ SizedBox(width: Cwidgth*0.05,), AlphabateBox(HeadingText: "A"), AlphabateBox(HeadingText: "B"), AlphabateBox(HeadingText: "C"), AlphabateBox(HeadingText: "D")],),
                            Row(children: [SizedBox(width: Cwidgth*0.05,),AlphabateBox(HeadingText: "E"), AlphabateBox(HeadingText: "F"), AlphabateBox(HeadingText: "G"), AlphabateBox(HeadingText: "H")],),
                            Row(children: [SizedBox(width: Cwidgth*0.05,),AlphabateBox(HeadingText: "I"), AlphabateBox(HeadingText: "J"), AlphabateBox(HeadingText: "K"), AlphabateBox(HeadingText: "L")],),
                            Row(children: [SizedBox(width: Cwidgth*0.05,),AlphabateBox(HeadingText: "M"), AlphabateBox(HeadingText: "N"), AlphabateBox(HeadingText: "O"), AlphabateBox(HeadingText: "P")],),
                            Row(children: [SizedBox(width: Cwidgth*0.05,),AlphabateBox(HeadingText: "Q"), AlphabateBox(HeadingText: "R"), AlphabateBox(HeadingText: "S"), AlphabateBox(HeadingText: "T")],),
                            Row(children: [SizedBox(width: Cwidgth*0.05,),AlphabateBox(HeadingText: "U"), AlphabateBox(HeadingText: "V"), AlphabateBox(HeadingText: "W"), AlphabateBox(HeadingText: "X")],),
                            Row(children: [SizedBox(width: Cwidgth*0.05,),AlphabateBox(HeadingText: "Y"), AlphabateBox(HeadingText: "Z"),], ),
                          ],
                        
                      ),
                    ),
                     color: Colors.white,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
