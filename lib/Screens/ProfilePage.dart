import 'package:flutter/material.dart';
//import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/Screens/ProfilePage.dart';

class ProfilePage extends StatefulWidget{


  const ProfilePage({Key? key,}): super(key: key);

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    var Cwidgth = MediaQuery.of(context).size.height*0.38;
    var Cheight = MediaQuery.of(context).size.height*0.38;
    var Iwidgth = MediaQuery.of(context).size.width*0.4;
    var Iheight = MediaQuery.of(context).size.height*0.3;
    return MaterialApp(
      home: Scaffold(
     //   appBar:  Appbar(AppBarText: "वाचन", flag: false,),

        body:  Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white38,
                   ] , begin: Alignment.topCenter, end: Alignment.bottomCenter
              ),
            ),
            child: Column(
                 children: [
                   Image.asset('images/girlreading.png',
                     width: Iwidgth, // Set the desired width
                     height: Iheight, // Set the desired height),
                   ),
                  
                 ],
            ),
          ),
        ),
      debugShowCheckedModeBanner: false,
    );
  }
}

