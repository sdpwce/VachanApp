import 'package:flutter/material.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/utils/color_utils.dart';
import 'package:vachanapp/widgets/Heading.dart';
import 'package:vachanapp/Screens/Alphabate.dart';
import 'package:vachanapp/Screens/Number.dart';
import 'package:google_fonts/google_fonts.dart';


class ReadPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cwidgth = MediaQuery.of(context).size.width*0.4;
    var cheight = MediaQuery.of(context).size.width*0.4;
    return Scaffold(
        backgroundColor:  const Color.fromARGB(255, 211, 232, 239),
      appBar: Appbar(),

      body: SingleChildScrollView(
        child: Column(
             children: [
                  Row(

                    children: [
                      Column(
                        children: [

                          InkWell(
                            onTap: (){ Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Alphabate()),
                            );},
                            child: Container(
                                width: cwidgth*1.4,
                                height: cheight*1.4,
                                child: Image.asset('images/property.png')),
                          ),
                          Row(

                            children: [

                              InkWell(
                                onTap: (){},
                                child: Container(
                                  width: cwidgth*1.2,
                                  child: Center(
                                      child: Text("Alphabate Reading", style: GoogleFonts.lacquer(
                                          fontSize: cwidgth*0.25
                                      ),textAlign: TextAlign.center,)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                 SizedBox(height: cwidgth*0.3,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Column(
                       children: [
                         InkWell(
                           onTap: (){ Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => Number(),
                           ));},
                           child: Container(
                               width: cwidgth*1.4,
                               height: cheight*1.4,
                               child: Image.asset('images/property.png')),
                         ),
                         Row(
                           children: [

                             Container(
                               width: cwidgth*1.2,
                               child: Center(
                                   child: Text("Number Reading", style: GoogleFonts.lacquer(
                                       fontSize: cwidgth*0.25
                                   ),textAlign: TextAlign.center,)),
                             ),
                           ],
                         ),
                       ],

                     ),

                   ],),

             ],
        ),
      ));
  }
}
