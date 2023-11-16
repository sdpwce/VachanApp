import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vachanapp/Screens/detailAlpha.dart';
class NumberBox extends StatelessWidget{
  NumberBox({Key? key, required this.MidBoxText, required this.flag, required this.rl})
      : super(key: key);

  final String MidBoxText;
  final bool flag;
  final bool rl;




  Widget build(BuildContext context) {
    var Cheight = MediaQuery.of(context).size.height;
    var Cwidgth = MediaQuery.of(context).size.width;

    return  rl ? Container(
        width: Cwidgth*0.15*0.65,
        height: Cheight*0.82*0.058,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0), // Adjust the radius as needed
            bottomLeft: Radius.circular(5.0), // Adjust the radius as needed
          ),// Half of width or height for a perfect circle
          color: flag ? Color.fromARGB(255, 248, 134, 187) :
          Colors.white,
        ),
        child: Center(
          child: Text(
            MidBoxText, style: GoogleFonts.langar(
            fontSize: Cheight*0.04,
            color: flag ? Colors.white : Colors.black,
          ),textAlign: TextAlign.center,
          ),
        ),
      ) :Container(
        width: Cwidgth*0.15*0.65,
        height: Cheight*0.82*0.058,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(5.0), // Adjust the radius as needed
            bottomRight: Radius.circular(5.0), // Adjust the radius as needed
          ),// Half of width or height for a perfect circle
          color: flag ? Color.fromARGB(255, 248, 134, 187) :
          Colors.white,
        ),
        child: Center(
          child: Text(
            MidBoxText, style: GoogleFonts.langar(
            fontSize: Cheight*0.04,
            color: flag ? Colors.white : Colors.black,
          ),textAlign: TextAlign.center,
          ),
        ),
    );
  }

}