import 'package:flutter/material.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/widgets/Heading.dart';
import 'package:vachanapp/Screens/Alphabate.dart';
import 'package:vachanapp/Screens/Varnmala.dart';
import 'package:vachanapp/Screens/Number.dart';
import 'package:google_fonts/google_fonts.dart';


class ReadPage extends StatelessWidget {
  const ReadPage({Key? key, required this.lang,}) : super(key: key);
  final bool lang;
  @override
  Widget build(BuildContext context) {
    var cwidgth = MediaQuery.of(context).size.width;
    var cheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor:  const Color.fromARGB(255, 211, 232, 239),
      appBar: Appbar(apptext: "वाचन",),

      body: Stack(
        children:[  Image.asset(
          'images/homebackground.png',
          fit: BoxFit.cover, // You can adjust the fit property as needed
          width: double.infinity,
          height: double.infinity,
        ),
          Row(
               children: [
                    Container(
                      width: cwidgth*0.55,
                      height: cheight,
                    //  color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Alphabate()));
                              },
                              child: Container(
                                width: cwidgth*1.2,
                                child: Center(
                                    child: Text(lang?"Alphabet Reading":"वर्णमाला वाचन", style: GoogleFonts.lacquer(
                                      fontSize: cwidgth*0.1,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),textAlign: TextAlign.center,)),
                              ),
                            ),
                                InkWell(
                                  onTap: (){ Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => lang?Alphabate():Varnmala()),
                                  );},
                                  child: Container(
                                      width: cwidgth*0.55,
                                      height: cheight*0.3,
                                      child: Image.asset('images/farm_house2.png')),
                                ),
                          ],
                      ),
                    ),
                   Container(
                     width: cwidgth*0.45,
                     height: cheight,
                   //  color: Colors.black,
                     child: Column(
                       children: [
                         SizedBox(height: cheight*0.49,),
                       InkWell(
                             onTap: (){ Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => Number(lang: lang,),
                             ));},
                             child: Container(

                                 height: cheight*0.2,
                                 child: Image.asset('images/farm_house.png')),
                           ),
                         SizedBox(height: cheight*0.04,),
                     InkWell(
                             onTap: (){
                               Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) => Number(lang: lang),));
                             },
                             child: Container(
                               width: cwidgth*1.2,
                               child: Center(
                                   child: Text(lang?"Number Reading":"संख्या वाचन", style: GoogleFonts.lacquer(
                                       fontSize: cwidgth*0.1,
                                       fontWeight: FontWeight.bold,
                                   ),textAlign: TextAlign.center,)),
                             ),
                           ),
                       ],
                     ),

                   ),

               ],
          ),
      ]));
  }
}
