import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vachanapp/detailC.dart';

import '../Screens/ColorDetail.dart';
import '../widgets/AppBar.dart';
import '../widgets/SmallButton.dart';

class Plain extends StatelessWidget {
  Plain({Key? key,
   required this.lang,
  })
      : super(key: key);
  final bool lang;
  FlutterTts flutterTts = FlutterTts();

  Future<void> initTts() async {
    await flutterTts.setLanguage('en-IN');
    await flutterTts.setSpeechRate(0.6);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(0.8);
  }

  Future<void> speak(String text) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.3);
    await flutterTts.setPitch(0.9);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    var cwidgth = MediaQuery.of(context).size.width;
    var cheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor:  const Color.fromARGB(255, 211, 232, 239),
        appBar: Appbar(apptext: "वाचन",),

        body: Stack(
            children:[  Image.asset(
              'images/backg2.jpg',
              fit: BoxFit.cover, // You can adjust the fit property as needed
              width: double.infinity,
              height: double.infinity,
            ),
              SingleChildScrollView(
                child: Column(
                  children: [
                            Container(height: cheight*0.25,
                              child: Row(  children: [
                                Container(width: cwidgth*0.5,
                                   child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                           Container(width: cwidgth*0.35, height: cheight*0.25*0.74,
                                             child:  Container(
                                                   decoration: BoxDecoration(
                                                     borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                                                     boxShadow: [
                                                       BoxShadow(
                                                         color: Colors.black38, // Shadow color
                                                         offset: Offset(0, 2), // Offset of the shadow
                                                         blurRadius: 4.0, // Spread of the shadow
                                                       ),
                                                     ],),
                                                   child: Image.asset("images/p1.jpeg"))
                                            )
                                       ],
                                   ),),
                                Column(
                                    children: [
                                        SizedBox(height: cheight*0.25*0.2,),
                                       Text(lang?"Step 1.":"पाऊल १", style: GoogleFonts.lacquer(
                                         fontSize: cwidgth*0.07,
                                         fontWeight: FontWeight.bold,
                                         //   color: Color.fromARGB(255, 23, 120, 128),
                                       ),textAlign: TextAlign.center,),
                                        Container(height: cheight*0.25*0.3,
                                            child: Padding(
                                              padding:  EdgeInsets.all(cwidgth*0.02),
                                              child: Text(lang?"Fold in half lengthwise":"अर्ध्या लांबीच्या दिशेने दुमडावा ",
                                                style: TextStyle(fontSize: lang?cwidgth*0.046:cwidgth*0.046, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                            )
                                        ),
                                        SButton(ButtonText: lang?"Listen":"ऐका", onTap: (){speak(lang?"Fold in half lengthwise":"अर्ध्या लांबीच्या दिशेने दुमडावा",);},),
                                    ],
                                )
                              ],),),
                    Container(width: cwidgth*0.92,
                      child: Container(
                        height:  cheight*0.03*0.15,
                        color: Colors.black,
                      ),),
                    Container(height: cheight*0.35,
                        child: Column(
                            children: [
                                  Container(height: cheight*0.3*0.8,
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Container(width: cwidgth*0.35, height: cheight*0.3*0.6,
                                             child:  Container(
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                                                   boxShadow: [
                                                     BoxShadow(
                                                       color: Colors.black38, // Shadow color
                                                       offset: Offset(0, 2), // Offset of the shadow
                                                       blurRadius: 4.0, // Spread of the shadow
                                                     ),
                                                   ],),
                                                 child: Image.asset("images/p2.jpeg"))
                                         ),
                                         SizedBox(width: cwidgth*0.13,),
                                         Container(width: cwidgth*0.35, height: cheight*0.3*0.6,
                                             child:  Container(
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                                                   boxShadow: [
                                                     BoxShadow(
                                                       color: Colors.black38, // Shadow color
                                                       offset: Offset(0, 2), // Offset of the shadow
                                                       blurRadius: 4.0, // Spread of the shadow
                                                     ),
                                                   ],),
                                                 child: Image.asset("images/p3.jpeg"))
                                         ),
                                       ],),
                                      ),
                                 Row(children: [
                                   SizedBox(width: cwidgth*0.03,),
                                   Text(lang?"Step 2.":"पाऊल २", style: GoogleFonts.lacquer(
                                     fontSize: cwidgth*0.07,
                                     fontWeight: FontWeight.bold,
                                     //   color: Color.fromARGB(255, 23, 120, 128),
                                   ),textAlign: TextAlign.center,),
                                 Padding(
                                         padding:  EdgeInsets.all(cwidgth*0.02),
                                         child: Text(lang?"Fold down top corners to center line":"वरचे कोपरे मध्य रेषेपर्यंत खाली दुमडावा ",
                                           style: TextStyle(fontSize: lang?cwidgth*0.046:cwidgth*0.046, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                       ),
                                    ],),
                              SButton(ButtonText: lang?"Listen":"ऐका", onTap: (){speak(lang?"Fold down top corners to center line":"वरचे कोपरे मध्य रेषेपर्यंत खाली दुमडावा ");},),

                            ],
                        ),
                      ),
                    Container(width: cwidgth*0.92,
                      child: Container(
                        height:  cheight*0.03*0.15,
                        color: Colors.black,
                      ),),
                    Container(height: cheight*0.35,
                      child: Column(
                        children: [
                          Container(height: cheight*0.3*0.8,
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(width: cwidgth*0.48, height: cheight*0.3*0.5,
                                    child:  Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black38, // Shadow color
                                              offset: Offset(0, 2), // Offset of the shadow
                                              blurRadius: 4.0, // Spread of the shadow
                                            ),
                                          ],),
                                        child: Image.asset("images/p4.jpeg"))
                                ),
                              ],),
                          ),
                          Row(children: [
                            SizedBox(width: cwidgth*0.03,),
                            Text(lang?"Step 3.":"पाऊल ३.", style: GoogleFonts.lacquer(
                              fontSize: cwidgth*0.07,
                              fontWeight: FontWeight.bold,
                              //   color: Color.fromARGB(255, 23, 120, 128),
                            ),textAlign: TextAlign.center,),
                            Padding(
                              padding:  EdgeInsets.all(cwidgth*0.02),
                              child: Text(lang?"Fold down an inch from the bottom edge":"खालच्या काठावरुन एक इंच खाली दुमडावा",
                                style: TextStyle(fontSize: lang?cwidgth*0.046:cwidgth*0.046, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            ),
                          ],),
                          SButton(ButtonText: lang?"Listen":"ऐका", onTap: (){speak(lang?"Fold down top corners to center line":"खालच्या काठावरुन एक इंच खाली दुमडावा");},),

                        ],
                      ),
                    ),
                    Container(width: cwidgth*0.92,
                      child: Container(
                        height:  cheight*0.03*0.15,
                        color: Colors.black,
                      ),),
                    Container(height: cheight*0.35,
                      child: Column(
                        children: [
                          Container(height: cheight*0.3*0.8,
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(width: cwidgth*0.42, height: cheight*0.3*0.45,
                                    child:  Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black38, // Shadow color
                                              offset: Offset(0, 2), // Offset of the shadow
                                              blurRadius: 4.0, // Spread of the shadow
                                            ),
                                          ],),
                                        child: Image.asset("images/p5.jpeg"))
                                ),
                                SizedBox(width: cwidgth*0.08,),
                                Container(width: cwidgth*0.42, height: cheight*0.3*0.45,
                                    child:  Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black38, // Shadow color
                                              offset: Offset(0, 2), // Offset of the shadow
                                              blurRadius: 4.0, // Spread of the shadow
                                            ),
                                          ],),
                                        child: Image.asset("images/p6.jpeg"))
                                ),
                              ],),
                          ),
                          Row(children: [
                            SizedBox(width: cwidgth*0.03,),
                            Text(lang?"Step 4.":"पाऊल ४.", style: GoogleFonts.lacquer(
                              fontSize: cwidgth*0.07,
                              fontWeight: FontWeight.bold,
                              //   color: Color.fromARGB(255, 23, 120, 128),
                            ),textAlign: TextAlign.center,),
                            Padding(
                              padding:  EdgeInsets.all(cwidgth*0.02),
                              child: Text(lang?"Fold down new top corners to center line":"वरचे नवीन कोपरे मध्य रेषेपर्यंत खाली दुमडावा ",
                                style: TextStyle(fontSize: lang?cwidgth*0.046:cwidgth*0.046, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            ),
                          ],),
                          SButton(ButtonText: lang?"Listen":"ऐका", onTap: (){speak(lang?"Fold down new top corners to center line":"वरचे नवीन कोपरे मध्य रेषेपर्यंत खाली दुमडावा ");},),

                        ],
                      ),

                    ),
                    Container(width: cwidgth*0.92,
                      child: Container(
                        height:  cheight*0.03*0.15,
                        color: Colors.black,
                      ),),
                    Container(height: cheight*0.25,
                      child: Row(  children: [
                        Container(width: cwidgth*0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(width: cwidgth*0.35, height: cheight*0.25*0.74,
                                  child:  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black38, // Shadow color
                                            offset: Offset(0, 2), // Offset of the shadow
                                            blurRadius: 4.0, // Spread of the shadow
                                          ),
                                        ],),
                                      child: Image.asset("images/p8.jpeg"))
                              )
                            ],
                          ),),
                        Column(
                          children: [
                            SizedBox(height: cheight*0.25*0.2,),
                            Text(lang?"Step 5.":"पाऊल ५", style: GoogleFonts.lacquer(
                              fontSize: cwidgth*0.07,
                              fontWeight: FontWeight.bold,
                              //   color: Color.fromARGB(255, 23, 120, 128),
                            ),textAlign: TextAlign.center,),
                            Container(height: cheight*0.25*0.3,
                                child: Padding(
                                  padding:  EdgeInsets.all(cwidgth*0.02),
                                  child: Text(lang?"Fold over center line":"मध्य रेषेवर दुमडावा करा",
                                    style: TextStyle(fontSize: lang?cwidgth*0.046:cwidgth*0.046, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                )
                            ),
                            SButton(ButtonText: lang?"Listen":"ऐका", onTap: (){speak(lang?"Fold over center line":"मध्य रेषेवर दुमडावा करा",);},),
                          ],
                        )
                      ],),),
                    Container(width: cwidgth*0.92,
                      child: Container(
                        height:  cheight*0.03*0.15,
                        color: Colors.black,
                      ),),
                    Container(height: cheight*0.35,
                      child: Column(
                        children: [
                          Container(height: cheight*0.3*0.8,
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(width: cwidgth*0.48, height: cheight*0.3*0.5,
                                    child:  Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black38, // Shadow color
                                              offset: Offset(0, 2), // Offset of the shadow
                                              blurRadius: 4.0, // Spread of the shadow
                                            ),
                                          ],),
                                        child: Image.asset("images/p10.jpeg"))
                                ),
                              ],),
                          ),
                          Row(children: [
                            SizedBox(width: cwidgth*0.03,),
                            Text(lang?"Step 7.":"पाऊल ७.", style: GoogleFonts.lacquer(
                              fontSize: cwidgth*0.07,
                              fontWeight: FontWeight.bold,
                              //   color: Color.fromARGB(255, 23, 120, 128),
                            ),textAlign: TextAlign.center,),
                            Padding(
                              padding:  EdgeInsets.all(cwidgth*0.02),
                              child: Text(lang?"Fold down wings":"पंख खाली दुमडावा",
                                style: TextStyle(fontSize: lang?cwidgth*0.046:cwidgth*0.046, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            ),
                          ],),
                          SButton(ButtonText: lang?"Listen":"ऐका", onTap: (){speak(lang?"Fold down top corners to center line":"पंख खाली दुमडावा");},),

                        ],
                      ),
                    ),
                    Container(width: cwidgth*0.92,
                      child: Container(
                        height:  cheight*0.03*0.15,
                        color: Colors.black,
                      ),),
                    Container(height: cheight*0.35,
                      child: Column(
                        children: [
                          Container(height: cheight*0.3*0.8,
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(width: cwidgth*0.44, height: cheight*0.3*0.52,
                                    child:  Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black38, // Shadow color
                                              offset: Offset(0, 2), // Offset of the shadow
                                              blurRadius: 4.0, // Spread of the shadow
                                            ),
                                          ],),
                                        child: Image.asset("images/p11.jpeg"))
                                ),
                              ],),
                          ),
                          Row(children: [
                            SizedBox(width: cwidgth*0.03,),
                            Text(lang?"Step 8.":"पाऊल ८.", style: GoogleFonts.lacquer(
                              fontSize: cwidgth*0.07,
                              fontWeight: FontWeight.bold,
                              //   color: Color.fromARGB(255, 23, 120, 128),
                            ),textAlign: TextAlign.center,),
                            Padding(
                              padding:  EdgeInsets.all(cwidgth*0.02),
                              child: Text(lang?"Creating an according fold":"त्यानुसार पट तयार करणे",
                                style: TextStyle(fontSize: lang?cwidgth*0.046:cwidgth*0.046, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            ),
                          ],),
                          SButton(ButtonText: lang?"Listen":"ऐका", onTap: (){speak(lang?"Creating an according fold":"त्यानुसार पट तयार करणे");},),

                        ],
                      ),
                    ),
                    Container(width: cwidgth*0.92,
                      child: Container(
                        height:  cheight*0.03*0.15,
                        color: Colors.black,
                      ),),
                    Container(height: cheight*0.25,
                      child: Row(  children: [
                        Container(width: cwidgth*0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(width: cwidgth*0.31, height: cheight*0.25*0.74,
                                  child:  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black38, // Shadow color
                                            offset: Offset(0, 2), // Offset of the shadow
                                            blurRadius: 4.0, // Spread of the shadow
                                          ),
                                        ],),
                                      child: Image.asset("images/p12.jpeg"))
                              )
                            ],
                          ),),
                        Column(
                          children: [
                            SizedBox(height: cheight*0.25*0.2,),
                            Text(lang?"Step 9.":"पाऊल ९", style: GoogleFonts.lacquer(
                              fontSize: cwidgth*0.07,
                              fontWeight: FontWeight.bold,
                              //   color: Color.fromARGB(255, 23, 120, 128),
                            ),textAlign: TextAlign.center,),
                            Container(height: cheight*0.25*0.3,
                                child: Padding(
                                  padding:  EdgeInsets.all(cwidgth*0.02),
                                  child: Text(lang?"repeat for other wing":"तेच पुन्हा  करा",
                                    style: TextStyle(fontSize: lang?cwidgth*0.046:cwidgth*0.046, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                )
                            ),
                            SButton(ButtonText: lang?"Listen":"ऐका", onTap: (){speak(lang?"repeat for other wing":"तेच पुन्हा  करा",);},),
                          ],
                        )
                      ],),),
                    Container(width: cwidgth*0.92,
                      child: Container(
                        height:  cheight*0.03*0.15,
                        color: Colors.black,
                      ),),
                    Container(height: cheight*0.3*0.8,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(width: cwidgth*0.44, height: cheight*0.3*0.52,
                              child:  Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38, // Shadow color
                                        offset: Offset(0, 2), // Offset of the shadow
                                        blurRadius: 4.0, // Spread of the shadow
                                      ),
                                    ],),
                                  child: Image.asset("images/p13.jpeg"))
                          ),
                        ],),
                    ),
                        ],
                      ),
              ),
            ]));
  }
}
