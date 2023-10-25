import 'package:flutter/material.dart';
import 'package:vachanapp/utils/color_utils.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/widgets/Heading.dart';
import 'package:vachanapp/widgets/Images.dart';
import 'package:vachanapp/widgets/Images2.dart';
import 'package:vachanapp/widgets/WhiteHeading.dart';
import 'package:vachanapp/Screens/read.dart';


class MainPage extends StatefulWidget{


  const MainPage({Key? key,}): super(key: key);

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    var Cwidgth = MediaQuery.of(context).size.height*0.38;
    var Cheight = MediaQuery.of(context).size.height*0.38;
    var cwidgth = MediaQuery.of(context).size.width*0.45;
    return MaterialApp(
      home: Scaffold(
        appBar: Appbar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 248, 134, 187),
          onPressed: () {
            print("doubt");
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => YourNextPage()));
          },
          child: Icon(Icons.question_mark), // You can change the icon as needed
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SingleChildScrollView(
          child: Container(
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //       colors: [
            //         hexStringToColor("FCE5F1"),
            //         hexStringToColor("FAD2E3"),] , begin: Alignment.topCenter, end: Alignment.bottomCenter
            //   ),
            // ),
              child: Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Container(
                             height: Cheight*0.82,
                             width: Cwidgth,
                             child: Image.asset('images/rainbow.png')),
                       ],
                     ),

                   ],
              ),
            ),

          ),
        ),
      debugShowCheckedModeBanner: false,
    );
  }
}

