import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class BigDrop extends StatelessWidget {
  BigDrop({Key? key,
    required this.DropText,
    required this.three, required this.lang,
  })
      : super(key: key);

  final String DropText;
  final bool three;
  final bool lang;
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
    String sp = "";
    if(DropText == '0' && lang == false)
          sp = "शून्य";
    if(DropText == '१' && lang == false)
      sp = "एक";
    if(DropText == '२' && lang == false)
      sp = "दोन";
    if(DropText == '३' && lang == false)
      sp = "तीन";
    if(DropText == '४' && lang == false)
      sp = "चार";
    if(DropText == '५' && lang == false)
      sp = "पाच";
    if(DropText == '६' && lang == false)
      sp = "सहा";
    if(DropText == '७' && lang == false)
      sp = "सात";
    if(DropText == '८' && lang == false)
      sp = "आठ";
    if(DropText == '९' && lang == false)
      sp = "नऊ";
    var Cheight = MediaQuery.of(context).size.height*0.38;
    return InkWell(
      onTap: (){
        if(lang == false)
           speak(sp);
        else
          speak(DropText);
      },
      onDoubleTap: (){},
      child: Stack(
        children: [
          Image.asset(
            'images/raindrop.png', // Replace with your image URL
            width: Cheight*0.3, // Set your desired width
            height: Cheight*0.35, // Set your desired height
            fit: BoxFit.cover, // Adjust the fit based on your image size
          ),
          Positioned(
            top: Cheight*0.12, // Adjust the top position as needed
            left: three?Cheight*0.06: Cheight*0.085, // Adjust the left position as needed
            child: Container(
              padding: EdgeInsets.all(10),
            // Adjust the background color and opacity
              child: Text(
                DropText,
                style: TextStyle(
                  color: Colors.white, // Text color
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

class Drop extends StatelessWidget {
  Drop({Key? key,
    required this.DropText, required this.lang,
  })
      : super(key: key);
  final bool lang;
  final String DropText;
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
    String sp = "";
    if(DropText == '0' && lang == false)
      sp = "शून्य";
    if(DropText == '१' && lang == false)
      sp = "एक";
    if(DropText == '२' && lang == false)
      sp = "दोन";
    if(DropText == '३' && lang == false)
      sp = "तीन";
    if(DropText == '४' && lang == false)
      sp = "चार";
    if(DropText == '५' && lang == false)
      sp = "पाच";
    if(DropText == '६' && lang == false)
      sp = "सहा";
    if(DropText == '७' && lang == false)
      sp = "सात";
    if(DropText == '८' && lang == false)
      sp = "आठ";
    if(DropText == '९' && lang == false)
      sp = "नऊ";
    var Cheight = MediaQuery.of(context).size.height*0.38;
    return InkWell(
      onTap: (){
        if(lang == false)
          speak(sp);
        else
          speak(DropText);
      },
      onDoubleTap: (){},
      child: Stack(
        children: [
          Image.asset(
            'images/raindrop.png', // Replace with your image URL
            width: Cheight*0.3, // Set your desired width
            height: Cheight*0.3, // Set your desired height
            fit: BoxFit.cover, // Adjust the fit based on your image size
          ),
          Positioned(
            top: Cheight*0.11, // Adjust the top position as needed
            left: Cheight*0.1, // Adjust the left position as needed
            child: Container(
              padding: EdgeInsets.all(10),
              // Adjust the background color and opacity
              child: Text(
                DropText,
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: Cheight*0.1, // Text font size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmallDrop extends StatelessWidget {
  SmallDrop({Key? key,
    required this.DropText,
    required this.four, required this.lang,
  })
      : super(key: key);
  final bool lang;
  final String DropText;
  final bool four;

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
    String sp = "";
    if(DropText == '0' && lang == false)
      sp = "शून्य";
    if(DropText == '१' && lang == false)
      sp = "एक";
    if(DropText == '२' && lang == false)
      sp = "दोन";
    if(DropText == '३' && lang == false)
      sp = "तीन";
    if(DropText == '४' && lang == false)
      sp = "चार";
    if(DropText == '५' && lang == false)
      sp = "पाच";
    if(DropText == '६' && lang == false)
      sp = "सहा";
    if(DropText == '७' && lang == false)
      sp = "सात";
    if(DropText == '८' && lang == false)
      sp = "आठ";
    if(DropText == '९' && lang == false)
      sp = "नऊ";
    var Cheight = MediaQuery.of(context).size.height*0.38;
    return InkWell(
      onTap: (){
        if(lang == false)
          speak(sp);
        else
          speak(DropText);
      },
      onDoubleTap: (){},
      child: Stack(
        children: [
          Image.asset(
            'images/raindrop.png', // Replace with your image URL
            width: Cheight*0.26, // Set your desired width
            height: Cheight*0.26, // Set your desired height
            fit: BoxFit.cover, // Adjust the fit based on your image size
          ),
          Positioned(
            top: Cheight*0.09, // Adjust the top position as needed
            left: four?Cheight*0.07:Cheight*0.08, // Adjust the left position as needed
            child: Container(
              padding: EdgeInsets.all(10),
              // Adjust the background color and opacity
              child: Text(
                DropText,
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: Cheight*0.1, // Text font size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TenDrop extends StatelessWidget {
  TenDrop({Key? key,
    required this.DropText,
    required this.four, required this.lang,
  })
      : super(key: key);
  final bool lang;
  final String DropText;
  final bool four;

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
    String sp = "";
    if(DropText == '0' && lang == false)
      sp = "शून्य";
    if(DropText == '१' && lang == false)
      sp = "एक";
    if(DropText == '२' && lang == false)
      sp = "दोन";
    if(DropText == '३' && lang == false)
      sp = "तीन";
    if(DropText == '४' && lang == false)
      sp = "चार";
    if(DropText == '५' && lang == false)
      sp = "पाच";
    if(DropText == '६' && lang == false)
      sp = "सहा";
    if(DropText == '७' && lang == false)
      sp = "सात";
    if(DropText == '८' && lang == false)
      sp = "आठ";
    if(DropText == '९' && lang == false)
      sp = "नऊ";
    var Cheight = MediaQuery.of(context).size.height*0.38;
    return InkWell(
      onTap: (){
        if(lang == false)
          speak(sp);
        else
          speak(DropText);
      },
      onDoubleTap: (){},
      child: Stack(
        children: [
          Image.asset(
            'images/raindrop.png', // Replace with your image URL
            width: Cheight*0.26, // Set your desired width
            height: Cheight*0.26, // Set your desired height
            fit: BoxFit.cover, // Adjust the fit based on your image size
          ),
          Positioned(
            top: Cheight*0.09, // Adjust the top position as needed
            left: four?Cheight*0.05:Cheight*0.08, // Adjust the left position as needed
            child: Container(
              padding: EdgeInsets.all(10),
              // Adjust the background color and opacity
              child: Text(
                DropText,
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: Cheight*0.1, // Text font size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
