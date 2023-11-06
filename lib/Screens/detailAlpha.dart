import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/widgets/MidBox.dart';
import 'package:vachanapp/widgets/Box.dart';
import 'package:vachanapp/widgets/Button.dart';
import 'package:vachanapp/detail.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
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
  double _confidenceLevel = 0;

  @override
  void initState() {
    super.initState();
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
      floatingActionButton: AvatarGlow(
        endRadius: 75.0,
        animate: isListening,
        duration: Duration(milliseconds: 2000),
        glowColor: Colors.red,
        repeat: true,
        repeatPauseDuration: Duration(milliseconds: 100),
        showTwoGlows: true,
         child:
        CircleAvatar(
          backgroundColor: Color.fromARGB(255, 23, 120, 128),
          radius: Cwidgth * 0.08,
          child: Icon( Icons.mic, color: Colors.white,),
        ),
      ),
      appBar: Appbar(),
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(
              height: Cheight * 0.5,
              //  color: Colors.grey,
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
                        Container(
                          height: Cheight * 0.5 * 0.5,
                          //  color: Colors.teal,
                          child: Image.asset(ImagePath(BoxText)),
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
            SizedBox(height: Cheight * 0.25,),

            // Text("Hold the button and start speeking",
            //   style: TextStyle(
            //       fontSize: 18
            //   ),)
          ],
        ),
      ),
    );
  }
}


