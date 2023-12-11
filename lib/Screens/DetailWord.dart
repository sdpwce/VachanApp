import 'package:flutter/material.dart';
import 'package:vachanapp/Screens/DetailNumber.dart';
//import 'package:vachanapp/DetailW.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:async';

import '../widgets/Button.dart';



class Words extends StatefulWidget {
  @override
  Words({Key? key,
    required this.BText,
    required this.Index,
  })
      : super(key: key);

  final String BText;
  final int Index;
  _ColorListState createState() => _ColorListState(BText: this.BText, Index: this.Index);
}

class _ColorListState extends State<Words> {
  _ColorListState({Key? key,
    required this.BText,
    required this.Index,
  });

  final String BText;
  final int Index;
  final List<List<String>> WordsNames = [["ant","apple", "arm", "arrow", "axe"], ["ball", "bat", "bee", "bird", "bus"], ["cap", "carrot", "cat", "cow", "cup"],
   ["deer", "dog", "doll", "door", "duck"],["eagle", "ear", "earth", "egg", "eye"],["fan", "feather", "fish", "flower", "fox"],["gate", "glass", "goat", "grapes", "grass"],
   ["hair", "hat", "hen", "horse", "house"],["ice", "ice cream", "igloo", "ink", "insect"],["jacket", "jam", "jar", "joker", "juice"],["kangaroo", "key", "kid", "kite", "knife"],
   ["lid", "lily", "lion", "lips", "lock"],["mail", "mask", "mat", "moon", "monkey"],["nail", "nail paint", "nest", "nose", "nut"],
   ["oar", "octopus", "onion", "orange", "owl"],["pan", "pumpkinw", "pencil", "penguin", "plane"],["queen", "question mark", "queue", "quiet", "quill"],["rabbit", "rainbow", "robot", "rocket", "rose"],
  ["star", "snail", "ship", "sun", "strawberry"],["tomato", "train", "tree", "turtle", "tea"],["umbrella", "unicorn", "uniform", "utensils", "up"],["van", "vase", "vine", "violin", "volcano"],
  ["watch", "watermellon", "wave", "whale", "wheel"],["xbox", "xerox", "xmas tree", "x-ray", "xylophone"],["yacht", "yak", "yarn", "yellow", "yo yo"],["zebra", "zero", "zigzag", "zip", "zoo"]];


  final PageController _pageController = PageController(initialPage: 0);
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
  bool isCorrect = false;
  bool showTick = false;
  late String _words;

  double _confidenceLevel = 0;

  String resultText = '';
  Color resultColor = Colors.black;
  bool isReading = false;

  @override
  void initState() {
    super.initState();
    _words = "";
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
    int currentIndex = _pageController.page!.round();

    if (_wordsSpoken.toLowerCase() ==
        WordsNames[Index][currentIndex].toLowerCase()) {
      showResult('Correct', Colors.green);
      one++;
      if (one > 0) {
        speak("correct");
      }
    } else {
      one++;
      showResult('Incorrect', Colors.red);
      if (one == 10) {
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
    var cheight = MediaQuery
        .of(context)
        .size
        .height;
    var cwidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: _speechToText.isListening
              ? _stopListening
              : _startListening,
          tooltip: 'Listen',
          child: Icon(
            _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
        ),
        appBar: Appbar(apptext: "वाचन",),
        body: GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details) {
              if (details.primaryVelocity! > 0) {
                // Swiped Right
                if (_pageController.page! > 0) {
                  _pageController.previousPage(
                      duration: Duration(milliseconds: 10),
                      curve: Curves.easeInOut);
                }
              } else if (details.primaryVelocity! < 0) {
                // Swiped Left
                if (_pageController.page! < WordsNames.length - 1) {
                  _pageController.nextPage(duration: Duration(milliseconds: 10),
                      curve: Curves.easeInOut);
                }
              }
            },
            child: Container(
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Image.asset(
                            'images/back5.png',
                            fit: BoxFit.cover,
                            // You can adjust the fit property as needed
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          //  color: getColorByName(AnimalsNames[index]),
                          //     height: MediaQuery.of(context).size.height,
                          //      width: MediaQuery.of(context).size.width,
                          Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: Column(
                                  children: [
                                    SizedBox(height: cheight * 0.04,),
                                    Container(height: cheight*0.05,
                                    child: Text("Words starts with "+BText, style: GoogleFonts.lacquer(
                                      fontSize: cwidth*0.07,
                                      fontWeight: FontWeight.bold,
                                      //   color: Color.fromARGB(255, 23, 120, 128),
                                    ),textAlign: TextAlign.center, ),),
                                   // SizedBox(height: cheight * 0.01,),
                                    SizedBox(height: cheight * 0.01,),
                                    Container(height: cheight * 0.4,
                                      width: cwidth * 0.7,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10.0),
                                          // Adjust the radius to control the curve.
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black38,
                                              // Shadow color
                                              offset: Offset(0, 2),
                                              // Offset of the shadow
                                              blurRadius: 4.0, // Spread of the shadow
                                            ),
                                          ],
                                          color: Color.fromARGB(
                                              255, 200, 160, 255)),
                                      child: Column(
                                        children: [
                                            SizedBox(height: cheight*0.4*0.1,),
                                            Container(height: cheight*0.4*0.6, width: cwidth*0.7*0.7,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(
                                                      10.0),
                                                  // Adjust the radius to control the curve.
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black38,
                                                      // Shadow color
                                                      offset: Offset(0, 2),
                                                      // Offset of the shadow
                                                      blurRadius: 4.0, // Spread of the shadow
                                                    ),
                                                  ],
                                                  color:Colors.white),
                                            child: InkWell( onTap: (){speak(WordsNames[Index][index]);},
                                                child: Image.asset(ImagesAd[Index][index])),),
                                          SizedBox(height: cheight*0.4*0.1,),
                                          InkWell( onTap: (){speak(WordsNames[Index][index]);},
                                            child: Text(WordsNames[Index][index], style: GoogleFonts.lacquer(
                                              fontSize: cwidth*0.08,
                                              fontWeight: FontWeight.bold,
                                              //   color: Color.fromARGB(255, 23, 120, 128),
                                            ),textAlign: TextAlign.center,),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: cheight*0.02,),
                                    InkWell(
                                      onTap: (){
                                        speak(WordsNames[Index][index]);
                                      },
                                      child: Text(WordsNames[Index][index],
                                        style: TextStyle(fontSize: cwidth*0.06, fontWeight: FontWeight.bold),),
                                    ),
                                    //    SizedBox(height: cheight*0.01,),
                                    Row( mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(8),
                                              child: Text(
                                                _speechToText.isListening
                                                    ? "listening..."
                                                    : _speechEnabled
                                                    ? _words
                                                    : "ok",
                                                style: TextStyle(fontSize: 20.0),
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
                                                fontSize: cwidth*0.05,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            if (showTick)
                                              Icon(
                                                isCorrect ? Icons.check : Icons.close,
                                                color: isCorrect ? Colors.green : Colors.red,
                                                size: 50,
                                              ),
                                          ],
                                        ),
                                        SizedBox(width: cwidth*0.12,),
                                        Container(height: cheight*0.2, width: cwidth*0.3,
                                          child: Column( mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Image.asset("images/bicycle.png"),
                                            ],
                                          ),),
                                      ],
                                    ),

                                  ]
                              )

                          ),
                        ],
                      );
                    }
                )))
    );
  }
}

final List<List<String>> ImagesAd = [
  ["images/ant.jpg", "images/wapple.jpg", "images/arm.png", "images/arrow.jpg", "images/axe.jpg"],
  ["images/wball.jpg", "images/bat.jpg", "images/beew.png", "images/birdw.jpg", "images/busw.jpg"],
  ["images/cap.png", "images/carrot.jpg", "images/catw.jpg", "images/coww.jpg", "images/cup.jpg"],
  ["images/deer.jpg", "images/dogr.png", "images/doll.jpg", "images/door.jpg", "images/duck.jpg"],
  ["images/eagle.jpg", "images/ear.jpg", "images/earth.jpg", "images/egg.jpg", "images/eye.jpg"],
  ["images/fan.jpg", "images/feather.jpg", "images/fish.jpg", "images/flower.jpg", "images/fox.jpg"],
  ["images/gate.jpg", "images/glass.png", "images/goat.jpg", "images/grapesw.jpg", "images/grass.jpg"],
  ["images/hair.png", "images/hat.jpg", "images/hen.jpg", "images/horse.jpg", "images/house.jpg"],
  ["images/ice cube.jpg", "images/ice-creamw.png", "images/igloo.png", "images/ink.png", "images/insect.png"],
  ["images/jacket.jpg", "images/jam.png", "images/jar.png", "images/joker.jpg", "images/juice.png"],
  ["images/kangaroo.png", "images/key.png", "images/kid.png", "images/kite.png", "images/knife.png"],
  ["images/lid.png", "images/lily.png", "images/lionw.png", "images/lips.jpg", "images/lock.png"],
  ["images/mail.png", "images/mask.png", "images/mat.png", "images/moon.jpg", "images/monkeyw.png"],
  ["images/nail.png", "images/nail paint.jpg", "images/nest.png", "images/nose.png", "images/nut.png"],
  ["images/oar.png", "images/octopus.png", "images/onion.png", "images/orangew.png", "images/owl.png"],
  ["images/pan.png", "images/pumpkinw.png", "images/pen.png", "images/penguin.png", "images/plane.png"],
  ["images/queenw.png", "images/question mark.png", "images/queue.png", "images/quiet.png", "images/quill.png"],
  ["images/rabbit.png", "images/rainbow.png", "images/robot.png", "images/rocket.png", "images/rosew.png"],
  ["images/star.png", "images/snail.png", "images/ship.png", "images/sunw.png", "images/strawberryw.png"],
  ["images/tomato.png", "images/train.png", "images/tree.png", "images/turtle.png", "images/tea.png"],
  ["images/umbrella.png", "images/unicorn.png", "images/uniform.png", "images/utensils.png", "images/up.jpg"],
  ["images/van.png",  "images/vase.png", "images/vine.png", "images/violin.png", "images/volcano.png"],
  ["images/watch.png", "images/watermellon.png", "images/wave.png", "images/whale.png", "images/wheel.png"],
  ["images/xbox.png", "images/xerox.png", "images/xmas tree.png", "images/xray.png", "images/xylophone.png"],
  ["images/yacht.png", "images/yak.png", "images/yarn.png", "images/yellow.png", "images/yo-yo.png"],
  ["images/zebra.png", "images/zero.png", "images/zigzag.png", "images/zip.png", "images/zoo.png"]
];
