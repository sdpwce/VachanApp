import 'package:flutter/material.dart';
import 'package:vachanapp/Screens/DetailShape.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/Screens/Alphabate.dart';
import 'package:vachanapp/Screens/Number.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../widgets/colorcard.dart';


class ShapePage extends StatelessWidget {
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
    var cwidth = MediaQuery.of(context).size.width;
    var cheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor:  const Color.fromARGB(255, 211, 232, 239),
        appBar: Appbar(apptext: "वाचन", ),

        body: Stack(
            children:[  Image.asset(
              'images/skyblue.jpg',
              fit: BoxFit.cover, // You can adjust the fit property as needed
              width: double.infinity,
              height: double.infinity,
            ),
             Column(
                  children: [
                        Container(height: cheight*0.1,
                          child: Row(  mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Shapes", style: GoogleFonts.lacquer(
                                fontSize: cwidth*0.09,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),textAlign: TextAlign.center, ),
                            ],
                          ),),
                         Container(height: cheight*0.38,
                         child: Row(
                               children: [
                                   InkWell(
                                     onLongPress:(){
                                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShapeDetail(ShapeText: "square")));
                                     },
                                     child: Container(width: cwidth*0.5,
                                     child: Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Container(height: cheight*0.38*0.85,
                                         decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(5.0), // Adjust the radius to control the curve.
                                             boxShadow: [
                                               BoxShadow(
                                                 color: Colors.black38, // Shadow color
                                                 offset: Offset(0, 2), // Offset of the shadow
                                                 blurRadius: 4.0, // Spread of the shadow
                                               ),
                                             ],
                                             color: Color.fromARGB(168, 252, 132, 186)),
                                         child: Column(
                                              children: [ SizedBox(height: cheight*0.38*0.85*0.1,),
                                                  InkWell(
                                                    onTap: (){
                                                        speak("Square");
                                                    },
                                                    child: Container(height: cheight*0.38*0.85*0.6 , width: cwidth*0.5*0.8,
                                                      child: Image.asset("images/squ.png"),),
                                                  ),
                                                SizedBox(height: cheight*0.38*0.85*0.05,),
                                                InkWell(
                                                  onTap: (){
                                                    speak("Square");
                                                  },
                                                  child: Text("Square", style: GoogleFonts.lacquer(
                                                    fontSize: cwidth*0.09,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),textAlign: TextAlign.center, ),
                                                ),],),),),),
                                   ),
                                         InkWell(
                                           onLongPress:(){
                                             Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShapeDetail(ShapeText: "circle")));
                                           },
                                           child: Container(width: cwidth*0.5,
                                               child: Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Container(height: cheight*0.38*0.85,
                                                   decoration: BoxDecoration(
                                                       borderRadius: BorderRadius.circular(5.0), // Adjust the radius to control the curve.
                                                       boxShadow: [
                                                         BoxShadow(
                                                           color: Colors.black38, // Shadow color
                                                           offset: Offset(0, 2), // Offset of the shadow
                                                           blurRadius: 4.0, // Spread of the shadow
                                                         ),
                                                       ],
                                                       color: Color.fromARGB(
                                                           165, 200, 160, 255)),
                                                   child: Column(
                                                     children: [ SizedBox(height: cheight*0.38*0.85*0.15,),
                                                       InkWell(
                                                         onTap: (){
                                                           speak("Circle");
                                                         },
                                                         child: Container(height: cheight*0.38*0.85*0.5 , width: cwidth*0.5*0.8,
                                                           child: Image.asset("images/cir.png"),),
                                                       ),
                                                       SizedBox(height: cheight*0.38*0.85*0.1,),
                                                       InkWell(
                                                         onTap: (){
                                                           speak("Circle");
                                                         },
                                                         child: Text("Circle", style: GoogleFonts.lacquer(
                                                           fontSize: cwidth*0.09,
                                                           fontWeight: FontWeight.bold,
                                                           color: Colors.black,
                                                         ),textAlign: TextAlign.center, ),
                                                       ),],),),)),
                                         )
                               ],
                         ),),
                    Container(height: cheight*0.38,
                      child: Row(
                        children: [
                          InkWell(
                            onLongPress:(){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShapeDetail(ShapeText: "rectangle")));
                            },
                            child: Container(width: cwidth*0.5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(height: cheight*0.38*0.85,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0), // Adjust the radius to control the curve.
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38, // Shadow color
                                          offset: Offset(0, 2), // Offset of the shadow
                                          blurRadius: 4.0, // Spread of the shadow
                                        ),
                                      ],
                                      color: Color.fromARGB(168, 253, 236, 50)),
                                  child: Column(
                                    children: [ SizedBox(height: cheight*0.38*0.85*0.1,),
                                      InkWell(
                                        onTap: (){
                                          speak("rectangle");
                                        },
                                        child: Container(height: cheight*0.38*0.85*0.6 , width: cwidth*0.5*0.8,
                                          child: Image.asset("images/rec.png"),),
                                      ),
                                      SizedBox(height: cheight*0.38*0.85*0.05,),
                                      InkWell(
                                        onTap: (){
                                          speak("rectangle");
                                        },
                                        child: Text("Rectangle", style: GoogleFonts.lacquer(
                                          fontSize: cwidth*0.09,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),textAlign: TextAlign.center, ),
                                      ),],),),),),
                          ),
                          InkWell(
                            onLongPress:(){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShapeDetail(ShapeText: "triangle")));
                            },
                            child: Container(width: cwidth*0.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(height: cheight*0.38*0.85,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0), // Adjust the radius to control the curve.
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black38, // Shadow color
                                            offset: Offset(0, 2), // Offset of the shadow
                                            blurRadius: 4.0, // Spread of the shadow
                                          ),
                                        ],
                                        color: Color.fromARGB(
                                            178, 47, 171, 26)),
                                    child: Column(
                                      children: [ SizedBox(height: cheight*0.38*0.85*0.15,),
                                        InkWell(
                                          onTap: (){
                                            speak("Triangle");
                                          },
                                          child: Container(height: cheight*0.38*0.85*0.5 , width: cwidth*0.5*0.8,
                                            child: Image.asset("images/tri.png"),),
                                        ),
                                        SizedBox(height: cheight*0.38*0.85*0.1,),
                                        InkWell(
                                          onTap: (){
                                            speak("Traingle");
                                          },
                                          child: Text("Triangle", style: GoogleFonts.lacquer(
                                            fontSize: cwidth*0.09,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),textAlign: TextAlign.center, ),
                                        ),],),),)),
                          )
                        ],
                      ),),
                  ],

                ),
            ]));
  }
}
