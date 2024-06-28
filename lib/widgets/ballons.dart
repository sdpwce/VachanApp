import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../Screens/DetailWord.dart';

class RedB extends StatelessWidget {
  RedB({Key? key,
    required this.BText,
    required this.flag,
    required this.v,

  })
      : super(key: key);

  final String BText;
  final bool flag;
  final int v;
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
    var Cheight = MediaQuery.of(context).size.height*0.38;
    return InkWell(
      onTap: (){
        speak(BText);
      },
      onLongPress: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Words(BText: this.BText, Index : v)));
      },
      onDoubleTap: (){},
      child: Stack( children: [
        Image.asset(
            'images/redb.png', // Replace with your image URL
            width: Cheight*0.19, // Set your desired width
            height: Cheight*0.258, // Set your desired height
            fit: BoxFit.cover, // Adjust the fit based on your image size
          ),
          Positioned(
            top: Cheight*0.007, // Adjust the top position as needed
            left: Cheight*0.03, // Adjust the left position as needed
            child: Container(
              padding: EdgeInsets.all(10),
              // Adjust the background color and opacity
              child: Text(
                BText,
                style: TextStyle(
                  color: flag?Colors.white:Colors.black, // Text color
                  fontSize: Cheight*0.15, // Text font size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//
class BlueB extends StatelessWidget {
  BlueB({Key? key,
    required this.BText,
    required this.flag,
    required this.s,
    required this.v,
  })
      : super(key: key);

  final String BText;
  final bool flag;
  final bool s;
  final int v;
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
    var Cheight = MediaQuery.of(context).size.height*0.38;
    return InkWell(
      onTap: (){
        speak(BText);
      },
      onLongPress: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Words(BText: this.BText, Index : v)));
      },
      onDoubleTap: (){},
      child: Stack( children: [
        Image.asset(
          'images/blueb.png', // Replace with your image URL
          width: Cheight*0.214, // Set your desired width
          height: Cheight*0.29, // Set your desired height
          fit: BoxFit.cover, // Adjust the fit based on your image size
        ),
        Positioned(
          top: Cheight*0.025, // Adjust the top position as needed
          left: s?Cheight*0.04: Cheight*0.06, // Adjust the left position as needed
          child: Container(
            padding: EdgeInsets.all(10),
            // Adjust the background color and opacity
            child: Text(
              BText,
              style: TextStyle(
                color: flag?Colors.white:Colors.black, // Text color
                fontSize: Cheight*0.15, // Text font size
              ),
            ),
          ),
        ),
      ],
      ),
    );
  }
}

class PinkB extends StatelessWidget {
  PinkB({Key? key,
    required this.BText,
    required this.flag,
    required this.s,
    required this.v,
  })
      : super(key: key);

  final String BText;
  final bool flag;
  final bool s;
  final int v;
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
    var Cheight = MediaQuery.of(context).size.height*0.38;
    return InkWell(
      onTap: (){
        speak(BText);
      },
      onLongPress: (){

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Words(BText: this.BText, Index : v)));
      },
      onDoubleTap: (){},
      child: Stack( children: [
        Image.asset(
          'images/pinkb.png', // Replace with your image URL
          width: Cheight*0.214, // Set your desired width
          height: Cheight*0.29, // Set your desired height
          fit: BoxFit.cover, // Adjust the fit based on your image size
        ),
        Positioned(
          top: Cheight*0.025, // Adjust the top position as needed
          left: s?Cheight*0.04:Cheight*0.025, // Adjust the left position as needed
          child: Container(
            padding: EdgeInsets.all(10),
            // Adjust the background color and opacity
            child: Text(
              BText,
              style: TextStyle(
                color: flag?Colors.white:Colors.black, // Text color
                fontSize: Cheight*0.15, // Text font size
              ),
            ),
          ),
        ),
      ],
      ),
    );
  }
}

class YellowB extends StatelessWidget {
  YellowB({Key? key,
    required this.BText,
    required this.flag,
    required this.v,
  }) : super(key: key);

  final String BText;
  final bool flag;
  final int v;
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
    var Cheight = MediaQuery.of(context).size.height*0.38;
    return InkWell(
      onTap: (){
        speak(BText);
      },
      onLongPress: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Words(BText: this.BText, Index : v)));
      },
      onDoubleTap: (){},
      child: Stack( children: [
        Image.asset(
          'images/yellowb.png', // Replace with your image URL
          width: Cheight*0.185, // Set your desired width
          height: Cheight*0.245, // Set your desired height
          fit: BoxFit.cover, // Adjust the fit based on your image size
        ),
        Positioned(
          top: Cheight*0.025, // Adjust the top position as needed
          left: Cheight*0.03, // Adjust the left position as needed
          child: Container(
            padding: EdgeInsets.all(10),
            // Adjust the background color and opacity
            child: Text(
              BText,
              style: TextStyle(
                color: flag?Colors.white:Colors.black, // Text color
                fontSize: Cheight*0.13, // Text font size
              ),
            ),
          ),
        ),
      ],
      ),
    );
  }
}

//
class GreenB extends StatelessWidget {
  GreenB({Key? key,
    required this.BText,
    required this.flag,
    required this.v,
  })
      : super(key: key);

  final String BText;
  final bool flag;
  final int v;
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
    var Cheight = MediaQuery.of(context).size.height*0.38;
    return InkWell(
      onTap: (){
        speak(BText);
      },
      onLongPress: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Words(BText: this.BText, Index : v)));
      },
      onDoubleTap: (){},
      child: Stack( children: [
        Image.asset(
          'images/greenb.png', // Replace with your image URL
          width: Cheight*0.19, // Set your desired width
          height: Cheight*0.258, // Set your desired height
          fit: BoxFit.cover, // Adjust the fit based on your image size
        ),
        Positioned(
          top: Cheight*0.007, // Adjust the top position as needed
          left: Cheight*0.03, // Adjust the left position as needed
          child: Container(
            padding: EdgeInsets.all(10),
            // Adjust the background color and opacity
            child: Text(
              BText,
              style: TextStyle(
                color: flag?Colors.white:Colors.black, // Text color
                fontSize: Cheight*0.15, // Text font size
              ),
            ),
          ),
        ),
      ],
      ),
    );
  }
}


class VioletB extends StatelessWidget {
  VioletB({Key? key,
    required this.BText,
    required this.flag,
    required this.s,
    required this.v,
  }) : super(key: key);

  final String BText;
  final bool flag;
  final bool s;
  final int v;
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
    var Cheight = MediaQuery.of(context).size.height*0.38;
    return InkWell(
      onTap: (){
        speak(BText);
      },
      onLongPress: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Words(BText: this.BText, Index : v)));

      },
      onDoubleTap: (){},
      child: Stack( children: [
        Image.asset(
          'images/violetb.png', // Replace with your image URL
          width: Cheight*0.182, // Set your desired width
          height: Cheight*0.245, // Set your desired height
          fit: BoxFit.cover, // Adjust the fit based on your image size
        ),
        Positioned(
          top: Cheight*0.025, // Adjust the top position as needed
          left: s?Cheight*0.03:Cheight*0.024, // Adjust the left position as needed
          child: Container(
            padding: EdgeInsets.all(10),
            // Adjust the background color and opacity
            child: Text(
              BText,
              style: TextStyle(
                color: flag?Colors.white:Colors.black, // Text color
                fontSize: Cheight*0.12, // Text font size
              ),
            ),
          ),
        ),
      ],
      ),
    );
  }
}