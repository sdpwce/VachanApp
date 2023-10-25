// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
//
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SpeechToTextDemo(),
//     );
//   }
// }
//
// class SpeechToTextDemo extends StatefulWidget {
//   @override
//   _SpeechToTextDemoState createState() => _SpeechToTextDemoState();
// }
//
// class _SpeechToTextDemoState extends State<SpeechToTextDemo> {
//   stt.SpeechToText _speech = stt.SpeechToText();
//   String recognizedSpeech = "";
//
//   @override
//   void initState() {
//     super.initState();
//     _speech.initialize(onStatus: (status) {
//       if (status == stt.SpeechToText.listeningStatus) {
//         setState(() {
//           recognizedSpeech = "";
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Speech to Text Demo"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Text("Recognized Speech: $recognizedSpeech"),
//             ElevatedButton(
//               onPressed: startListening,
//               child: Text("Start Listening"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void startListening() {
//     _speech.listen(onResult: (result) {
//       setState(() {
//         recognizedSpeech = result.recognizedWords;
//       });
//
//       // Match recognizedSpeech with existing text
//       if (isMatchingText(recognizedSpeech, "A")) {
//         // Handle the match
//         print("Match found!");
//       } else {
//         print("No match found.");
//       }
//     });
//   }
//
//   bool isMatchingText(String speech, String existingText) {
//     // Implement your text matching logic here
//     // You can use regular expressions or simple string comparison
//     return speech.toLowerCase() == existingText.toLowerCase();
//   }
// }
