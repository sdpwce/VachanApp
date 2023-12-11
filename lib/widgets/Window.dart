import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vachanapp/Screens/Alphabate.dart';
import 'package:vachanapp/Screens/Words.dart';
import 'package:vachanapp/Screens/read.dart';

import '../Screens/Craft.dart';
import '../Screens/NumberDetail.dart';
import '../Screens/knowlege.dart';
import '../stt.dart';


class Window extends StatelessWidget {
  const Window({Key? key, required this.lang,}) : super(key: key);
  final bool lang;

  Widget build(BuildContext context) {
    var Cwidgth = MediaQuery.of(context).size.height * 0.38;
    var Cheight = MediaQuery.of(context).size.height * 0.38;
    return  Container(
      width: Cwidgth*1.05,
      height: Cheight*1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
        boxShadow: [
          BoxShadow(
            color: Colors.black38, // Shadow color
            offset: Offset(0, 2), // Offset of the shadow
            blurRadius: 15.0, // Spread of the shadow
          ),
        ],
        color: const Color.fromARGB(255, 110, 79, 68),),
      child:  Center(
        child: Container(
          width: Cwidgth*0.95,
          height: Cheight*1.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
              boxShadow: [
                BoxShadow(
                  color: Colors.black38, // Shadow color
                  offset: Offset(0, 2), // Offset of the shadow
                  blurRadius: 15.0, // Spread of the shadow
                ),
              ],
              color:    const Color.fromARGB(255, 152, 97, 65)),
          child: Column(

            children: [
              SizedBox(height: Cheight*0.015,),
              Row( children: [
                SizedBox(width: Cheight*0.026,),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReadPage(lang: lang,)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: Cwidgth*0.9*0.46,
                      height: Cheight*0.9*0.55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38, // Shadow color
                              offset: Offset(0, 2), // Offset of the shadow
                              blurRadius: 15.0, // Spread of the shadow
                            ),
                          ],
                          color:    const Color.fromARGB(255, 211, 232, 239)),
                      child: Center(
                        child: Text(lang?"Basic Reading":"मूलभूत वाचन", style: GoogleFonts.lacquer(
                              fontSize: Cwidgth*0.125
                        ),textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KnowPage(lang: lang,)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: Cwidgth*0.9*0.46,
                      height: Cheight*0.9*0.55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38, // Shadow color
                              offset: Offset(0, 2), // Offset of the shadow
                              blurRadius: 15.0, // Spread of the shadow
                            ),
                          ],
                          color:    const Color.fromARGB(255, 255, 255, 255)),
                      child: Column(
                          children: [
                            Container(
                                width: Cwidgth*0.9*0.46*0.9,
                                height: Cwidgth*0.9*0.46*0.8,
                                child: Image.asset('images/brain.png')),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(lang?"knowledge":"मूलभूत ज्ञान", style: GoogleFonts.lacquer(
                                  fontSize: Cwidgth*0.08,
                                color: Color.fromARGB(255, 23, 120, 128),
                              ),textAlign: TextAlign.center, ),
                            )
                          ],
                      ),
                    ),
                  ),
                )
              ],),
              Row( children: [
                SizedBox(width: Cheight*0.026,),
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CraftPage(lang: lang,)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: Cwidgth*0.9*0.46,
                      height: Cheight*0.9*0.55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38, // Shadow color
                              offset: Offset(0, 2), // Offset of the shadow
                              blurRadius: 15.0, // Spread of the shadow
                            ),
                          ],
                          color:    const Color.fromARGB(255, 211, 232, 239)),
                      child: Column(
                        children: [
                          Container(
                              width: Cwidgth*0.9*0.46*0.9,
                              height: Cwidgth*0.9*0.46*0.8,
                              child: Image.asset('images/origami.png')),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(lang?"Crafts":"हस्तकला", style: GoogleFonts.lacquer(
                              fontSize: Cwidgth*0.08,
                              color: Color.fromARGB(255, 23, 120, 128),
                            ),textAlign: TextAlign.center, ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Words()));
                      },
                    child: Container(
                      width: Cwidgth*0.9*0.46,
                      height: Cheight*0.9*0.55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38, // Shadow color
                              offset: Offset(0, 2), // Offset of the shadow
                              blurRadius: 15.0, // Spread of the shadow
                            ),
                          ],
                          color:   const Color.fromARGB(255, 211, 232, 239)),
                      child: Center(
                        child: Text(lang?"Words Reading":"शब्द वाचन", style: GoogleFonts.lacquer(
                            fontSize: Cwidgth*0.125
                        ),textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                )
              ],),
            ],
          ),
        ),
      ) ,
    );
  }
}