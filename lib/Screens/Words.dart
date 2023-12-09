import 'package:flutter/material.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/widgets/MidBox.dart';
import 'package:vachanapp/widgets/ballons.dart';
class Words extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cwidth = MediaQuery.of(context).size.height;
    var cheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:  Appbar(apptext: "वाचन",),
      body: Stack(
          children: [
            Image.asset(
              'images/back3.jpg',
              fit: BoxFit.cover, // You can adjust the fit property as needed
              width: double.infinity,
              height: double.infinity,
            ),
            SingleChildScrollView(
              child: Column(

                children: [
                   SizedBox(height: cheight*0.01,),
                    Container(height: cheight*0.03,
                      child: Text("Press on ballons for Words Starting with that letter...", style: TextStyle(
                           color: Color.fromARGB(255, 71, 24, 140),
                           fontSize: cwidth*0.02,
                      ),),
                      ),
                      Container(height: cheight*0.15,
                      child: Row(children: [
                          Column(
                            children: [
                              Container(width: cwidth*0.08, child: Row( mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RedB(BText: 'A', flag: true, v: 0,),
                                ],
                              ),),
                            ],
                          ),
                          Column( mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(width: cwidth*0.1, child: Row( mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BlueB(BText: 'B', flag: true, s: true, v: 1),
                                ],
                              ),),
                            ],
                          ),
                        Container(width: cwidth*0.09, child: Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            YellowB(BText: 'C', flag: false, v: 2),
                          ],
                        ), ),
                        Container(width: cwidth*0.11, child: Row(  mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GreenB(BText: 'D', flag: false, v: 3),
                          ],
                        ),),
                        Column(
                          children: [
                            Container(width: cwidth*0.08,  child: VioletB(BText: 'E', flag: true,s: true , v: 4),),
                          ],
                        ),

                      ],),),
                  Container(height: cheight*0.15,
                    child: Row(children: [
                      Column(
                        children: [
                          Container(width: cwidth*0.08, child: Row(  mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              YellowB(BText: 'F', flag: false, v: 5),
                            ],
                          ),),
                        ],
                      ),
                      Column(  mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(width: cwidth*0.11,   child: PinkB(BText: 'G', flag: true, s: true, v: 6),),
                        ],
                      ),
                      Column(
                        children: [
                          Container(width: cwidth*0.09,child: VioletB(BText: 'H', flag: true, s: false, v: 7),),
                        ],
                      ),
                      Container(width: cwidth*0.1, child: BlueB(BText: 'I', flag: true, s: false, v: 8),),
                      Column(
                        children: [
                          Container(width: cwidth*0.08, child: RedB(BText: 'J', flag: true, v: 9)),
                        ],
                      ),],),
                      ),
                  Container(height: cheight*0.15,
                    child: Row(children: [
                      Column(
                        children: [
                          Container(width: cwidth*0.09, child: Row(  mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RedB(BText: 'K', flag: true, v: 10),
                            ],
                          )),
                        ],
                      ),
                      Column(  mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(width: cwidth*0.07, child: YellowB(BText: 'L', flag: false, v: 11),),
                        ],
                      ),
                      Column(
                        children: [
                          Container(width: cwidth*0.07, child: VioletB(BText: 'M', flag: true, s: false, v: 12),),
                        ],
                      ),
                      Column( mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(width: cwidth*0.08, child: YellowB(BText: 'N', flag: false, v: 13),),
                        ],
                      ),
                      Column(
                        children: [
                          Container(width: cwidth*0.08, child: GreenB(BText: 'O', flag: false, v: 14),),
                        ],
                      ),
                      Column(  mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(width: cwidth*0.07, child: VioletB(BText: 'P', flag: true, s: true, v: 15),  ),
                        ],
                      ),
                    ],),
                  ),
                  Container(height: cheight*0.15,
                    child: Row(children: [
                      Column(
                        children: [
                          Container(width: cwidth*0.08, child: Row( mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              VioletB(BText: 'Q', flag: true, s: false, v: 16),
                            ],
                          ),),
                        ],
                      ),
                      Container(width: cwidth*0.11,  child: BlueB(BText: 'R', flag: true, s: true, v: 17),),
                      Column(
                        children: [
                          Container(width: cwidth*0.09,  child: GreenB(BText: 'S', flag: false, v: 18),),
                        ],
                      ),
                      Container(width: cwidth*0.1,   child: PinkB(BText: 'T', flag: true,s: true, v: 19)),
                      Container(width: cwidth*0.08,  child: RedB(BText: 'U', flag: true, v: 20)),],),),
                  Container(height: cheight*0.15,
                    child: Row(children: [
                      Column(
                        children: [
                          Container(width: cwidth*0.08, child: Row( mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GreenB(BText: 'V', flag: false, v: 21),
                            ],
                          )),
                        ],
                      ),
                      Column(  mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(width: cwidth*0.1, child: PinkB(BText: 'W', flag: true, s: false, v: 22)),
                        ],
                      ),
                      Column(
                        children: [
                          Container(width: cwidth*0.09, child: Row(
                            children: [
                              VioletB(BText: 'X', flag: true, s: true, v: 23),
                            ],
                          )),
                        ],
                      ),
                      Container(width: cwidth*0.11, child: BlueB(BText: 'Y', flag: true, s: true, v: 24)),
                      Column(
                        children: [
                          Container(width: cwidth*0.08, child: YellowB(BText: 'Z', flag: false, v: 25)),
                        ],
                      ),

                    ],),),
                ],
              ),
            ),
          ]
      ),
    );
  }
}
