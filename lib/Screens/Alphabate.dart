import 'package:flutter/material.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/widgets/MidBox.dart';
class Alphabate extends StatelessWidget {

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
                   children: [
                     SizedBox(width:  Cwidgth*0.05,),
                     Text("<- Lets Test Yourself", style: TextStyle(
                      fontSize: Cwidgth*0.07, color: Color.fromARGB(255, 248, 134, 187), fontWeight: FontWeight.bold
                   ),)],
                 ),
                 SizedBox(height: Cheight*0.35,),
                 Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       SizedBox(width:  Cwidgth*0.1,),
                       Column(
                         children: [
                           SizedBox(height: Cheight*0.15,),
                           Container(
                             width: Cwidgth*0.35,
                             height: Cheight*0.35,
                             child:  Image.asset('images/bee.png'),
                           ),
                         ],
                       ),
                       Container(
                            width: Cwidgth*0.5,
                           height: Cheight*0.5,
                         child:  Image.asset('images/BeeTeacher.png'),
                       ),

                     ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     StartBox(MidBoxText: "A", flag: false), MidBox(MidBoxText: "B", flag: false), MidBox(MidBoxText: "C", flag: true),
                     MidBox(MidBoxText: "D", flag: false),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     StartBox(MidBoxText: "E", flag: true), MidBox(MidBoxText: "F", flag: false), MidBox(MidBoxText: "G", flag: false),
                     MidBox(MidBoxText: "H", flag: true), EndBox(),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     SpecialBox(MidBoxText: "I", flag: false), BlankMidBox(), SpecialBox(MidBoxText: "J", flag: false), MidBox(MidBoxText: "K", flag: false),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     StartBox(MidBoxText: "L", flag: false), MidBox(MidBoxText: "M", flag: true), MidBox(MidBoxText: "N", flag: false), MidBox(MidBoxText: "O", flag: true), EndBox(),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [StartBox(MidBoxText: "P", flag: true), SpecialBox(MidBoxText: "Q", flag: false), BlankMidBox(), SpecialBox(MidBoxText: "R", flag: false),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     StartBox(MidBoxText: "S", flag: false), MidBox(MidBoxText: "T", flag: false), MidBox(MidBoxText: "U", flag: true), MidBox(MidBoxText: "V", flag: false), EndBox(),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     StartBox(MidBoxText: "W", flag: false), MidBox(MidBoxText: "X", flag: true), MidBox(MidBoxText: "Y", flag: true), MidBox(MidBoxText: "Z", flag: false),
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
