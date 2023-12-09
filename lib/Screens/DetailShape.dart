import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/detail.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:vachanapp/widgets/Button.dart';
import 'dart:async';

import '../detailC.dart';
class ShapeDetail extends StatefulWidget {
  const ShapeDetail({Key? key,
    required this.ShapeText,
    //  required this.fontSize,
  })
      : super(key: key);

  final String ShapeText;
  _DetailAlpha createState() => _DetailAlpha(ShapeText: ShapeText);

}

class _DetailAlpha extends State<ShapeDetail> {

  // stt.SpeechToText speech = stt.SpeechToText();
  _DetailAlpha({Key? key,
    required this.ShapeText,
  });

  final String ShapeText;

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

  final SpeechToText _speechToText = SpeechToText();

  bool _speechEnabled = false;
  String _wordsSpoken = "";
  bool isReading = false;
  bool showTick = false;
  bool isCorrect = false;
  late String _words;
  //
  // void initState() {
  //   super.initState();
  //
  // }

  double _confidenceLevel = 0;

  String resultText = '';
  Color resultColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _words = Colorname(ShapeText);
    initSpeech();
  }

  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      _confidenceLevel = 0;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});

  }
  void _startReading(String text) async {
    setState(() {
      isReading = true;
    });
    await flutterTts.speak(text);
    setState(() {
      isReading = false;
    });
  }

  void _stopReading() async {
    await flutterTts.stop();
    setState(() {
      isReading = false;
    });
  }
  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = "${result.recognizedWords}";
      _confidenceLevel = result.confidence;

    });
    checkStrings();
  }
  int one = 0;
  void checkStrings() {

    if ( _wordsSpoken.toLowerCase() == _words.toLowerCase()) {
      showResult('Correct', Colors.green);
      one++;
      if(one > 0){
        speak("correct");
      }

    } else {
      one++;
      showResult('Incorrect', Colors.red);
      if(one == 10){
        speak("Incorrect");
      }

    }
  }

  void showResult(String text, Color color) {
    setState(() {
      resultText = text;
      resultColor = color;
      if(text == "Correct")
        showTick = true;
      if(text == "Correct")
        isCorrect = true;
      if(text == "Incorrect")
        showTick = true;
      if(text == "Incorrect")
        isCorrect = false;
    });

    Timer(Duration(seconds: 3), () {
      setState(() {
        resultText = '';
        resultColor = Colors.black;
        showTick = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var cwidth = MediaQuery.of(context).size.width;
    var cheight = MediaQuery.of(context).size.height;
    var isListening = false;
    var text = "hold";

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _speechToText.isListening ? _stopListening : _startListening,
        tooltip: 'Listen',
        child: Icon(
          _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
      appBar: Appbar(apptext: "वाचन",),
      body: Stack(
        children: [
          Image.asset(
            'images/wow.jpg',
            fit: BoxFit.cover, // You can adjust the fit property as needed
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(

              children: [
                  SizedBox(height: cheight*0.03,),
                  Container(height: cheight*0.25,
                     child: Row(
                           children: [
                               Container(width: cwidth*0.5, 
                                 child: Column(
                                     children: [
                                         Container(height: cheight*0.25*0.75,
                                           child: InkWell(
                                             onTap:(){
                                               speak(ShapeText);
                                             },
                                             child: Container(
                                                 height: cheight*0.25*0.75*0.9,
                                                 width: cwidth*0.5*0.8,
                                               decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(5.0), // Adjust the radius to control the curve.
                                                   boxShadow: [
                                                     BoxShadow(
                                                       color: Colors.black38, // Shadow color
                                                       offset: Offset(0, 2), // Offset of the shadow
                                                       blurRadius: 4.0, // Spread of the shadow
                                                     ),
                                                   ],
                                                   color: Colors.white),
                                                 child: Padding(
                                                   padding:  EdgeInsets.all(cwidth*0.02),
                                                   child: Image.asset(getShape(ShapeText)),
                                                 ),
                                             ),
                                           ),),
                                        Container(height: cheight*0.25*0.25,
                                          child: Padding(
                                            padding: EdgeInsets.all(cwidth*0.02),
                                            child: InkWell(
                                              onTap:(){
                                                speak(ShapeText);
                                              },
                                              child: Text(ShapeText, style: GoogleFonts.lacquer(
                                                fontSize: cwidth*0.09,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),textAlign: TextAlign.center, ),
                                            ),
                                          ),),
                                     ],
                                 ),),
                             Container(width: cwidth*0.5,
                                 child: Column(
                                     children: [
                                         Expanded(
                                           flex : 6,
                                           child: Container(height: cheight*0.25*0.75,
                                             child: Padding(
                                               padding:  EdgeInsets.all(cwidth*0.02),
                                               child: Text(getInfo(ShapeText),
                                                   style: TextStyle(fontSize: cwidth*0.053),textAlign: TextAlign.center,),
                                             )
                                           ),
                                         ),
                                         Expanded( flex: 2,
                                             child: Container(height: cheight*0.25*0.25,
                                             child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.end,
                                                   children: [
                                                     Column(children: [ElevatedButton(
                                                       onPressed: () {  _stopReading();
                                                       },
                                                       child: Padding(
                                                         padding: const EdgeInsets.all(0.5),
                                                         child: Text(
                                                           "Stop",
                                                           style: TextStyle(
                                                               color: Colors.white,
                                                               fontSize:cwidth * 0.05,
                                                               fontWeight: FontWeight.bold
                                                           ),
                                                           textAlign: TextAlign.center,
                                                         ),
                                                       ),
                                                       style: ElevatedButton.styleFrom(
                                                         backgroundColor: const Color.fromARGB(255, 248, 134, 187),
                                                         shape: const RoundedRectangleBorder(
                                                             borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                                         // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                                                       ),

                                                     ),
                                                     ],
                                                     ),
                                                     SizedBox(width: cwidth*0.05,),
                                                     Column(children: [ElevatedButton(
                                             onPressed: () {
                                                 speak(getInfo(ShapeText));
                                               },
                                               child: Padding(
                                                 padding: const EdgeInsets.all(0.5),
                                                 child: Text(
                                                   "Listen",
                                                   style: TextStyle(
                                                       color: Colors.white,
                                                       fontSize:cwidth * 0.05,
                                                       fontWeight: FontWeight.bold
                                                   ),
                                                   textAlign: TextAlign.center,
                                                 ),
                                               ),
                                               style: ElevatedButton.styleFrom(
                                                 backgroundColor: const Color.fromARGB(255, 248, 134, 187),
                                                 shape: const RoundedRectangleBorder(
                                                     borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                                 // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                                               ),

                                             ),
                                                       ],
                                                     ),
                                                     SizedBox(width: cwidth*0.05,),

                                                   ],
                                             ),))
                                     ],
                                 ),),
                           ],
                     ),),
                Container(height: cheight*0.03,
                  child: Row(
                       children: [
                           Container(width: cwidth*0.04,),
                           Container(width: cwidth*0.92,
                             child: Container(
                                 height:  cheight*0.03*0.15,
                                 color: Colors.grey,
                             ),),
                           Container(width: cwidth*0.04,),
                       ],
                  ),),
                Container(height: cheight*0.3,
                   child: Column(
                       children: [
                            Container(height: cheight*0.3*0.15,
                              child: Row( mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Examples", style: GoogleFonts.lacquer(
                                    fontSize: cwidth*0.07,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 150, 86, 252),
                                  ),textAlign: TextAlign.center, ),
                                ],),),
                            Container(
                              height: cheight*0.3*0.85,
                              child: Row(children: [
                                    Container(width: cwidth*0.5,
                                      child: Column(
                                          children: [
                                                SizedBox(height: cheight*0.3*0.85*0.05,),
                                               Container(height: cheight*0.3*0.85*0.75,
                                                 child: InkWell(
                                                   onTap:(){
                                                     speak(getEx1name(ShapeText));
                                                   },
                                                   child: Container(
                                                     height: cheight*0.3*0.75*0.9,
                                                     width: cwidth*0.5*0.8,
                                                     decoration: BoxDecoration(
                                                         borderRadius: BorderRadius.circular(5.0), // Adjust the radius to control the curve.
                                                         boxShadow: [
                                                           BoxShadow(
                                                             color: Colors.black38, // Shadow color
                                                             offset: Offset(0, 2), // Offset of the shadow
                                                             blurRadius: 4.0, // Spread of the shadow
                                                           ),
                                                         ],
                                                         color: Colors.white),
                                                     child:  Image.asset(getEx1(ShapeText)),
                                                   ),
                                                 ),
                                               ),
                                            SizedBox(height: cheight*0.3*0.85*0.05,),
                                            Container(height: cheight*0.3*0.85*0.15,
                                              child: Row( mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap:(){
                                                      speak(getEx1name(ShapeText));
                                                    },
                                                    child: Text(getEx1name(ShapeText), style: GoogleFonts.lacquer(
                                                      fontSize: cwidth*0.09,
                                                      fontWeight: FontWeight.bold,
                                                     // color: Color.fromARGB(255, 150, 86, 252),
                                                    ),textAlign: TextAlign.center, ),
                                                  ),
                                                ],),)
                                          ],
                                      ),),
                                Container(width: cwidth*0.5,
                                  child: Column(
                                    children: [
                                      SizedBox(height: cheight*0.3*0.85*0.05,),
                                      Container(height: cheight*0.3*0.85*0.75,
                                        child: InkWell(
                                          onTap:(){
                                            speak(getEx2name(ShapeText));
                                          },
                                          child: Container(
                                            height: cheight*0.3*0.75*0.9,
                                            width: cwidth*0.5*0.8,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0), // Adjust the radius to control the curve.
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black38, // Shadow color
                                                    offset: Offset(0, 2), // Offset of the shadow
                                                    blurRadius: 4.0, // Spread of the shadow
                                                  ),
                                                ],
                                                color: Colors.white),
                                            child:  Image.asset(getEx2(ShapeText)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: cheight*0.3*0.85*0.05,),
                                      Container(height: cheight*0.3*0.85*0.15,
                                        child: Row( mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap:(){
                                                  speak(getEx2name(ShapeText));
                                               },
                                              child: Text(getEx2name(ShapeText), style: GoogleFonts.lacquer(
                                                fontSize: cwidth*0.09,
                                                fontWeight: FontWeight.bold,
                                                // color: Color.fromARGB(255, 150, 86, 252),
                                              ),textAlign: TextAlign.center, ),
                                            ),
                                          ],),)
                                    ],
                                  ),),
                              ],),
                            ),
                       ],
                   ),),
                SizedBox(height: cheight*0.01,),
                Container(width: cwidth*0.92,
                  child: Container(
                    height:  cheight*0.03*0.15,
                    color: Colors.grey,
                  ),),
                SizedBox(height: cheight*0.01,),
                InkWell(
                  onTap: (){
                    speak(ShapeText);
                  },
                  child: Text(ShapeText,
                    style: TextStyle(fontSize: cwidth*0.05, fontWeight: FontWeight.bold),),
                ),
                //    SizedBox(height: cheight*0.01,),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    _speechToText.isListening
                        ? "listening..."
                        : _speechEnabled
                        ? _words
                        : "ok",
                    style: TextStyle(fontSize: cwidth*0.05),
                  ),
                ),
                Container(
                  //  padding: EdgeInsets.all(16),
                  child: Text(
                    _wordsSpoken,
                    style: TextStyle(
                      fontSize: cwidth*0.05,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Text(
                  resultText,
                  style: TextStyle(
                    color: resultColor,
                    fontSize: cwidth*0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (showTick)
                  Icon(
                    isCorrect ? Icons.check : Icons.close,
                    color: isCorrect ? Colors.green : Colors.red,
                    size: cwidth*0.08,
                  ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

String getShape(String AnimalName) {
  switch (AnimalName.toLowerCase()) {
    case 'square':
      return "images/square.png";
    case 'circle':
      return "images/circle.png";
    case 'rectangle':
      return "images/rectangle.png";
    case 'triangle':
      return "images/triangle.png";
    default:
      return "images/triangle.png";
  }
}

String getEx1(String AnimalName) {
  switch (AnimalName.toLowerCase()) {
    case 'square':
      return "images/cube.jpg";
    case 'circle':
      return "images/wheel.jpg";
    case 'rectangle':
      return "images/tv.jpg";
    case 'triangle':
      return "images/piz.jpg";
    default:
      return "images/piz.jpg";
  }
}

String getEx1name(String AnimalName) {
  switch (AnimalName.toLowerCase()) {
    case 'square':
      return "Cube";
    case 'circle':
      return "Wheel";
    case 'rectangle':
      return "TV";
    case 'triangle':
      return "Pizza Slice";
    default:
      return "Pizza";
  }
}


String getEx2(String AnimalName) {
  switch (AnimalName.toLowerCase()) {
    case 'square':
      return "images/ice cube.jpg";
    case 'circle':
      return "images/ring.jpg";
    case 'rectangle':
      return "images/mobile.jpg";
    case 'triangle':
      return "images/pyramids.jpg";
    default:
      return "images/pyramids.jpg";
  }
}
String getEx2name(String AnimalName) {
  switch (AnimalName.toLowerCase()) {
    case 'square':
      return "Ice Cube";
    case 'circle':
      return "Ring";
    case 'rectangle':
      return "Mobile";
    case 'triangle':
      return "Pyramids";
    default:
      return "Pyramids";
  }
}
String getInfo(String AnimalName) {
  switch (AnimalName.toLowerCase()) {
    case 'square':
      return "A square has four equal sides and four right angles, making it a shape with straight lines all the same length, like a perfect little box";
    case 'circle':
      return "A circle is like a magical ring, with no corners, a perfect and endless thing! It goes round and round, like a friendly hug!";
    case 'rectangle':
      return "A rectangle is a four-sided shape with two pairs of opposite sides equal in length, it look like a stretched-out square, like a chocolate bares!";
    case 'triangle':
      return "A triangle has three sides and three angles. It looks like a slice of pizza with three straight edges";
    default:
      return "A circle is like a magical ring, with no corners, a perfect and endless thing! It goes round and round, like a friendly hug!";
  }
}
