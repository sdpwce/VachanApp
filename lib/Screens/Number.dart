import 'package:flutter/material.dart';
import 'package:vachanapp/Screens/NumberDetail.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/widgets/drop.dart';

class Number extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var Cwidgth = MediaQuery.of(context).size.height*0.38;
    var Cheight = MediaQuery.of(context).size.height*0.38;
    return Scaffold(
      appBar:  Appbar(apptext: "वाचन",),
      body: Stack(
        children: [
          Image.asset(
            'images/background2.jpg',
            fit: BoxFit.cover, // You can adjust the fit property as needed
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
          child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.4,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                      children: [
                          Container(
                             width: MediaQuery.of(context).size.width*0.6,
                             child: Column(
                                   children: [
                                        Container(height:  MediaQuery.of(context).size.height*0.4*0.25, width:  MediaQuery.of(context).size.width*0.5,
                                          //color: Colors.white38,
                                          child: Image.asset('images/weather11.png'),),
                                        Container(height:  MediaQuery.of(context).size.height*0.4*0.45,
                                            // color: Colors.cyanAccent,
                                          child: Row(
                                              children: [
                                                Container( width: MediaQuery.of(context).size.width*0.6*0.5,
                                                  // color: Colors.cyanAccent,
                                                 child: Column(
                                                   mainAxisAlignment: MainAxisAlignment.end,
                                                     children: [BigDrop(DropText: '1', three: false,)],
                                                 ),),
                                                Container( width: MediaQuery.of(context).size.width*0.6*0.5,
                                                  // color: Colors.amber,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [Drop(DropText: '0')],
                                                  ),),
                                              ],
                                          )),

                                        Container(height:  MediaQuery.of(context).size.height*0.4*0.3,
                                          //color: Colors.deepPurpleAccent,
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.center, children: [ SizedBox(width: MediaQuery.of(context).size.width*0.5*0.1,),
                                             SmallDrop(DropText: '2', four: false,)],
                                           ),),
                                   ],
                             ),
                          ),
                          Container(width: MediaQuery.of(context).size.width*0.4,
                            //color: Colors.green,
                            child: Column(
                              children: [
                                 //  Container(height:  MediaQuery.of(context).size.height*0.4*0.1,),
                                   Container(height:  MediaQuery.of(context).size.height*0.4*0.55,
                                     //color: Colors.lightBlue,
                                     child: Row( mainAxisAlignment: MainAxisAlignment.end,  children: [
                                          Image.asset('images/weather33.png')
                                     ],),),
                                   Row(
                                     children: [
                                       Container(
                                         width: MediaQuery.of(context).size.width*0.4*0.5,
                                         //color: Colors.grey,
                                         height: MediaQuery.of(context).size.height*0.4*0.45,
                                         child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                             children: [BigDrop(DropText: '3', three: true,)],
                                         ),
                                       ),
                                       Container(
                                         width: MediaQuery.of(context).size.width*0.4*0.5,
                                         //color: Colors.tealAccent,
                                         height: MediaQuery.of(context).size.height*0.4*0.45,
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           children: [SmallDrop(DropText: '4', four: true,)],
                                         ),
                                       )
                                     ],
                                   )
                              ],
                            ),),

                      ],
                  ),
                ),
                /// 5 6 7
                Container(
                  height: MediaQuery.of(context).size.height*0.16,
                    //color: Colors.pink,
                    child: Row(
                           children: [
                                Container( width:MediaQuery.of(context).size.width*0.33 ,
                                  //color: Colors.black12,
                                 child: Column( mainAxisAlignment: MainAxisAlignment.end, children: [ Drop(DropText: '5')],),),
                                Container( width :MediaQuery.of(context).size.width*0.33,
                                    //color: Colors.white,
                                    child: Column( mainAxisAlignment: MainAxisAlignment.start, children: [ BigDrop(DropText: '6', three: false,)],)),
                                Container(width: MediaQuery.of(context).size.width*0.33,
                                    //color: Colors.black,
                                    child: Column( mainAxisAlignment: MainAxisAlignment.end, children: [ SmallDrop(DropText: '7', four: false,)],)),
                           ],
                    ),
                ),
                ////8, 9
                Container(
                    height: MediaQuery.of(context).size.height*0.46,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                        children: [
                            Container(width: MediaQuery.of(context).size.width*0.5,
                             child: Column(
                                  children: [
                                     Container(height: MediaQuery.of(context).size.height*0.46*0.445,
                                       //color: Colors.brown,
                                     child: Row(
                                         children: [
                                            Container(width: MediaQuery.of(context).size.width*0.5*0.5,
                                              //color: Colors.white38,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: MediaQuery.of(context).size.height*0.46*0.15,),
                                                  SmallDrop(DropText: '9', four: false,)],
                                              ),),
                                           Container(width: MediaQuery.of(context).size.width*0.5*0.5,
                                             //color: Colors.pink,
                                             child: Column(
                                               mainAxisAlignment: MainAxisAlignment.start,
                                               children: [ Drop(DropText: '8')],
                                             ),),
                                         ],
                                     ),),
                                  Container(height: MediaQuery.of(context).size.height*0.46*0.35,
                                   // color: Colors.purple,
                                    child: Row(
                                        children: [
                                                  InkWell(
                                                  onTap: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  NumberDetail()));
                                              },
                                              child:
                                            Stack(

                                              children:[  Container(
                                                    width: MediaQuery.of(context).size.width*0.5 ,
                                                    child: Image.asset('images/Grass.png')),

                                                Positioned(
                                                  top: Cheight*0.13, // Adjust the top position as needed
                                                  left: Cheight*0.2, // Adjust the left position as needed
                                                  child: Container(
                                                    padding: EdgeInsets.all(10),
                                                    // Adjust the background color and opacity
                                                    child: Text(
                                                      "Learn",
                                                      style: TextStyle(
                                                        color: Colors.black, // Text color
                                                        fontSize: Cheight*0.08,
                                                        fontWeight: FontWeight.bold// Text font size
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                             ],

                                            ),
                                                  ),
                                        ],
                                    ),),
                                  ],
                             ),),
                            Container(width: MediaQuery.of(context).size.width*0.5,
                            //  color: Colors.teal,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: MediaQuery.of(context).size.height*0.46*0.06,),
                                  Image.asset('images/ladybug2.png'),
                                ],
                              ),
                              )
                        ],
                    ),
                )
               ]
          ),
        ),
      ],
      ),
    );
  }
}
