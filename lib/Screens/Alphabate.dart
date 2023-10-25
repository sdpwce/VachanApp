import 'package:flutter/material.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/utils/color_utils.dart';
import 'package:vachanapp/widgets/AlphaBox.dart';



class Alphabate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var Cwidgth = MediaQuery.of(context).size.height*0.38;
    var Cheight = MediaQuery.of(context).size.height*0.38;
    return Scaffold(
     appBar:  Appbar(),
      body: SingleChildScrollView(
        child: Column(

             children: [
               SizedBox(height:  Cwidgth*0.05,),
               Row(
                 children: [
                   SizedBox(width:  Cwidgth*0.05,),
                   Text("<- Lets Test Yourself", style: TextStyle(
                    fontSize: Cwidgth*0.07, color: Color.fromARGB(255, 248, 134, 187), fontWeight: FontWeight.bold
                 ),)],
               ),
               SizedBox(height: Cheight*0.16,),
               Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     SizedBox(width:  Cwidgth*0.1,),
                     Column(
                       children: [
                         SizedBox(height: Cheight*0.15,),
                         Container(
                           width: Cwidgth*0.35,
                           height: Cheight*0.35,
                           child:  Image.asset('images/bee.png'),
                         ),
                       ],
                     ),
                     Container(
                          width: Cwidgth*0.5,
                         height: Cheight*0.5,
                       child:  Image.asset('images/BeeTeacher.png'),
                     ),

                   ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Container(
                     width: Cwidgth*0.25,
                     height: Cheight*0.18,
                     color: Colors.brown,
                   ),
                   Container(
                     width: Cwidgth*0.25,
                     height: Cheight*0.18,
                     color: Colors.brown,
                   ),
                   Container(
                     width: Cwidgth*0.25,
                     height: Cheight*0.18,
                     color: Colors.brown,
                   ),
                   Container(
                     width: Cwidgth*0.25,
                     height: Cheight*0.18,
                     color: Colors.brown,
                   ),
                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [

                   Container(
                     width: Cwidgth*0.25,
                     height: Cheight*0.18,
                     color: Colors.brown,
                   ),
                   Container(
                     width: Cwidgth*0.25,
                     height: Cheight*0.18,
                     color: Colors.brown,
                   ),
                   Container(
                     width: Cwidgth*0.25,
                     height: Cheight*0.18,
                     color: Colors.brown,
                   ),
                   Container(
                     width: Cwidgth*0.25,
                     height: Cheight*0.18,
                     color: Colors.brown,
                   ),
                   Container(
                     width: Cwidgth*0.15,
                     height: Cheight*0.18,
                     color: Colors.brown,
                   ),
                 ],
               )

             ],
        ),
      ),
    );
  }
}
