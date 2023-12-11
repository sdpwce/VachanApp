import 'package:flutter/material.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/Screens/Alphabate.dart';
import 'package:vachanapp/Screens/Number.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/colorcard.dart';


class ColorPage extends StatelessWidget {
  const ColorPage({Key? key, required this.lang,}) : super(key: key);
  final bool lang;
  @override
  Widget build(BuildContext context) {
    var cwidgth = MediaQuery.of(context).size.width;
    var cheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor:  const Color.fromARGB(255, 211, 232, 239),
        appBar: Appbar(apptext: "वाचन", ),

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
                        SizedBox(height: cheight*0.03,),
                        Row(
                            children: [
                              SizedBox(width: cwidgth*0.05,),
                              ColorBox(colorboxText: lang?"Red":"लाल", color: Colors.red,
                              bcolor: Color.fromARGB(255, 253, 203, 229), flag: true, lang: lang,),
                              SizedBox(width: cwidgth*0.05,),
                              ColorBox(colorboxText: lang?"Orange":"नारिंगी", color: Colors.orange,
                                bcolor: Color.fromARGB(255, 195, 255, 215), flag: false, lang: lang),
                            ],),
                    SizedBox(height: cheight*0.03,),
                    Row(
                      children: [
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: lang?"Yellow":"पिवळा", color: Colors.yellow,
                          bcolor: Color.fromARGB(255, 188, 245, 255), flag: false, lang: lang),
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: lang?"Skin Colour":"त्वचेचा रंग", color: Color.fromARGB(255, 250, 201, 169),
                          bcolor: Color.fromARGB(255, 222, 201, 253), flag: true, lang: lang),
                      ],),
                    SizedBox(height: cheight*0.03,),
                    Row(
                      children: [
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: lang?"White":"पांढरा", color: Colors.white,
                          bcolor: Color.fromARGB(255, 253, 203, 229), flag: true, lang: lang),
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: lang?"Pink":"गुलाबी", color: Color.fromARGB(
                            255, 252, 88, 229),
                          bcolor: Color.fromARGB(255, 195, 255, 215), flag: false, lang: lang),
                      ],),
                    SizedBox(height: cheight*0.03,),
                    Row(
                      children: [
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: lang?"Violet":"जांभळा", color: Colors.deepPurpleAccent,
                          bcolor: Color.fromARGB(255, 188, 245, 255), flag: false, lang: lang),
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: lang?"Blue":"निळा", color: Color.fromARGB(
                            255, 30, 98, 246),
                          bcolor: Color.fromARGB(255, 222, 201, 253), flag: true, lang: lang),
                      ],),
                    SizedBox(height: cheight*0.03,),
                    Row(
                      children: [
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: lang?"Sky Blue":"आकाशी", color: Color.fromARGB(255, 42, 222, 248),
                          bcolor: Color.fromARGB(255, 253, 203, 229), flag: true, lang: lang),
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: lang?"Parrot Green":"पोपट हिरवा", color: Colors.lightGreenAccent,
                          bcolor: Color.fromARGB(255, 195, 255, 215), flag: false, lang: lang),
                      ],),
                    SizedBox(height: cheight*0.03,),
                    Row(
                      children: [
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: lang?"Green":"हिरवा", color: Color.fromARGB(
                            255, 29, 145, 87),
                          bcolor: Color.fromARGB(255, 188, 245, 255), flag: false, lang: lang),
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: lang?"Brown":"तपकिरी", color: Colors.brown,
                          bcolor: Color.fromARGB(255, 222, 201, 253), flag: true, lang: lang),
                      ],),
                    SizedBox(height: cheight*0.03,),
                    Row(
                      children: [
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: lang?"Grey":"राखाडी", color: Colors.grey,
                          bcolor: Color.fromARGB(255, 253, 203, 229), flag: true, lang: lang),
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: lang?"Black":"काळा", color: Colors.black,
                          bcolor: Color.fromARGB(255, 195, 255, 215), flag: false, lang: lang),
                      ],),
                    SizedBox(height: cheight*0.03,),


                  ],

                ),
              )
            ]));
  }
}
