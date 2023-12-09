import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/detail.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:async';

import '../detailC.dart';
class NumDetail extends StatefulWidget {
  const NumDetail({Key? key,
    required this.BoxText,
  })
      : super(key: key);

  final String BoxText;
  _DetailAlpha createState() => _DetailAlpha(BoxText: BoxText,);

}

class _DetailAlpha extends State<NumDetail> {

  // stt.SpeechToText speech = stt.SpeechToText();
  _DetailAlpha({Key? key,
    required this.BoxText,
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

                SizedBox(height: Cheight*0.1,),
                Row(  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                    onTap: (){
                      if(BoxText == "1")
                        speak(BoxText + "finger");
                      else
                        speak(BoxText + 'fingers');
                    },

                      child: Container(
                          height: Cheight*0.25,
                          width: Cwidgth*0.8,
                       // color: Colors.red,
                         child: Image.asset(getImage(BoxText),  height: double.infinity,  // Adjust height as needed
                           width: double.infinity,   // Adjust width as needed
                           fit: BoxFit.contain,   ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Cheight*0.03,),
                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: InkWell(
                        onTap: (){
                          speak(BoxText);
                        },
                        child: Text(getName(BoxText), style: GoogleFonts.lacquer(
                          fontSize: Cwidgth*0.12,
                          fontWeight: FontWeight.bold,
                          //   color: Color.fromARGB(255, 23, 120, 128),
                        ),textAlign: TextAlign.center, ),
                      ),
                    ),
                    SizedBox(width: Cwidgth*0.05,),
                    Container(
                      child: InkWell(
                        onTap: (){
                            speak(getName(BoxText));
                        },
                        child: Text(BoxText, style: GoogleFonts.lacquer(
                          fontSize: Cwidgth*0.12,
                          fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 252, 132, 186),
                        ),textAlign: TextAlign.center, ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Cheight*0.2,),
                InkWell(
                  onTap: (){
                    speak(BoxText);
                  },
                  child: Text(getName(BoxText),
                    style: TextStyle(fontSize: Cwidgth*0.06, fontWeight: FontWeight.bold),),
                ),
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
                  padding: EdgeInsets.all(8),
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

String getImage(String number) {
  switch (number.toLowerCase()) {
    case '0':
      return "images/0f.jpg";
    case '1':
      return "images/1f.jpg";
    case '2':
      return "images/10.jpg";
    case '3':
      return "images/3f.jpg";
    case '4':
      return "images/4f.jpg";
    case '5':
      return "images/5f.jpg";
    case '6':
      return "images/6f.jpg";
    case '7':
      return "images/7f.jpg";
    case '8':
      return "images/8f.jpg";
    case '9':
      return "images/9f.jpg";
    case '10':
      return "images/10f.jpg";
    default:
      return "images/10f.jpg";

  }
}

String getName(String number) {
  switch (number.toLowerCase()) {
    case '0':
      return "zero";
    case '1':
      return "one";
    case '2':
      return "two";
    case '3':
      return "three";
    case '4':
      return "four";
    case '5':
      return "five";
    case '6':
      return "six";
    case '7':
      return "seven";
    case '8':
      return "eight";
    case '9':
      return "nine";
    case '10':
      return "ten";
    default:
      return "ten";

  }
}

