import 'package:flutter/material.dart';
import 'package:vachanapp/Screens/fruits.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/Screens/Alphabate.dart';
import 'package:vachanapp/Screens/Number.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';


class KnowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cwidgth = MediaQuery.of(context).size.width;
    var cheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor:  const Color.fromARGB(255, 211, 232, 239),
        appBar: Appbar(apptext: "वाचन",),

        body: Stack(
            children:[  Image.asset(
              'images/knowback.jpg',
              fit: BoxFit.cover, // You can adjust the fit property as needed
              width: double.infinity,
              height: double.infinity,
            ),
             Column(
               children: [
                     InkWell(
                       onTap: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
                       },
                       child: Container(
                           height: cheight*0.42,
                         //  color: Colors.red,
                           child: Row(
                               children: [
                                   InkWell(
                                     child: Container(
                                         width: cwidgth*0.45,
                                      // color: Colors.blue,
                                       child: Column(
                                           children: [
                                             SizedBox(
                                               height: cheight*0.42*0.18,
                                             ),
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.end,
                                               children: [
                                                 Text("Fruits", style: GoogleFonts.lacquer(
                                                   fontSize: cwidgth*0.09,
                                                   fontWeight: FontWeight.bold,
                                            //   color: Color.fromARGB(255, 23, 120, 128),
                                                 ),textAlign: TextAlign.center, ),
                                                 SizedBox(
                                                   width: cwidgth*0.45*0.2,
                                                 )
                                               ],
                                             ),
                                             SizedBox(
                                                 height: cheight*0.42*0.08,
                                             ),
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.end,
                                               children: [
                                                 Container(
                                                     width: cwidgth*0.45*0.8,
                                                     height: cheight*0.42*0.42,
                                                     child: Image.asset('images/basket.png')),
                                                 SizedBox(
                                                   width: cwidgth*0.45*0.05,
                                                 )
                                               ],
                                             ),
                                           ],
                                       ),
                                     ),
                                   ),
                                 InkWell(
                                   onTap: (){
                                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => ColorPage()));
                                   },
                                   child: Container(
                                     width: cwidgth*0.55,
                                    // color: Colors.white,
                                     child: Column(
                                       children: [
                                         SizedBox(
                                           height: cheight*0.42*0.4,
                                         ),
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.end,
                                           children: [

                                             Text("Colors", style: GoogleFonts.lacquer(
                                               fontSize: cwidgth*0.09,
                                               fontWeight: FontWeight.bold,
                                               //   color: Color.fromARGB(255, 23, 120, 128),
                                             ),textAlign: TextAlign.center, ),
                                             SizedBox(
                                               width: cwidgth*0.55*0.16,
                                             ),
                                           ],
                                         ),
                                         SizedBox(
                                           height: cheight*0.42*0.05,
                                         ),
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.end,
                                           children: [
                                             Container(
                                                 width: cwidgth*0.45*0.75,
                                                 height: cheight*0.42*0.35,
                                                 child: Image.asset('images/cloud.png')),
                                             SizedBox(
                                               width: cwidgth*0.55*0.11,
                                             ),
                                           ],
                                         ),
                                       ],
                                     ),
                                   ),
                                 )
                               ],
                           ),
                       ),
                     ),
                 Container(
                   height: cheight*0.46,
                  // color: Colors.green,
                   child: Row(
                     children: [
                       InkWell(
                         child: Container(
                           width: cwidgth*0.38,
                         //  color: Colors.white,
                           child: Column(
                               children: [
                                 SizedBox(
                                     height:  cheight*0.46*0.02,
                                 ),
                                 Text("Animals", style: GoogleFonts.lacquer(
                                   fontSize: cwidgth*0.09,
                                   fontWeight: FontWeight.bold,
                                   //   color: Color.fromARGB(255, 23, 120, 128),
                                 ),textAlign: TextAlign.center, ),
                                 SizedBox(
                                   height:  cheight*0.46*0.04,
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                     Container(
                                         width: cwidgth*0.46*0.7,
                                         height: cheight*0.38*0.35,
                                         child: Image.asset('images/hello.png')),
                                     SizedBox(
                                       width: cwidgth*0.46*0.12,
                                     ),
                                   ],
                                 ),
                               ],
                           ),
                         ),
                       ),
                       InkWell(
                         child: Container(
                           width: cwidgth*0.62,
                          // color: Colors.blue,
                           child: Column(
                               children: [
                                    SizedBox( height: cheight*0.46*0.25,),
                                 Row( mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                     Container(
                                         width: cwidgth*0.62*0.8,
                                         height: cheight*0.46*0.5,
                                         child: Image.asset('images/table-fan.png')),
                                     SizedBox(
                                       width: cwidgth*0.62*0.15,
                                     ),
                                   ],
                                 ),
                                 SizedBox( height: cheight*0.46*0.05,),
                                 Row(  mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                     Text("Things", style: GoogleFonts.lacquer(
                                       fontSize: cwidgth*0.09,
                                       fontWeight: FontWeight.bold,
                                       //   color: Color.fromARGB(255, 23, 120, 128),
                                     ),textAlign: TextAlign.center, ),
                                     SizedBox(
                                       width: cwidgth*0.62*0.37,
                                     ),
                                   ],
                                 ),

                               ],
                           ),
                         ),
                       )
                     ],
                   ),
                 )
               ],

             )
            ]));
  }
}
