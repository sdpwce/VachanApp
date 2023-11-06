import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:vachanapp/Screens/detailAlpha.dart';
class Box extends StatelessWidget{
  Box({Key? key, required this.BoxText, required this.flag,})
      : super(key: key);

  final String BoxText;
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
    var Cheight = MediaQuery.of(context).size.height;
    var Cwidght = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        speak(BoxText);
      },
       child: Container(
         height: Cheight*0.5*0.15,
         width: Cwidght*0.45*0.7,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
           boxShadow: [
             BoxShadow(
               color: Colors.black38, // Shadow color
               offset: Offset(0, 2), // Offset of the shadow
               blurRadius: 4.0, // Spread of the shadow
             ),
           ],
           color: flag? Color.fromARGB(255, 255, 185, 219) :
           Color.fromARGB(255, 200, 160, 255),),
         child: Center(
           child: Text(
                BoxText,
             style: GoogleFonts.caladea(
               fontSize: Cheight*0.12,
               color: flag ? Colors.black : Colors.white,
             ),

           ),
         ),
       ),
    );
  }

}

