import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/widgets/MidBox.dart';
import 'package:vachanapp/widgets/Box.dart';
import 'package:vachanapp/widgets/Button.dart';
import 'package:vachanapp/detail.dart';
import 'package:avatar_glow/avatar_glow.dart';
//import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:async';
class DetailAlphabate extends StatefulWidget {
  const DetailAlphabate({Key? key,
    required this.BoxText,

    //  required this.fontSize,
  })
      : super(key: key);

  final String BoxText;

  _DetailAlpha createState() => _DetailAlpha(BoxText: BoxText);

}

class _DetailAlpha extends State<DetailAlphabate> {

  // stt.SpeechToText speech = stt.SpeechToText();
  _DetailAlpha({Key? key,
    required this.BoxText, //  required this.fontSize,
  });

  final String BoxText;
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
     _words = Line(BoxText);
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
    var Cwidgth = MediaQuery
        .of(context)
        .size
        .width;
    var Cheight = MediaQuery
        .of(context)
        .size
        .height;
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
              Container(
                height: Cheight * 0.5,
                // color: Colors.grey,
                child: Row(
                  children: [
                    Container(
                      width: Cwidgth * 0.45,
                      //  color: Colors.black,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: Cheight * 0.5 * 0.2,
                                width: Cwidgth * 0.45 * 0.05,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          Container(
                            height: Cheight * 0.5 * 0.3,
                            // color: Colors.yellow,
                            child: Box(BoxText: BoxText, flag: true),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: Cheight * 0.5 * 0.1,
                                width: Cwidgth * 0.45 * 0.05,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          Container(
                            height: Cheight * 0.5 * 0.3,
                            child: Box(BoxText: BoxText.toLowerCase(),
                                flag: false),
                            //color: Colors.pink,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: Cheight * 0.5 * 0.05,
                                width: Cwidgth * 0.45 * 0.05,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: Cheight * 0.5 * 0.05,
                                width: Cwidgth * 0.45 * 0.13,
                                // color: Colors.indigo,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    // Adjust the radius to control the curve.

                                    color: Color.fromARGB(255, 255, 185, 219)),
                              ),
                            ],
                          ),


                        ],
                      ),
                    ),
                    Container(
                      width: Cwidgth * 0.55,
                      // color: Colors.purple,
                      child: Column(
                        children: [
                          SizedBox(
                            height: Cheight * 0.5 * 0.05,
                          ),
                          Container(
                            height: Cheight * 0.5 * 0.15,
                            // width: Cwidgth*0.45*0.05,
                            //color: Colors.grey,
                            child: InkWell(
                                onTap: (){
                                  speak(Name(BoxText));
                                },
                              child: Text(
                                Name(BoxText),
                                style: GoogleFonts.lacquer(
                                  fontSize: Cheight * 0.06,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Cheight * 0.5 * 0.05,
                          ),
                          InkWell(
                            onTap: (){
                              speak(Name(BoxText));
                            },
                            child: Container(
                              height: Cheight * 0.5 * 0.5,
                              width: Cwidgth * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color of the container
                                borderRadius: BorderRadius.circular(10.0), // Border radius
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5), // Shadow color
                                    spreadRadius: 5, // Spread radius
                                    blurRadius: 7, // Blur radius
                                    offset: Offset(0, 3), // Offset of the shadow
                                  ),
                                ],
                              ),
                              //  color: Colors.teal,
                              child: Image.asset(ImagePath(BoxText)),
                            ),
                          ),
                          SizedBox(
                            height: Cheight * 0.5 * 0.05,
                          ),
                          Container(
                              height: Cheight * 0.5 * 0.2,
                              width: Cwidgth * 0.55 * 0.8,
                              child: ElevatedButton(
                                onPressed: () {
                                 speak(Line(BoxText));

                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    "Learn To Pronounce",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:Cwidgth * 0.08,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 248, 134, 187),
                                  textStyle: TextStyle(fontSize: Cwidgth * 0.08),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                  // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                                ),

                              ),
                              // child: Button(
                              //     ButtonText: "Learn To Pronounce", onTap: null)
                            )
                        ],
                      ),
                    ),

                  ],
                ),
              ),

            //  SizedBox(height: Cheight * 0.25,),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  _speechToText.isListening
                      ? "listening..."
                      : _speechEnabled
                      ? _words
                      : "Speech not available",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  _wordsSpoken,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Text(
                resultText,
                style: TextStyle(
                  color: resultColor,
                  fontSize: 18,
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


