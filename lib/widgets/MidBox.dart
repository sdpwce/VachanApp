import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:vachanapp/Screens/detailAlpha.dart';
class MidBox extends StatelessWidget{
   MidBox({Key? key, required this.MidBoxText, required this.flag,})
      : super(key: key);

  final String MidBoxText;
  final bool flag;


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

  // final double fontSize;

  Widget build(BuildContext context) {
    var Cheight = MediaQuery.of(context).size.height*0.38;

    return InkWell(
      onTap: (){
        speak(MidBoxText);
      },
      onLongPress: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  DetailAlphabate(BoxText: MidBoxText,)));
      },
      child: Container(
          width: Cheight*0.25,
          height: Cheight*0.18,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2), // Half of width or height for a perfect circle
          border: Border.all(
            color: Colors.black54, // Border color
            width: 1.0, // Border width
          ),
          color: flag ? Color.fromARGB(255, 152, 98, 77) : Color.fromARGB(255, 191, 140, 106),
        ),
        child: Text(
            MidBoxText, style: GoogleFonts.lacquer(
            fontSize: Cheight*0.16,
          color: flag ? Colors.white : Colors.black,
        ),textAlign: TextAlign.center,
        ),
      ),
    );
  }

}

class StartBox extends StatelessWidget{

   StartBox({Key? key,
    required this.MidBoxText,
    required this.flag,
    //  required this.fontSize,
  })
      : super(key: key);

  final String MidBoxText;
  final bool flag;


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


  // final double fontSize;

  Widget build(BuildContext context) {
    var Cheight = MediaQuery.of(context).size.height*0.38;

    return InkWell(
      onTap: (){
        speak(MidBoxText);
      },
      onLongPress: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  DetailAlphabate(BoxText: MidBoxText,)));
      },
      child: Container(
        width: Cheight*0.25,
        height: Cheight*0.18,

        decoration: BoxDecoration(
          color: flag ? Color.fromARGB(255, 152, 98, 77) : Color.fromARGB(255, 191, 140, 106),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0), // Adjust the radius for top-left corner
            bottomLeft: Radius.circular(8.0), // Adjust the radius for bottom-left corner
          ),// Half of width or height for a perfect circle
          border: Border.all(
            color: Colors.black54, // Border color
            width: 1.0, // Border width
          ),
        ),
        child: Text(
          MidBoxText, style: GoogleFonts.lacquer(
            fontSize: Cheight*0.16,
          color: flag ? Colors.white : Colors.black,
        ),textAlign: TextAlign.center,
        ),
      ),
    );
  }

}

class SpecialBox extends StatelessWidget{

  SpecialBox({Key? key,
    required this.MidBoxText,
    required this.flag,
    //  required this.fontSize,
  })
      : super(key: key);

  final String MidBoxText;
  final bool flag;


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

  Widget build(BuildContext context) {
    var Cheight = MediaQuery.of(context).size.height*0.38;

    return InkWell(
      onTap: (){
        speak(MidBoxText);
      },
      onLongPress: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  DetailAlphabate(BoxText: MidBoxText,)));
      },
      child: Container(
        width: Cheight*0.25,
        height: Cheight*0.18,

        decoration: BoxDecoration(
          color: flag ? Color.fromARGB(255, 152, 98, 77) : Color.fromARGB(255, 191, 140, 106),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.black54, // Border color
            width: 1.0, // Border width
          ),
        ),
        child: Text(
          MidBoxText, style: GoogleFonts.lacquer(
          fontSize: Cheight*0.16,
          color: flag ? Colors.white : Colors.black,
        ),textAlign: TextAlign.center,
        ),
      ),
    );
  }

}

class EndBox extends StatelessWidget{

  const EndBox({Key? key,})
      : super(key: key);
  Widget build(BuildContext context) {
    var Cheight = MediaQuery.of(context).size.height*0.38;

    return Container(
      width: Cheight*0.15,
      height: Cheight*0.18,

      decoration: BoxDecoration(
        color: Color.fromARGB(255, 191, 140, 106),
        borderRadius: BorderRadius.circular(2), // Half of width or height for a perfect circle
        border: Border.all(
          color: Colors.black54, // Border color
          width: 1.0, // Border width
        ),
      ),
    );
  }

}

class BlankMidBox extends StatelessWidget{

  const BlankMidBox({Key? key,
  })
      : super(key: key);
  // final double fontSize;

  Widget build(BuildContext context) {
    var Cheight = MediaQuery.of(context).size.height*0.38;

    return Container(
      width: Cheight*0.25,
      height: Cheight*0.18,
    //  color: Colors.white,
    );
  }

}