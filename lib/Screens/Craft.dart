import 'package:flutter/material.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/widgets/Heading.dart';
import 'package:vachanapp/Screens/Alphabate.dart';
import 'package:vachanapp/Screens/Number.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Plain.dart';


class CraftPage extends StatelessWidget {
  const CraftPage({Key? key, required this.lang,}) : super(key: key);
  final bool lang;
  @override
  Widget build(BuildContext context) {
    var cwidgth = MediaQuery.of(context).size.width;
    var cheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor:  const Color.fromARGB(255, 211, 232, 239),
        appBar: Appbar(apptext: "वाचन",),

        body: Stack(
            children:[  Image.asset(
              'images/back3.jpg',
              fit: BoxFit.cover, // You can adjust the fit property as needed
              width: double.infinity,
              height: double.infinity,
            ),
              Column(
                children: [
                    Container(height: cheight*0.4,
                      child: Column(
                          children: [
                             SizedBox(height: cheight*0.4*0.1,),
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Plain(lang: lang),));
                                },
                                child: Container(height: cheight*0.4*0.7,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                           Container(width: cwidgth*0.6, height: cheight*0.4*0.5,
                                           child: Container(
                                               decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                                                 boxShadow: [
                                                   BoxShadow(
                                                     color: Colors.black38, // Shadow color
                                                     offset: Offset(0, 2), // Offset of the shadow
                                                     blurRadius: 4.0, // Spread of the shadow
                                                   ),
                                                 ],),
                                               child: Image.asset("images/paperplane.jpg")),)
                                      ],
                                  ),),
                              ),
                            Container(height: cheight*0.4*0.2, child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(lang?"Paper Plain":"कागदी विमान", style: GoogleFonts.lacquer(
                                        fontSize: cwidgth*0.09,
                                        fontWeight: FontWeight.bold,
                                        //   color: Color.fromARGB(255, 23, 120, 128),
                                      ),textAlign: TextAlign.center, ),
                                    ],
                                  ),
                                ],
                            ),)
                          ],
                      ),),
                    Container(height: cheight*0.4,
                      child: Column(
                        children: [
                          SizedBox(height: cheight*0.4*0.1,),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Number(lang: lang),));
                            },
                            child: Container(height: cheight*0.4*0.7,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(width: cwidgth*0.6, height: cheight*0.4*0.45,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black38, // Shadow color
                                              offset: Offset(0, 2), // Offset of the shadow
                                              blurRadius: 4.0, // Spread of the shadow
                                            ),
                                          ],),
                                        child: Image.asset("images/paperboat.jpg")),)
                                ],
                              ),),
                          ),
                          Container(height: cheight*0.4*0.2, child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(lang?"Paper Boat":"कागदी बोट", style: GoogleFonts.lacquer(
                                    fontSize: cwidgth*0.09,
                                    fontWeight: FontWeight.bold,
                                    //   color: Color.fromARGB(255, 23, 120, 128),
                                  ),textAlign: TextAlign.center, ),
                                ],
                              ),
                            ],
                          ),)
                        ],
                      ),
                    ),
                ],
              ),
            ]));
  }
}
