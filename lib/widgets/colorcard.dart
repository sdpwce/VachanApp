import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorBox extends StatelessWidget {
  ColorBox({Key? key,
    required this.colorboxText,
    required this.color,
    required this.bcolor,
    required this.flag,
  })
      : super(key: key);

  final String colorboxText;
  final Color color;
  final Color bcolor;
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

  @override
  Widget build(BuildContext context) {
    var Cheight = MediaQuery.of(context).size.height;
    var Cwidht = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        speak(colorboxText);
      },
      onDoubleTap: (){},
      child: Container(
          height: Cheight*0.21,
          width: Cwidht*0.43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
          boxShadow: [
            BoxShadow(
              color: Colors.black38, // Shadow color
              offset: Offset(0, 2), // Offset of the shadow
              blurRadius: 4.0, // Spread of the shadow
            ),
          ],
          color: bcolor,),
          child: Column(
            children: [
              SizedBox(height: Cheight*0.22*0.1,),
              Container( height: Cheight*0.22*0.5,
                width: Cwidht*0.42*0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38, // Shadow color
                      offset: Offset(0, 2), // Offset of the shadow
                      blurRadius: 4.0, // Spread of the shadow
                    ),
                  ],
                  color: color,),
                child: Center(
                  child: Container(
                      height: Cheight*0.22*0.5*0.5,
                      width: Cwidht*0.42*0.8*0.5,
                       child:  flag?Image.asset('images/roller-paint.png'):Image.asset('images/paint-brush.png'),
                  ),
                ),

              ),
              SizedBox(height: Cheight*0.22*0.1,),
          Text(colorboxText, style: GoogleFonts.lacquer(
            fontSize: Cwidht*0.075,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),textAlign: TextAlign.center,),

        ],
      ),
      )
    );
  }
}
