import 'package:flutter/material.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/Screens/Alphabate.dart';
import 'package:vachanapp/Screens/Number.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/colorcard.dart';


class ColorPage extends StatelessWidget {

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
                        SizedBox(height: cheight*0.03,),
                        Row(
                            children: [
                              SizedBox(width: cwidgth*0.05,),
                              ColorBox(colorboxText: "red", color: Colors.red,
                              bcolor: Color.fromARGB(255, 253, 203, 229), flag: true,),
                              SizedBox(width: cwidgth*0.05,),
                              ColorBox(colorboxText: "orange", color: Colors.orange,
                                bcolor: Color.fromARGB(255, 195, 255, 215), flag: false,),
                            ],),
                    SizedBox(height: cheight*0.03,),
                    Row(
                      children: [
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: "yellow", color: Colors.yellow,
                          bcolor: Color.fromARGB(255, 188, 245, 255), flag: false,),
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: "Skin Color", color: Color.fromARGB(255, 250, 201, 169),
                          bcolor: Color.fromARGB(255, 222, 201, 253), flag: true,),
                      ],),
                    SizedBox(height: cheight*0.03,),
                    Row(
                      children: [
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: "white", color: Colors.white,
                          bcolor: Color.fromARGB(255, 253, 203, 229), flag: true,),
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: "pink", color: Color.fromARGB(
                            255, 252, 88, 229),
                          bcolor: Color.fromARGB(255, 195, 255, 215), flag: false,),
                      ],),
                    SizedBox(height: cheight*0.03,),
                    Row(
                      children: [
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: "Violet", color: Colors.deepPurpleAccent,
                          bcolor: Color.fromARGB(255, 188, 245, 255), flag: false,),
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: "Blue", color: Color.fromARGB(
                            255, 30, 98, 246),
                          bcolor: Color.fromARGB(255, 222, 201, 253), flag: true,),
                      ],),
                    SizedBox(height: cheight*0.03,),
                    Row(
                      children: [
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: "Sky Blue", color: Color.fromARGB(255, 42, 222, 248),
                          bcolor: Color.fromARGB(255, 253, 203, 229), flag: true,),
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: "Parrot green", color: Colors.lightGreenAccent,
                          bcolor: Color.fromARGB(255, 195, 255, 215), flag: false,),
                      ],),
                    SizedBox(height: cheight*0.03,),
                    Row(
                      children: [
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: "Green", color: Color.fromARGB(
                            255, 29, 145, 87),
                          bcolor: Color.fromARGB(255, 188, 245, 255), flag: false,),
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: "brown", color: Colors.brown,
                          bcolor: Color.fromARGB(255, 222, 201, 253), flag: true,),
                      ],),
                    SizedBox(height: cheight*0.03,),
                    Row(
                      children: [
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: "grey", color: Colors.grey,
                          bcolor: Color.fromARGB(255, 253, 203, 229), flag: true,),
                        SizedBox(width: cwidgth*0.05,),
                        ColorBox(colorboxText: "Black", color: Colors.black,
                          bcolor: Color.fromARGB(255, 195, 255, 215), flag: false,),
                      ],),
                    SizedBox(height: cheight*0.03,),


                  ],

                ),
              )
            ]));
  }
}
