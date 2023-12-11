import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/detail.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:async';

import '../detailC.dart';
class ColorDetail extends StatefulWidget {
  const ColorDetail({Key? key,
    required this.BoxText,
    required this.color,
    required this.flag, required this.lang,


    //  required this.fontSize,
  })
      : super(key: key);

  final String BoxText;
  final Color color;
  final bool flag;
  final bool lang;
  _DetailAlpha createState() => _DetailAlpha(BoxText: BoxText, color: color, flag : flag, lang: lang);

}

class _DetailAlpha extends State<ColorDetail> {

  // stt.SpeechToText speech = stt.SpeechToText();
  _DetailAlpha( {Key? key,
    required this.BoxText,
    required this.color,
    required this.flag,
    required this.lang,
  });

  final String BoxText;
  final Color color;
  final bool flag;
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

  final SpeechToText _speechToText = SpeechToText();

  bool _speechEnabled = false;
  String _wordsSpoken = "";
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
    _words = Colorname(BoxText);
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
    });

    Timer(Duration(seconds: 3), () {
      setState(() {
        resultText = '';
        resultColor = Colors.black;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var Cwidgth = MediaQuery.of(context).size.width;
    var Cheight = MediaQuery.of(context).size.height;
    var isListening = false;
    var text = "hold";

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _speechToText.isListening ? _stopListening : _startListening,
        tooltip: lang?'Listen':'ऐका',
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
                 Container(
                           height: Cheight*0.5,
                         //  color: Colors.grey,
                     child: Row(
                         children: [
                              Container(
                                  width: Cwidgth*0.5,
                                //  color: Colors.grey,
                                child: Column(
                                    children: [
                                        Container(
                                          height: Cheight*0.5*0.5,
                                        // color: Colors.grey,
                                            child: Column(
                                              children: [
                                                Container(
                                                     height: Cheight*0.5*0.5*0.5,
                                                   //   color: Colors.grey,
                                                    child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Container( width : Cwidgth*0.5*0.03, color: Colors.grey,),
                                                          SizedBox(width:  Cwidgth*0.5*0.3,),
                                                            Container( width : Cwidgth*0.5*0.03, color: Colors.grey,),
                                                            SizedBox(width:  Cwidgth*0.5*0.3,)
                                                        ],
                                                    ),
                                                ),
                                                Container(
                                                  height: Cheight*0.5*0.5*0.5,
                                                 // color: Colors.lightGreenAccent,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          InkWell(
                                                            onTap:(){
                                                             speak(BoxText) ;
                                                          },
                                                            child: Container( width : Cwidgth*0.5*0.6, height: Cheight*0.5*0.5*0.5*0.8,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(5.0), // Adjust the radius to control the curve.
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors.black38, // Shadow color
                                                                    offset: Offset(0, 2), // Offset of the shadow
                                                                    blurRadius: 4.0, // Spread of the shadow
                                                                  ),
                                                                ],
                                                                color: color,),
                                                              child: Row( mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(BoxText, style: GoogleFonts.lacquer(
                                                                        fontSize: Cwidgth*0.07,
                                                                        fontWeight: FontWeight.bold,
                                                                        color: flag?Colors.black:Colors.white,
                                                                      ),textAlign: TextAlign.center,),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),

                                                      SizedBox(width:  Cwidgth*0.5*0.18,)
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),

                                        ),
                                      Container(
                                        height: Cheight*0.5*0.5,
                                      //  color: Colors.pink,
                                        child: Row(
                                          children: [
                                            Container(width:  Cwidgth*0.5*0.1,
                                             // color: Colors.pink,
                                              child: Column(
                                                  children: [
                                                    SizedBox(height:  Cheight*0.5*0.5*0.45,),
                                                    Container( height : Cwidgth*0.5*0.03, color: Colors.grey,),
                                                    SizedBox(height:  Cheight*0.5*0.5*0.4,),
                                                    Container( height : Cwidgth*0.5*0.03, color: Colors.grey,),
                                                  ],
                                              ),
                                            ),
                                            Container(width:  Cwidgth*0.5*0.85,
                                              //color: Colors.blue,
                                              child: Column(
                                                children: [
                                                  Container( height: Cheight*0.5*0.5*0.35
                                                    ,
                                                    //color: Colors.blue,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: Cwidgth*0.5*0.85,
                                                          // color: Colors.blue,
                                                          child: Column(  mainAxisAlignment: MainAxisAlignment.end,
                                                            children: [
                                                              InkWell(
                                                                onTap:(){
                                                              speak(lang?I3name(BoxText):I3nameM(BoxText));
                                                    },
                                                                child: Text(lang?I3name(BoxText):I3nameM(BoxText), style: GoogleFonts.lacquer(
                                                                  fontSize: Cwidgth*0.065,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black,
                                                                ), textAlign: TextAlign.center,),
                                                              ),
                                                              SizedBox(height: Cheight*0.5*0.5*0.35*0.15)],
                                                          ),
                                                        ),
                                                      ],
                                                    ),),
                                                  InkWell(
                                                    onTap:(){
                                                      speak(lang?I3name(BoxText):I3nameM(BoxText));
                                                    },
                                                    child: Container( height: Cheight*0.5*0.5*0.65
                                                      , //color: Colors.lightGreen,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5.0), // Adjust the radius to control the curve.
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.black38, // Shadow color
                                                              offset: Offset(0, 2), // Offset of the shadow
                                                              blurRadius: 4.0, // Spread of the shadow
                                                            ),
                                                          ],
                                                          image: DecorationImage(
                                                            image: AssetImage(Image3(BoxText)), // Replace with your image path
                                                            fit: BoxFit.cover, // Use BoxFit.cover to maintain the fixed size
                                                          ),
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(width:  Cwidgth*0.5*0.05,
                                              //  color: Colors.pink,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                ),
                              ),
                           Container(
                             width: Cwidgth*0.5,
                            // color: Colors.black,
                             child: Column(
                               children: [
                                 Container(
                                   height: Cheight*0.5*0.5,
                                       child: Row(
                                           children: [
                                               Container(width:  Cwidgth*0.5*0.05,
                                                 //color: Colors.pink,
                                               ),
                                             Container(width:  Cwidgth*0.5*0.9,
                                               //color: Colors.blue,
                                               child: Column(
                                                 children: [
                                                   Container( height: Cheight*0.5*0.5*0.35
                                                     ,
                                                     //color: Colors.blue,
                                                     child: Row(
                                                         children: [
                                                             Container(
                                                                width: Cwidgth*0.5*0.9*0.12,
                                                               // color: Colors.grey,
                                                              child: Row(  mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  Container( width : Cwidgth*0.5*0.03, color: Colors.grey,),
                                                                ],
                                                              ),
                                                             ),
                                                           InkWell(
                                                             onTap:(){
                                                               speak(lang?I1name(BoxText):I1nameM(BoxText));
                                                             },
                                                             child: Container(
                                                               width: Cwidgth*0.5*0.9*0.76,
                                                              // color: Colors.blue,
                                                                 child: Column(  mainAxisAlignment: MainAxisAlignment.end,
                                                                    children: [
                                                                     Text(lang?I1name(BoxText):I1nameM(BoxText), style: GoogleFonts.lacquer(
                                                                       fontSize: Cwidgth*0.065,
                                                                       fontWeight: FontWeight.bold,
                                                                       color: Colors.black,
                                                                     ), textAlign: TextAlign.center,),
                                                                    SizedBox(height: Cheight*0.5*0.5*0.35*0.15)],
                                                             ),
                                                             ),
                                                           ),
                                                              Container(
                                                                width: Cwidgth*0.5*0.9*0.12,
                                                             //   color: Colors.grey,
                                                                child: Row(
                                                                  children: [
                                                                    Container( width : Cwidgth*0.5*0.03, color: Colors.grey,),
                                                                  ],
                                                                ),
                                                             )
                                                         ],
                                                     ),),
                                                   InkWell(
                                                     onTap:(){
                                                       speak(lang?I1name(BoxText):I1nameM(BoxText));
                                                     },
                                                     child: Container( height: Cheight*0.5*0.5*0.65
                                                       , //color: Colors.lightGreen,
                                                        decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(5.0), // Adjust the radius to control the curve.
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors.black38, // Shadow color
                                                                    offset: Offset(0, 2), // Offset of the shadow
                                                                    blurRadius: 4.0, // Spread of the shadow
                                                                  ),
                                                                ],
                                                            image: DecorationImage(
                                                              image: AssetImage(Image1(BoxText)), // Replace with your image path
                                                              fit: BoxFit.cover, // Use BoxFit.cover to maintain the fixed size
                                                            ),
                                                                color: Colors.white),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                             Container(width:  Cwidgth*0.5*0.05,
                                             //  color: Colors.pink,
                                             ),
                                           ],
                                       ),
                                 ),
                                 Container(
                                   height: Cheight*0.5*0.5,
                                   child: Row(
                                     children: [
                                       Container(width:  Cwidgth*0.5*0.05,
                                         //color: Colors.pink,
                                       ),
                                       Container(width:  Cwidgth*0.5*0.9,
                                         //color: Colors.blue,
                                         child: Column(
                                           children: [
                                             Container( height: Cheight*0.5*0.5*0.35
                                               ,
                                               //color: Colors.blue,
                                               child: Row(
                                                 children: [
                                                   Container(
                                                     width: Cwidgth*0.5*0.9*0.12,
                                                     // color: Colors.grey,
                                                     child: Row(  mainAxisAlignment: MainAxisAlignment.end,
                                                       children: [
                                                         Container( width : Cwidgth*0.5*0.03, color: Colors.grey,),
                                                       ],
                                                     ),
                                                   ),
                                                   InkWell(
                                                     onTap:(){
                                                       speak(lang?I2name(BoxText):I2nameM(BoxText));
                                                     },
                                                     child: Container(
                                                       width: Cwidgth*0.5*0.9*0.76,
                                                       // color: Colors.blue,
                                                       child: Column(  mainAxisAlignment: MainAxisAlignment.end,
                                                         children: [
                                                           Text(lang?I2name(BoxText):I2nameM(BoxText), style: GoogleFonts.lacquer(
                                                             fontSize: Cwidgth*0.065,
                                                             fontWeight: FontWeight.bold,
                                                             color: Colors.black,
                                                           ), textAlign: TextAlign.center,),
                                                           SizedBox(height: Cheight*0.5*0.5*0.35*0.15)],
                                                       ),
                                                     ),
                                                   ),
                                                   Container(
                                                     width: Cwidgth*0.5*0.9*0.12,
                                                     //   color: Colors.grey,
                                                     child: Row(
                                                       children: [
                                                         Container( width : Cwidgth*0.5*0.03, color: Colors.grey,),
                                                       ],
                                                     ),
                                                   )
                                                 ],
                                               ),),
                                             InkWell(
                                               onTap:(){
                                                 speak(lang?I2name(BoxText):I2nameM(BoxText));
                                               },
                                               child: Container( height: Cheight*0.5*0.5*0.65
                                                 , //color: Colors.lightGreen,
                                                 decoration: BoxDecoration(
                                                     borderRadius: BorderRadius.circular(5.0), // Adjust the radius to control the curve.
                                                     boxShadow: [
                                                       BoxShadow(
                                                         color: Colors.black38, // Shadow color
                                                         offset: Offset(0, 2), // Offset of the shadow
                                                         blurRadius: 4.0, // Spread of the shadow
                                                       ),
                                                     ],
                                                     color: Colors.white,
                                                   image: DecorationImage(
                                                     image: AssetImage(Image2(BoxText)), // Replace with your image path
                                                     fit: BoxFit.cover, // Use BoxFit.cover to maintain the fixed size
                                                   ),),
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                       Container(width:  Cwidgth*0.5*0.05,
                                         //  color: Colors.pink,
                                       ),
                                     ],
                                   ),

                                 ),
                               ],
                             ),
                           )
                         ],
                     ),
                 ),
                SizedBox(height: Cheight*0.05,),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    _speechToText.isListening
                        ? "listening..."
                        : _speechEnabled
                        ? _words
                        : "Speech not available",
                    style: TextStyle(fontSize: Cwidgth*0.05),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    _wordsSpoken,
                    style: TextStyle(
                      fontSize:  Cwidgth*0.06,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Text(
                  resultText,
                  style: TextStyle(
                    color: resultColor,
                    fontSize: Cwidgth*0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}


