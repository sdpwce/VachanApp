import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
//import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/Screens/recog.dart';
import 'package:vachanapp/Screens/detailAlpha.dart';


class AlphabateBox extends StatefulWidget {
  const AlphabateBox(
      {Key? key,
        required this.HeadingText,
      })
      : super(key: key);

  final String HeadingText;
  @override
  _MyHomePageState createState() => _MyHomePageState(headingText: HeadingText);
}

class _MyHomePageState extends State<AlphabateBox> {
   _MyHomePageState(
      {Key? key,
        required this.headingText,
      });

  final String headingText;
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    initTts();
  }

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
    var cwidgth = MediaQuery.of(context).size.width*0.45;
    return Padding(
      padding:  EdgeInsets.all(cwidgth*0.055),
      child: Container(
        alignment: Alignment.center,
        width: cwidgth*0.35,
        height: cwidgth*0.35,
        decoration: BoxDecoration(
          color:  Color.fromARGB(194, 231, 197, 255),  // Violet color
          borderRadius: BorderRadius.circular(10.0),  // Border radius to round the corners
          border: Border.all(
            color: const Color.fromARGB(255, 169, 113, 253),  // Border color
            width: 1.0,            // Border width
          ),
        ),
        child: InkWell(
          onTap: (){
            speak(headingText);
          },
          onLongPress: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  AlphaDetail(AlphaText: headingText)));
          },
          child: Text(headingText,
            style: TextStyle(
              fontSize:cwidgth * 0.3,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 169,
                  113, 253),
            ),
          ),
        ),
      ),
    );
  }
}

// TextButton(
// onPressed: () {
// speak('one hundred and ninty nine');
// },