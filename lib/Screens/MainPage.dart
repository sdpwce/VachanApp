import 'package:flutter/material.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/widgets/Window.dart';

class MainPage extends StatefulWidget{


  const MainPage({Key? key,}): super(key: key);

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    var Cwidgth = MediaQuery.of(context).size.width*0.38;
    var Cheight = MediaQuery.of(context).size.height*0.38;
    var cwidgth = MediaQuery.of(context).size.width*0.45;
    return MaterialApp(
      home: Scaffold(
        appBar: Appbar(apptext: "वाचन",),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 248, 134, 187),

          onPressed: () {
            print("doubt");
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => YourNextPage()));
          },
          child: Icon(Icons.question_mark), // You can change the icon as needed
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Stack(
          children:[
            Image.asset(
              'images/fback.jpg',
              fit: BoxFit.cover, // You can adjust the fit property as needed
              width: double.infinity,
              height: double.infinity,
            ),
            SingleChildScrollView(
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
                       SizedBox(height: Cheight*0.2,),
                       Window(),
                       SizedBox(height: Cheight*0.15,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [

                           Container(
                               height: Cheight*0.8,
                               width: Cwidgth*1.6,
                               child: Image.asset('images/wildcat.png')),
                         ],
                       ),

                     ],
                ),
              ),

            ),
            ]
        ),
        ),
      debugShowCheckedModeBanner: false,
    );
  }
}

