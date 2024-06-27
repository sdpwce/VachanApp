import 'package:flutter/material.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/widgets/MidBox.dart';
class Varnmala extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var Cwidgth = MediaQuery.of(context).size.height*0.38;
    var Cheight = MediaQuery.of(context).size.height*0.38;
    return Scaffold(
      appBar:  Appbar(apptext: "वाचन",),
      body: Stack(
          children: [
            Image.asset(
              'images/grassblue1.jpg',
              fit: BoxFit.cover, // You can adjust the fit property as needed
              width: double.infinity,
              height: double.infinity,
            ),
            SingleChildScrollView(
              child: Column(

                children: [
                  SizedBox(height:  Cwidgth*0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StartBox(MidBoxText: "अ", flag: false), MidBox(MidBoxText: "आ", flag: false), MidBox(MidBoxText: "इ", flag: true),
                      MidBox(MidBoxText: "ई", flag: false),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StartBox(MidBoxText: "उ", flag: true), MidBox(MidBoxText: "ऊ", flag: false), MidBox(MidBoxText: "ए", flag: false),
                      MidBox(MidBoxText: "ऐ", flag: true), EndBox(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [StartBox(MidBoxText: "ओ", flag: true), SpecialBox(MidBoxText: "औ", flag: false), MidBox(MidBoxText: "अं", flag: true), SpecialBox(MidBoxText: "अः", flag: false),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StartBox(MidBoxText: "क", flag: false), MidBox(MidBoxText: "ख", flag: false), MidBox(MidBoxText: "ग", flag: true), MidBox(MidBoxText: "घ", flag: false), EndBox(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StartBox(MidBoxText: "च", flag: false), MidBox(MidBoxText: "छ", flag: true), MidBox(MidBoxText: "ज", flag: true), MidBox(MidBoxText: "झ", flag: false),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StartBox(MidBoxText: "त्र", flag: false), MidBox(MidBoxText: "ट", flag: false), MidBox(MidBoxText: "ठ", flag: true),
                      MidBox(MidBoxText: "ड", flag: false),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StartBox(MidBoxText: "ढ", flag: true), MidBox(MidBoxText: "ण", flag: false), MidBox(MidBoxText: "त", flag: false),
                      MidBox(MidBoxText: "थ", flag: true), EndBox(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SpecialBox(MidBoxText: "द", flag: false), MidBox(MidBoxText: "ध", flag: true), SpecialBox(MidBoxText: "न", flag: false), MidBox(MidBoxText: "प", flag: false),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StartBox(MidBoxText: "फ", flag: false), MidBox(MidBoxText: "ब", flag: true), MidBox(MidBoxText: "भ", flag: false), MidBox(MidBoxText: "म", flag: true), EndBox(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [StartBox(MidBoxText: "य", flag: true), SpecialBox(MidBoxText: "र", flag: false),MidBox(MidBoxText: "ल", flag: true), SpecialBox(MidBoxText: "व", flag: false),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StartBox(MidBoxText: "श", flag: false), MidBox(MidBoxText: "ष", flag: false), MidBox(MidBoxText: "स", flag: true), MidBox(MidBoxText: "ह", flag: false), EndBox(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StartBox(MidBoxText: "ळ", flag: false), MidBox(MidBoxText: "क्ष", flag: true), MidBox(MidBoxText: "ज्ञ", flag: true), MidBox(MidBoxText: "", flag: false),
                    ],
                  ),
                  Container(
                    color: Color.fromARGB(255, 23, 120, 128), height: Cheight*0.2, width: Cwidgth*1.5,
                  )

                ],
              ),
            ),
          ]
      ),
    );
  }
}
