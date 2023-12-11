import 'package:flutter/material.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:async';

import '../widgets/Button.dart';



class Fruits extends StatefulWidget {
  const Fruits({Key? key, required this.lang,}) : super(key: key);
  final bool lang;

  @override
  _ColorListState createState() => _ColorListState(lang: lang);
}

class _ColorListState extends State<Fruits> {
   _ColorListState({Key? key, required this.lang,});
  final bool lang;

  final List<String> FruitsNames = ['apple', 'banana', 'cherry', 'chikoo', 'coconut', 'custard apple', 'grapes', 'guava', 'Jamun', 'orange', 'papaya', 'pineapple', 'pomegranate', 'strawberry', 'watermelon'];
  final PageController _pageController = PageController(initialPage: 0);
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

  final SpeechToText _speechToText = SpeechToText();

  bool _speechEnabled = false;
  String _wordsSpoken = "";

  late String _words;
  //
  // void initState() {
  //   super.initState();
  //
  // }

  double _confidenceLevel = 0;

  String resultText = '';
  Color resultColor = Colors.black;
  bool isCorrect = false;
  bool showTick = false;
  bool isReading = false;
  @override
  void initState() {
    super.initState();
    _words = "";
    initSpeech();
    initTts();
  }

  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      _confidenceLevel = 0;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});

  }
  void _startReading(String text) async {
    setState(() {
      isReading = true;
    });
    await flutterTts.speak(text);
    setState(() {
      isReading = false;
    });
  }

  void _stopReading() async {
    await flutterTts.stop();
    setState(() {
      isReading = false;
    });
  }
  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = "${result.recognizedWords}";
      _confidenceLevel = result.confidence;

    });
    checkStrings();
  }
  int one = 0;
  void checkStrings() {

    int currentIndex = _pageController.page!.round();

    if (_wordsSpoken.toLowerCase() == FruitsNames[currentIndex].toLowerCase()) {
      showResult('Correct', Colors.green);
      one++;
      if (one > 0) {
        speak("correct");
      }
    } else {
      one++;
      showResult('Incorrect', Colors.red);
      if (one == 10) {
        speak("Incorrect");
      }
    }
  }

  void showResult(String text, Color color) {
    setState(() {
      resultText = text;
      resultColor = color;
      if(text == "Correct")
         showTick = true;
      if(text == "Correct")
         isCorrect = true;
      if(text == "Incorrect")
        showTick = true;
      if(text == "Incorrect")
        isCorrect = false;
    });

    Timer(Duration(seconds: 3), () {
      setState(() {
        resultText = '';
        resultColor = Colors.black;
        showTick = false;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    var cheight = MediaQuery.of(context).size.height;
    var cwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _speechToText.isListening ? _stopListening : _startListening,
        tooltip: 'Listen',
        child: Icon(
          _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
      appBar: Appbar(apptext: "वाचन",),
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity! > 0) {
            // Swiped Right
            if (_pageController.page! > 0) {
              _pageController.previousPage(duration: Duration(milliseconds: 10), curve: Curves.easeInOut);
            }
          } else if (details.primaryVelocity! < 0) {
            // Swiped Left
            if (_pageController.page! < FruitsNames.length - 1) {
              _pageController.nextPage(duration: Duration(milliseconds: 10), curve: Curves.easeInOut);
            }
          }
        },
        child: Container(
          child: PageView.builder(
            controller: _pageController,
            itemCount: FruitsNames.length,
            itemBuilder: (context, index) {
              return Stack(
                  children:[
                    Image.asset(
                      'images/back5.png',
                      fit: BoxFit.cover, // You can adjust the fit property as needed
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                           //  SizedBox(height: cheight*0.01,),
                            Container(
                                   height: cheight*0.08,
                                 // color: Colors.white,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     InkWell(
                                       onTap: (){
                                         speak(lang?FruitsNames[index]:getName(FruitsNames[index]));
                                       },
                                       child: Text(lang?FruitsNames[index]:getName(FruitsNames[index]), style: GoogleFonts.lacquer(
                                         fontSize: cwidth*0.09,
                                         fontWeight: FontWeight.bold,
                                           color: Color.fromARGB(
                                               255, 252, 132, 186),
                                       ),textAlign: TextAlign.center, ),
                                     ),
                                   ],
                              ),
                            ),
                          Container(
                            height: cheight*0.15,
                           // color: Colors.pink,
                            child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    InkWell(
                                      onTap: (){
                                        speak(lang?FruitsNames[index]:getName(FruitsNames[index]));
                                      },
                                      child: Container(
                                          width: cwidth*0.4,
                                         //color: Colors.white,
                                          child: Image.asset(getImage(FruitsNames[index])),
                                      ),
                                    )
                                ],
                            ),
                          ),
                          Container(
                            height: cheight*0.35,
                          //  color: Colors.black,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                     Container(width: cwidth*0.15,
                                     child: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                             Container(
                                                  color: Colors.grey,
                                                   height: cheight*0.35*0.02,
                                             )
                                         ],
                                     ),) ,
                                      Container(width: cwidth*0.7,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.0), // Adjust the radius to control the curve.
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black38, // Shadow color
                                              offset: Offset(0, 2), // Offset of the shadow
                                              blurRadius: 4.0, // Spread of the shadow
                                            ),
                                          ],
                                          color: Color.fromARGB(
                                              255, 93, 172, 178)),
                                        child: Column(
                                              children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: Container(

                                                        child: Padding(
                                                          padding: EdgeInsets.all(cwidth*0.06),
                                                          child: Text(lang?getInfo(FruitsNames[index]):getInfoM(FruitsNames[index]),
                                                            style: TextStyle(fontSize: cwidth*0.06, color: Colors.white),textAlign: TextAlign.center,),
                                                        )
                                                    ),
                                                  ),
                                                   Expanded(
                                                     flex: 1,
                                                     child: Container(
                                                       child: Row(
                                                         mainAxisAlignment: MainAxisAlignment.end,
                                                         children: [
                                                           Column(
                                                             children: [
                                                               Button(ButtonText: lang?"Stop":"थांबा", onTap: _stopReading),
                                                             ],
                                                           ),
                                                           SizedBox(width: lang?cwidth*0.05:cwidth*0.12,),
                                                           Column(
                                                             children: [
                                                               Button(ButtonText: lang?"Listen":"ऐका", onTap:(){speak(lang?getInfo(FruitsNames[index]):getInfoM(FruitsNames[index]));}),
                                                             ],
                                                           ),
                                                           SizedBox(width: cwidth*0.8*0.1,),
                                                         ],
                                                       ),
                                                     ),
                                                   )
                                              ],
                                        ),
                                      ),
                                  Container(width: cwidth*0.15,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          color: Colors.grey,
                                          height: cheight*0.35*0.02,
                                        )
                                      ],
                                    ),),
                                ],
                            ),
                          ),
                          SizedBox(height: cheight*0.02,),
                          InkWell(
                            onTap: (){
                              speak(lang?FruitsNames[index]:getName(FruitsNames[index]));
                            },
                            child: Text(lang?FruitsNames[index]:getName(FruitsNames[index]),
                              style: TextStyle(fontSize: cwidth*0.06, fontWeight: FontWeight.bold),),
                          ),
                          //    SizedBox(height: cheight*0.01,),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              _speechToText.isListening
                                  ? "listening..."
                                  : _speechEnabled
                                  ? _words
                                  : "ok",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          Container(
                            //  padding: EdgeInsets.all(16),
                            child: Text(
                              _wordsSpoken,
                              style: TextStyle(
                                fontSize: cwidth*0.05,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Text(
                            resultText,
                            style: TextStyle(
                              color: resultColor,
                              fontSize: cwidth*0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (showTick)
                            Icon(
                              isCorrect ? Icons.check : Icons.close,
                              color: isCorrect ? Colors.green : Colors.red,
                              size: 50,
                            ),


                        ],
                      ),
                    ),
                  ]
              );
            },
          ),
        ),
      ),
    );
  }

}

String getImage(String AnimalName) {
  switch (AnimalName.toLowerCase()) {
    case 'apple':
      return "images/apple.png";
    case 'banana':
      return "images/banana2.png";
    case 'watermelon':
      return "images/watermelon.png";
    case 'pomegranate':
      return "images/pomegranate.png";
    case 'cherry':
      return "images/cherry.png";
    case 'strawberry':
      return "images/strawberry.png";
    case 'chikoo':
      return "images/chikoo.png";
    case 'jamun':
      return "images/jamun.png";
    case 'custard apple':
      return "images/custardapple.png";
    case 'pineapple':
      return "images/pineapple.png";
    case 'coconut':
      return "images/coconut.png";
    case 'papaya':
      return "images/papaya.png";
    case 'orange':
      return "images/orange.png";
    case 'grapes':
      return "images/grapes.png";
    case 'guava':
      return "images/guava.png";
    default:
      return "images/guava.png";
  }
}

String getName(String AnimalName) {
  switch (AnimalName.toLowerCase()) {
    case 'apple':
      return "सफरचंद";
    case 'banana':
      return "केळी";
    case 'watermelon':
      return "टरबूज";
    case 'pomegranate':
      return "डाळिंब";
    case 'cherry':
      return "चेरी";
    case 'strawberry':
      return "स्ट्रॉबेरी";
    case 'chikoo':
      return "चिकू";
    case 'jamun':
      return "जांभूळ";
    case 'custard apple':
      return "सीताफळ";
    case 'pineapple':
      return "अननस";
    case 'coconut':
      return "नारळ";
    case 'papaya':
      return "पपई";
    case 'orange':
      return "संत्रा";
    case 'grapes':
      return "द्राक्षे";
    case 'guava':
      return "पेरू";
    default:
      return "पेरू";
  }
}


String getInfo(String AnimalName) {
  switch (AnimalName.toLowerCase()) {
    case 'apple':
      return "Apple is a delicious fruit that comes in various colors like red and green. it's also the name of a famous company that makes iPhones, iPads, and Mac computers.";
    case 'banana':
      return "Bananas are yellow fruits that grow on large plants. They are a tasty and healthy snack, rich in potassium, which helps keep our hearts and muscles strong.";
    case 'watermelon':
      return "Watermelon is a juicy fruit that's 92% water, perfect for staying hydrated. Its vibrant red color comes from a powerful antioxidant, making it a tasty and healthy treat!";
    case 'pomegranate':
      return "Pomegranates are juicy fruits with red seeds inside. They're not only tasty but also packed with vitamins and antioxidants, making them a healthy snack";
    case 'cherry':
      return "Cherries are delicious red fruits that grow on trees. They are sweet, juicy, and packed with vitamins, making them a tasty and healthy snack for kids";
    case 'strawberry':
      return "Strawberries are sweet, red berries that grow on plants close to the ground. They are not only delicious but also packed with vitamin C, making them a healthy and tasty snack!";
    case 'chikoo':
      return "Chikoo, also known as sapodilla, is a sweet and juicy fruit with brown, rough skin and soft, brownish flesh. It's a tasty treat packed with vitamins and minerals for growing kids!";
    case 'jamun':
      return "Jamun is a delicious purple fruit known for its sweet and tangy taste. It's rich in vitamins and antioxidants, promoting a healthy and colorful snack for kids.";
    case 'custard apple':
      return "Custard apple is a sweet and creamy fruit with a green, bumpy skin. Kids love its delicious taste and enjoy scooping out the soft, white pulp filled with black seeds.";
    case 'pineapple':
      return "Pineapples are tropical fruits with a spiky, rough exterior and sweet, juicy yellow flesh. They're not only delicious but also packed with vitamins and as a tasty snack!";
    case 'coconut':
      return "Coconuts are large brown fruits that grow on palm trees. They have a tough outer shell, delicious white flesh, and refreshing coconut water inside.";
    case 'papaya':
      return "Papaya is a tropical fruit that's sweet and orange in color. It's packed with vitamins, especially vitamin C, which helps keep us healthy";
    case 'orange':
      return "Oranges are juicy fruits that are a great source of vitamin C, helping to keep you healthy. They have a bright orange color and a sweet taste that kids love";
    case 'grapes':
      return "Grapes are small, juicy fruits that come in various colors like red, green, and purple. They're not only delicious but also packed with vitamins and antioxidants for a healthy snack!";
    case 'guava':
      return "Guava is a tasty tropical fruit with green skin and pink or white flesh. Packed with vitamin C, it helps keep us healthy and boosts our immune system.";
    default:
      return "Guava is a tasty tropical fruit with green skin and pink or white flesh. Packed with vitamin C, it helps keep us healthy and boosts our immune system.";
  }
}

String getInfoM(String AnimalName) {
  switch (AnimalName.toLowerCase()) {
    case 'apple':
      return "सफरचंद हे एक स्वादिष्ट फळ आहे जे लाल आणि हिरव्या अशा विविध रंगात येते. हे iPhones, iPads आणि Mac संगणक बनवणाऱ्या प्रसिद्ध कंपनीचे नाव देखील आहे.";
      case 'banana':
      return "केळी ही पिवळी फळे आहेत जी मोठ्या झाडांवर वाढतात. ते एक चवदार आणि निरोगी स्नॅक आहेत, पोटॅशियम समृद्ध आहेत, जे आपले हृदय आणि स्नायू मजबूत ठेवण्यास मदत करतात.";
    case 'watermelon':
      return "टरबूज हे एक रसाळ फळ आहे जे 92% पाणी आहे, हायड्रेटेड राहण्यासाठी योग्य आहे. त्याचा दोलायमान लाल रंग शक्तिशाली अँटिऑक्सिडंटपासून येतो, ज्यामुळे तो एक चवदार आणि आरोग्यदायी पदार्थ बनतो!";
    case 'pomegranate':
      return "डाळिंब ही रसदार फळे असून आतमध्ये लाल बिया असतात. ते केवळ चवदारच नाहीत तर जीवनसत्त्वे आणि अँटिऑक्सिडंट्सने भरलेले आहेत, ज्यामुळे ते निरोगी नाश्ता बनतात";
    case 'cherry':
      return "चेरी ही स्वादिष्ट लाल फळे आहेत जी झाडांवर उगवतात. ते गोड, रसाळ आणि जीवनसत्त्वांनी भरलेले असतात, ज्यामुळे ते मुलांसाठी एक चवदार आणि निरोगी नाश्ता बनतात";
    case 'strawberry':
      return "स्ट्रॉबेरी हे गोड, लाल बेरी आहेत जे जमिनीच्या जवळ असलेल्या वनस्पतींवर वाढतात. ते केवळ स्वादिष्टच नाहीत तर व्हिटॅमिन सीने देखील भरलेले असतात, ज्यामुळे ते निरोगी आणि चवदार नाश्ता बनतात!";
    case 'chikoo':
      return "चिकू, ज्याला सॅपोडिला असेही म्हणतात, हे तपकिरी, खडबडीत त्वचा आणि मऊ, तपकिरी देह असलेले एक गोड आणि रसाळ फळ आहे. वाढत्या मुलांसाठी जीवनसत्त्वे आणि खनिजांनी युक्त हा एक चवदार पदार्थ आहे!";
    case 'jamun':
      return "जांभूळ हे एक मधुर जांभळे फळ आहे जे त्याच्या गोड आणि तिखट चवीसाठी ओळखले जाते. ते जीवनसत्त्वे आणि अँटिऑक्सिडंट्सने समृद्ध आहे, मुलांसाठी आरोग्यदायी आणि रंगीबेरंगी स्नॅकला प्रोत्साहन देते.";
    case 'custard apple':
      return "कस्टर्ड सफरचंद हे हिरवे, खडबडीत त्वचा असलेले एक गोड आणि मलईदार फळ आहे. लहान मुलांना त्याची स्वादिष्ट चव आवडते आणि काळ्या बियांनी भरलेला मऊ, पांढरा लगदा बाहेर काढण्याचा आनंद घेतो.";
    case 'pineapple':
      return "अननस ही उष्णकटिबंधीय फळे आहेत ज्यात काटेरी, खडबडीत बाह्य आणि गोड, रसाळ पिवळे मांस आहे. ते केवळ स्वादिष्टच नाही तर जीवनसत्त्वांनी भरलेले आणि एक चवदार नाश्ता म्हणून देखील आहेत!";
    case 'coconut':
      return "नारळ ही मोठी तपकिरी फळे आहेत जी पामच्या झाडांवर उगवतात. त्यांचे बाह्य कवच कठीण असते, मधुर पांढरे मांस असते आणि आतमध्ये नारळाचे पाणी ताजेतवाने असते.";
    case 'papaya':
      return "पपई हे एक उष्णकटिबंधीय फळ आहे जे गोड आणि केशरी रंगाचे आहे. त्यात जीवनसत्त्वे, विशेषत: व्हिटॅमिन सी, जे आपल्याला निरोगी ठेवण्यास मदत करते";
    case 'orange':
      return "संत्री ही रसाळ फळे आहेत जी व्हिटॅमिन सीचा एक उत्तम स्रोत आहेत, तुम्हाला निरोगी ठेवण्यास मदत करतात. त्यांचा रंग चमकदार नारिंगी आणि मुलांना आवडतो अशी गोड चव आहे";
    case 'grapes':
      return "द्राक्षे ही लहान, रसाळ फळे आहेत जी लाल, हिरवी आणि जांभळ्या सारख्या विविध रंगात येतात. ते केवळ स्वादिष्टच नाहीत तर निरोगी स्नॅकसाठी जीवनसत्त्वे आणि अँटिऑक्सिडंट्सने भरलेले असतात!";
    case 'guava':
      return "पेरू हे हिरवी त्वचा आणि गुलाबी किंवा पांढरे मांस असलेले एक चवदार उष्णकटिबंधीय फळ आहे. व्हिटॅमिन सीने भरलेले, ते आपल्याला निरोगी ठेवण्यास मदत करते आणि आपली रोगप्रतिकारक शक्ती वाढवते.";
    default:
      return "पेरू हे हिरवी त्वचा आणि गुलाबी किंवा पांढरे मांस असलेले एक चवदार उष्णकटिबंधीय फळ आहे. व्हिटॅमिन सीने भरलेले, ते आपल्याला निरोगी ठेवण्यास मदत करते आणि आपली रोगप्रतिकारक शक्ती वाढवते.";  }
}

// String getString(String AnimalName) {
//   switch (AnimalName.toLowerCase()) {
//     case 'bear':
//       return "B for Bear";
//     case 'buffalo':
//       return "B for Buffalo";
//     case 'camel':
//       return "C for Camel";
//     case 'cat':
//       return "C for Cat";
//     case 'cow':
//       return "C for Cow";
//     case 'deer':
//       return "D for Deer";
//     case 'dog':
//       return "D for Dog";
//     case 'donkey':
//       return "D for Donkey";
//     case 'elephant':
//       return "E for Elephant";
//     case 'fox':
//       return "F for Fox";
//     case 'giraffe':
//       return "G for Giraffe";
//     case 'goat':
//       return "G for Goat";
//     case 'horse':
//       return "H for Horse";
//     case 'kangaroo':
//       return "K for Kangaroo";
//     case 'leopard':
//       return "L for Leopard";
//     case 'lion':
//       return "L for Lion";
//     case 'mongoose':
//       return "M for Mongoose";
//     case 'monkey':
//       return "M for Monkey";
//     case 'pig':
//       return "P for Pig";
//     case 'rhinoceros':
//       return "R for Rhinoceros";
//     case 'sheep':
//       return "S for Sheep";
//     case 'squirrel':
//       return "S for Squirrel";
//     case 'tiger':
//       return "T for Tiger";
//     case 'wolf':
//       return "W for Wolf";
//     case 'yac':
//       return "Y for Yac";
//     case 'zebra':
//       return "Z for Zebra";
//     default:
//       return "Y for Yac";
//   }
// }

// String getInfo(String AnimalName) {
//   switch (AnimalName.toLowerCase()) {
//     case 'bear':
//       return "Bears are big, furry mammals that love to eat fish, "
//           " berries, and honey. They can be brown,"
//           " black, or white, like the polar bear.";
//     case 'buffalo':
//       return "Buffaloes are large, powerful mammals with thick,"
//           " shaggy fur and curved horns. They often live in groups "
//           "called herds and are known for their love of grazing on grass.";
//     case 'camel':
//       return "Camels are desert animals with humps that store water to help "
//           "them survive in hot climates. They have long legs and thick fur to "
//           "protect them from the sun.";
//     case 'cat':
//       return "Cats are furry animals that purr when they're happy. They use their "
//           "whiskers to explore and have sharp claws for climbing and playing.";
//     case 'cow':
//       return "Cows are gentle farm animals that provide milk. "
//           "They have four stomachs and chew cud to help with digestion.";
//     case 'deer':
//       return "Deer are graceful animals with antlers (in males) that live in forests"
//           " and meadows. They eat plants, like grass and leaves, and are known "
//           "for their keen sense of hearing.";
//     case 'dog':
//       return "Dogs are furry, loyal pets that come in various breeds. They love to "
//           "play, be petted, and are known for their friendly and loving nature.";
//     case 'donkey':
//       return "Donkeys are friendly animals known for their long ears and gray or brown fur. "
//           "They are strong and intelligent, often used to carry heavy loads or as loyal "
//           "companions on farms.";
//     case 'elephant':
//       return "Elephants are the largest land animals with big ears and long trunks. They "
//           "are known for their intelligence, social behavior, and love for water.";
//     case 'fox':
//       return "A fox is a clever and adaptable mammal with a bushy tail that uses it for balance."
//           " Foxes are known for their orange or red fur and are skilled hunters in the wild.";
//     case 'giraffe':
//       return "Giraffes are the world's tallest mammals, with long necks and distinctive spotted"
//           " coats. They use their height to reach leaves high in trees and have a unique"
//           " blue-black tongue.";
//     case 'goat':
//       return "Goats are friendly animals that love to eat grass and leaves. "
//           "They have horns, a beard, and make a 'baa' sound";
//     case 'horse':
//       return "Horses are strong and friendly animals that have been helping humans for centuries. "
//           "They come in different colors and sizes, and love to run and play in wide, open spaces.";
//     case 'kangaroo':
//       return "Kangaroos are marsupials from Australia known for hopping on powerful hind legs. "
//           "They carry and nurture their babies, called joeys, in a pouch";
//     case 'leopard':
//       return "Leopards are big cats with golden-yellow fur covered in distinctive black spots"
//           " and rosettes. They are skilled climbers and powerful hunters found in various "
//           "habitats across Africa and Asia.";
//     case 'lion':
//       return "Lions are big cats that live in groups called prides. Known as 'king of the jungle'"
//           " they have a majestic mane and are powerful hunters.";
//     case 'mongoose':
//       return "Mongoose is a small mammal that looks like a mix between a cat and a squirrel. "
//           "Known for its agility, it can stand on its hind legs and has a keen sense "
//           "of smell to find food.";
//     case 'monkey':
//       return "Monkeys are playful mammals with long tails that live in trees. "
//           "They love swinging from branch to branch and enjoy eating fruits and nuts.";
//     case 'pig':
//       return "Pigs are intelligent farm animals that enjoy rolling in mud to stay cool. "
//           "They oink, have a keen sense of smell, and are raised for meat called pork.";
//     case 'rhinoceros':
//       return "Rhinoceroses are large, herbivorous animals with thick skin and one or two"
//           " horns on their noses. They love to wallow in mud to stay cool and protect "
//           "their skin from the sun.";
//     case 'sheep':
//       return "Sheep are fluffy animals known for their wool, which is used to make cozy clothes. "
//           "They say 'baa' and live in groups called flocks";
//     case 'squirrel':
//       return "Squirrels are furry animals with bushy tails that love to climb "
//           "trees and eat nuts. They use their sharp claws to grasp onto branches "
//           "and store food for the winter in hidden spots called 'burrows'";
//     case 'tiger':
//       return "Tigers are big cats with distinctive orange fur and black stripes. "
//           "They are excellent hunters and can roar loudly to communicate with other tigers";
//     case 'wolf':
//       return "Wolves are wild canines known for their teamwork in packs. They have keen senses, "
//           "including sharp hearing and a strong sense of smell.";
//     case 'yac':
//       return "Yaks are furry, high-altitude mammals found in the Himalayas. "
//           "They have long horns, thick coats, and are often used by people "
//           "for transportation and as a source of milk and wool.";
//     case 'zebra':
//       return "Zebras are black and white striped animals that live in Africa. "
//           "They are known for their unique patterns, and their stripes help"
//           " them camouflage and stay safe from predators.";
//     default:
//       return "Yaks are furry, high-altitude mammals found in the Himalayas. "
//           "They have long horns, thick coats, and are often used by people "
//           "for transportation and as a source of milk and wool.";
//   }
// }
//
//
//
