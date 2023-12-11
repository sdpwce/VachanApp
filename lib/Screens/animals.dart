import 'package:flutter/material.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:async';

import '../widgets/Button.dart';



class Animals extends StatefulWidget {
  const Animals({Key? key,
    required this.lang,
    //  required this.fontSize,
  })
      : super(key: key);
  final bool lang;
  @override
  _ColorListState createState() => _ColorListState(lang: lang);
}

class _ColorListState extends State<Animals> {
  _ColorListState( {Key? key,
    required this.lang,
  });

  final bool lang;

  final List<String> AnimalsNames = ['Bear', 'Buffalo', 'Camel', 'Cat', 'Cow', 'Deer', 'Dog', 'Donkey', 'Elephant', 'Fox',  'Giraffe', 'Goat', 'Horse', 'Kangaroo', 'Leopard', 'Lion', 'Mongoose', 'Monkey', 'Pig', 'Rhinoceros', 'Sheep', 'Squirrel', 'Tiger', 'Wolf', 'Yac', 'Zebra'];

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
  bool isReading = false;

  @override
  void initState() {
    super.initState();
    _words = "";
    initSpeech();
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

    if (_wordsSpoken.toLowerCase() == AnimalsNames[currentIndex].toLowerCase()) {
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
    });

    Timer(Duration(seconds: 3), () {
      setState(() {
        resultText = '';
        resultColor = Colors.black;
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
            if (_pageController.page! < AnimalsNames.length - 1) {
              _pageController.nextPage(duration: Duration(milliseconds: 10), curve: Curves.easeInOut);
            }
          }
        },
        child: Container(
          child: PageView.builder(
            controller: _pageController,
            itemCount: AnimalsNames.length,
            itemBuilder: (context, index) {
              return Stack(
                children:[
                  Image.asset(
                    'images/back5.png',
                    fit: BoxFit.cover, // You can adjust the fit property as needed
                    width: double.infinity,
                    height: double.infinity,
                  ),
                //  color: getColorByName(AnimalsNames[index]),
                //     height: MediaQuery.of(context).size.height,
                //      width: MediaQuery.of(context).size.width,
                  Container(
                        height: MediaQuery.of(context).size.height,
                         width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                          SizedBox(height: cheight*0.03,),

                        Container(  height: cheight*0.33, width: cwidth*0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38, // Shadow color
                                offset: Offset(0, 2), // Offset of the shadow
                                blurRadius: 4.0, // Spread of the shadow
                              ),
                            ],
                             color: Color.fromARGB(255, 200, 160, 255)),
                          child: Column(
                            children: [
                              SizedBox(height:  cheight*0.4 * 0.08 ,),
                              InkWell(
                                onTap: (){
                                    speak(lang?AnimalsNames[index]:getName(AnimalsNames[index]));
                                },
                                child: Container(
                                    height: cheight*0.4*0.5,
                                    width: cwidth*0.75*0.8,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius to control the curve.
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38, // Shadow color
                                          offset: Offset(0, 2), // Offset of the shadow
                                          blurRadius: 4.0, // Spread of the shadow
                                        ),
                                      ],
                                      color: Colors.white,),
                                    child: Image.asset(getImage(AnimalsNames[index]))),
                              ),
                              SizedBox(height:  cheight*0.4 * 0.05 ,),
                              InkWell(
                                onTap: (){
                                  speak(lang?AnimalsNames[index]: getName(AnimalsNames[index]));
                                },
                                child: Container(
                                  child: Text(lang?AnimalsNames[index]: getName(AnimalsNames[index]), style: GoogleFonts.lacquer(
                                    fontSize: cwidth*0.09,
                                    fontWeight: FontWeight.bold,
                                    //   color: Color.fromARGB(255, 23, 120, 128),
                                  ),textAlign: TextAlign.center, ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: cheight*0.02,),
                        Container(
                          height: cheight*0.2,
                          width: cwidth*0.8,
                         // color: Colors.pink,
                          child: Column(
                              children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(height: cheight*0.3*0.5,
                                    //color: Colors.white,
                                       child: Text(lang?getInfo(AnimalsNames[index]):getInfoM(AnimalsNames[index]), ////////////===================
              style: TextStyle(fontSize: lang?cwidth*0.055:cwidth*0.048),textAlign: TextAlign.center,)
                                     ,),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                         child: Row(
                                             mainAxisAlignment: MainAxisAlignment.end,
                                           children: [
                                             Column(
                                               children: [
                                                 Button(ButtonText: lang?"Stop Listen":"ऐकणे थांबवा", onTap: _stopReading),
                                               ],
                                             ),
                                             SizedBox(width: cwidth*0.01,),
                                             Column(
                                               children: [
                                                 Button(ButtonText: lang?"Listen":"ऐका", onTap:(){speak(lang?getInfo(AnimalsNames[index]):getInfoM(AnimalsNames[index]));}),
                                               ],
                                             ),
                                             SizedBox(width: cwidth*0.8*0.1,),
                                           ],
                                         ),
                                      )),
                              ],
                          ),
                        ),
                        // SizedBox(height: cheight*0.005,),
                        InkWell(
                          onTap: (){
                            speak(lang?AnimalsNames[index]:getName(AnimalsNames[index]));
                          },
                          child: Text(lang?AnimalsNames[index]:getName(AnimalsNames[index]),
                                    style: TextStyle(fontSize: cwidth*0.06, fontWeight: FontWeight.bold),),
                        ),
                    //    SizedBox(height: cheight*0.01,),
                        Container(
                          padding: EdgeInsets.all(16),
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
      case 'bear':
        return "images/bear.jpg";
      case 'buffalo':
        return "images/buffalo.jpg";
      case 'camel':
        return "images/camel.jpg";
      case 'cat':
        return "images/cat2.jpg";
      case 'cow':
        return "images/cow.jpg";
      case 'deer':
        return "images/deer.jpg";
      case 'dog':
        return "images/dog2.jpg";
      case 'donkey':
        return "images/donkey.jpg";
      case 'elephant':
        return "images/elephant2.jpg";
      case 'fox':
        return "images/fox.jpg";
      case 'giraffe':
        return "images/Giraffe.jpg";
      case 'goat':
        return "images/goat.jpg";
      case 'horse':
        return "images/horse2.jpg";
      case 'kangaroo':
        return "images/kangaroo.jpg";
      case 'leopard':
        return "images/leopard.jpg";
      case 'lion':
        return "images/lion.jpg";
      case 'mongoose':
        return "images/mongoose.jpg";
      case 'monkey':
        return "images/monkey.jpg";
      case 'pig':
        return "images/pig.jpg";
      case 'rhinoceros':
        return "images/Rhinoceros.jpg";
      case 'sheep':
        return "images/sheep.jpg";
      case 'squirrel':
        return "images/squirrel.jpg";
      case 'tiger':
        return "images/tiger.jpg";
      case 'wolf':
        return "images/wolf.jpg";
      case 'yac':
        return "images/yac2.jpg";
      case 'zebra':
        return "images/zebra2.jpg";
      default:
        return "images/'yac2.jpg";
    }
  }

String getString(String AnimalName) {
  switch (AnimalName.toLowerCase()) {
    case 'bear':
      return "B for Bear";
    case 'buffalo':
      return "B for Buffalo";
    case 'camel':
      return "C for Camel";
    case 'cat':
      return "C for Cat";
    case 'cow':
      return "C for Cow";
    case 'deer':
      return "D for Deer";
    case 'dog':
      return "D for Dog";
    case 'donkey':
      return "D for Donkey";
    case 'elephant':
      return "E for Elephant";
    case 'fox':
      return "F for Fox";
    case 'giraffe':
      return "G for Giraffe";
    case 'goat':
      return "G for Goat";
    case 'horse':
      return "H for Horse";
    case 'kangaroo':
      return "K for Kangaroo";
    case 'leopard':
      return "L for Leopard";
    case 'lion':
      return "L for Lion";
    case 'mongoose':
      return "M for Mongoose";
    case 'monkey':
      return "M for Monkey";
    case 'pig':
      return "P for Pig";
    case 'rhinoceros':
      return "R for Rhinoceros";
    case 'sheep':
      return "S for Sheep";
    case 'squirrel':
      return "S for Squirrel";
    case 'tiger':
      return "T for Tiger";
    case 'wolf':
      return "W for Wolf";
    case 'yac':
      return "Y for Yac";
    case 'zebra':
      return "Z for Zebra";
    default:
      return "Y for Yac";
  }
}

String getName(String AnimalName) {
  switch (AnimalName.toLowerCase()) {
    case 'bear':
      return "अस्वल";
    case 'buffalo':
      return "म्हैस";
    case 'camel':
      return "उंट";
    case 'cat':
      return "मांजर";
    case 'cow':
      return "गाय";
    case 'deer':
      return "हरिण";
    case 'dog':
      return "कुत्रा";
    case 'donkey':
      return "गाढव";
    case 'elephant':
      return "हत्ती";
    case 'fox':
      return "कोल्हा,";
    case 'giraffe':
      return "जिराफ";
    case 'goat':
      return "बकरी";
    case 'horse':
      return "घोडा";
    case 'kangaroo':
      return "कांगारू";
    case 'leopard':
      return "चित्ता";
    case 'lion':
      return "सिंह";
    case 'mongoose':
      return "मुंगूस";
    case 'monkey':
      return "माकड";
    case 'pig':
      return "डुक्कर,";
    case 'rhinoceros':
      return "गेंडा";
    case 'sheep':
      return "मेंढी";
    case 'squirrel':
      return "गिलहरी,";
    case 'tiger':
      return "वाघ";
    case 'wolf':
      return "लांडगा";
    case 'yac':
      return "यॅक";
    case 'zebra':
      return "झेब्रा";
    default:
      return "यॅक";
  }
}


String getInfo(String AnimalName) {
  switch (AnimalName.toLowerCase()) {
    case 'bear':
      return "Bears are big, furry mammals that love to eat fish, "
          " berries, and honey. They can be brown,"
          " black, or white, like the polar bear.";
    case 'buffalo':
      return "Buffaloes are large, powerful mammals with thick,"
          " shaggy fur and curved horns. They often live in groups "
          "called herds and are known for their love of grazing on grass.";
    case 'camel':
      return "Camels are desert animals with humps that store water to help "
          "them survive in hot climates. They have long legs and thick fur to "
          "protect them from the sun.";
    case 'cat':
      return "Cats are furry animals that purr when they're happy. They use their "
          "whiskers to explore and have sharp claws for climbing and playing.";
    case 'cow':
      return "Cows are gentle farm animals that provide milk. "
          "They have four stomachs and chew cud to help with digestion.";
    case 'deer':
      return "Deer are graceful animals with antlers (in males) that live in forests"
          " and meadows. They eat plants, like grass and leaves, and are known "
          "for their keen sense of hearing.";
    case 'dog':
      return "Dogs are furry, loyal pets that come in various breeds. They love to "
          "play, be petted, and are known for their friendly and loving nature.";
    case 'donkey':
      return "Donkeys are friendly animals known for their long ears and gray or brown fur. "
          "They are strong and intelligent, often used to carry heavy loads or as loyal "
          "companions on farms.";
    case 'elephant':
      return "Elephants are the largest land animals with big ears and long trunks. They "
          "are known for their intelligence, social behavior, and love for water.";
    case 'fox':
      return "A fox is a clever and adaptable mammal with a bushy tail that uses it for balance."
          " Foxes are known for their orange or red fur and are skilled hunters in the wild.";
    case 'giraffe':
      return "Giraffes are the world's tallest mammals, with long necks and distinctive spotted"
          " coats. They use their height to reach leaves high in trees and have a unique"
          " blue-black tongue.";
    case 'goat':
      return "Goats are friendly animals that love to eat grass and leaves. "
          "They have horns, a beard, and make a 'baa' sound";
    case 'horse':
      return "Horses are strong and friendly animals that have been helping humans for centuries. "
          "They come in different colors and sizes, and love to run and play in wide, open spaces.";
    case 'kangaroo':
      return "Kangaroos are marsupials from Australia known for hopping on powerful hind legs. "
          "They carry and nurture their babies, called joeys, in a pouch";
    case 'leopard':
      return "Leopards are big cats with golden-yellow fur covered in distinctive black spots"
          " and rosettes. They are skilled climbers and powerful hunters found in various "
          "habitats across Africa and Asia.";
    case 'lion':
      return "Lions are big cats that live in groups called prides. Known as 'king of the jungle'"
          " they have a majestic mane and are powerful hunters.";
    case 'mongoose':
      return "Mongoose is a small mammal that looks like a mix between a cat and a squirrel. "
          "Known for its agility, it can stand on its hind legs and has a keen sense "
          "of smell to find food.";
    case 'monkey':
      return "Monkeys are playful mammals with long tails that live in trees. "
          "They love swinging from branch to branch and enjoy eating fruits and nuts.";
    case 'pig':
      return "Pigs are intelligent farm animals that enjoy rolling in mud to stay cool. "
          "They oink, have a keen sense of smell, and are raised for meat called pork.";
    case 'rhinoceros':
      return "Rhinoceroses are large, herbivorous animals with thick skin and one or two"
          " horns on their noses. They love to wallow in mud to stay cool and protect "
          "their skin from the sun.";
    case 'sheep':
      return "Sheep are fluffy animals known for their wool, which is used to make cozy clothes. "
          "They say 'baa' and live in groups called flocks";
    case 'squirrel':
      return "Squirrels are furry animals with bushy tails that love to climb "
          "trees and eat nuts. They use their sharp claws to grasp onto branches "
          "and store food for the winter in hidden spots called 'burrows'";
    case 'tiger':
      return "Tigers are big cats with distinctive orange fur and black stripes. "
          "They are excellent hunters and can roar loudly to communicate with other tigers";
    case 'wolf':
      return "Wolves are wild canines known for their teamwork in packs. They have keen senses, "
          "including sharp hearing and a strong sense of smell.";
    case 'yac':
      return "Yaks are furry, high-altitude mammals found in the Himalayas. "
          "They have long horns, thick coats, and are often used by people "
          "for transportation and as a source of milk and wool.";
    case 'zebra':
      return "Zebras are black and white striped animals that live in Africa. "
          "They are known for their unique patterns, and their stripes help"
          " them camouflage and stay safe from predators.";
    default:
      return "Yaks are furry, high-altitude mammals found in the Himalayas. "
          "They have long horns, thick coats, and are often used by people "
          "for transportation and as a source of milk and wool.";
  }
}

String getInfoM(String AnimalName) {
  switch (AnimalName.toLowerCase()) {
    case 'bear':
      return "अस्वल हे मोठे, केसाळ सस्तन प्राणी आहेत ज्यांना मासे, बेरी आणि मध खायला आवडतात. ते ध्रुवीय अस्वलासारखे काळे किंवा पांढरे असू शकतात.";
    case 'buffalo':
      return  "म्हशी जाड, शेगडी फर आणि वक्र शिंगे असलेले मोठे, शक्तिशाली सस्तन प्राणी आहेत. ते सहसा कळप नावाच्या गटात राहतात आणि गवतावर चरण्याच्या त्यांच्या प्रेमासाठी ओळखले जातात.";
    case 'camel':
      return "उंट हे कुबड्या असलेले वाळवंटी प्राणी आहेत जे त्यांना उष्ण हवामानात टिकून राहण्यासाठी पाणी साठवून ठेवतात. त्यांचे पाय लांब आणि जाड फर असतात "
          "त्यांना सूर्यापासून वाचवा.";
    case 'cat':
      return  "मांजरी हे केसाळ प्राणी आहेत जे जेव्हा आनंदी असतात तेव्हा ते कुरकुरतात. ते अन्वेषण करण्यासाठी त्यांच्या व्हिस्कर्सचा वापर करतात आणि चढण्यासाठी आणि खेळण्यासाठी तीक्ष्ण पंजे असतात.";
    case 'cow':
      return "गायी हे दूध देणारे सौम्य शेतातील प्राणी आहेत. त्यांना चार पोटे असतात आणि पचनास मदत करण्यासाठी त्यांना चघळतात.";
    case 'dog':
      return "कुत्रे हे केसाळ, निष्ठावान पाळीव प्राणी आहेत जे विविध जातींमध्ये आढळतात. त्यांना खेळायला आवडते, पाळणे आवडते आणि ते त्यांच्या मैत्रीपूर्ण आणि प्रेमळ स्वभावासाठी ओळखले जातात.";
    case 'deer':
      return "हरीण हे सुंदर प्राणी आहेत ज्यात शिंग (पुरुषांमध्ये) आहेत जे जंगलात आणि कुरणात राहतात. ते गवत आणि पानांसारख्या वनस्पती खातात आणि त्यांच्या तीव्र श्रवणशक्तीसाठी ओळखले जातात.";

    case 'donkey':
      return "गाढवे हे त्यांच्या लांब कानांसाठी आणि राखाडी किंवा तपकिरी फरसाठी ओळखले जाणारे अनुकूल प्राणी आहेत. ते मजबूत आणि हुशार आहेत, बहुतेकदा जड ओझे वाहून नेण्यासाठी किंवा शेतात एकनिष्ठ साथीदार म्हणून वापरले जातात.";
    case 'elephant':
      return "हत्ती हे मोठे कान आणि लांब सोंडे असलेले सर्वात मोठे जमीनी प्राणी आहेत. ते त्यांच्या बुद्धिमत्तेसाठी, सामाजिक वर्तनासाठी आणि पाण्यावरील प्रेमासाठी ओळखले जातात.";
    case 'fox':
      return "कोल्हा हा एक हुशार आणि जुळवून घेणारा सस्तन प्राणी आहे ज्यामध्ये झुडूप असलेली शेपटी असते जी ती शिल्लक ठेवण्यासाठी वापरते. कोल्हे त्यांच्या केशरी किंवा लाल फरसाठी ओळखले जातात आणि जंगलात कुशल शिकारी आहेत.";
    case 'giraffe':
      return "जिराफ हे जगातील सर्वात उंच सस्तन प्राणी आहेत, त्यांच्याकडे लांब माने आणि विशिष्ट ठिपके असलेले कोट आहेत. ते त्यांच्या उंचीचा वापर झाडांच्या उंच पानांपर्यंत पोहोचण्यासाठी करतात आणि त्यांची निळी-काळी जीभ आहे.";
    case 'goat':
      return "शेळ्या हे अनुकूल प्राणी आहेत ज्यांना गवत आणि पाने खायला आवडतात. त्यांना शिंगे आहेत, दाढी आहे आणि ते 'बा' आवाज करतात";
    case 'horse':
      return "घोडे हे मजबूत आणि मैत्रीपूर्ण प्राणी आहेत जे शतकानुशतके मानवांना मदत करत आहेत. ते वेगवेगळ्या रंगात आणि आकारात येतात आणि त्यांना रुंद, मोकळ्या जागेत धावणे आणि खेळणे आवडते.";
    case 'kangaroo':
      return "कांगारू हे ऑस्ट्रेलियातील मार्सुपियल आहेत जे शक्तिशाली मागच्या पायांवर उडी मारण्यासाठी ओळखले जातात. ते त्यांच्या बाळांना जोयस म्हणतात, एका थैलीत घेऊन जातात आणि त्यांचे पालनपोषण करतात";
    case 'leopard':
      return "बिबट्या हे मोठ्या मांजरी आहेत ज्यात सोनेरी-पिवळ्या फर विशिष्ट काळ्या डाग आणि रोझेट्सने झाकलेले असतात. ते कुशल गिर्यारोहक आणि आफ्रिका आणि आशियातील विविध अधिवासांमध्ये आढळणारे शक्तिशाली शिकारी आहेत.";
    case 'lion':
      return "सिंह ही मोठी मांजरी आहेत जी प्राइड्स नावाच्या गटांमध्ये राहतात. 'जंगलाचा राजा' म्हणून ओळखले जाते त्यांच्याकडे भव्य माने आहेत आणि ते शक्तिशाली शिकारी आहेत.";
    case 'mongoose':
      return "मुंगूस हा एक लहान सस्तन प्राणी आहे जो मांजर आणि गिलहरी यांच्यातील मिश्रणासारखा दिसतो. त्याच्या चपळतेसाठी ओळखला जातो, तो त्याच्या मागच्या पायांवर उभा राहू शकतो आणि त्याला अन्न शोधण्यासाठी गंधाची तीव्र भावना असते.";
    case 'monkey':
      return "वानर हे लांब शेपट्या असलेले खेळकर सस्तन प्राणी आहेत जे झाडांमध्ये राहतात. त्यांना एका फांदीवरून दुसऱ्या फांदीवर डोलायला आवडते आणि फळे आणि काजू खाणे आवडते.";
    case 'pig':
      return "डुकरे हे हुशार शेतातील प्राणी आहेत जे थंड राहण्यासाठी चिखलात लोळण्याचा आनंद घेतात. त्यांना सुगंधित, वासाची तीव्र जाणीव असते आणि त्यांना डुकराचे मांस म्हणतात.";
    case 'rhinoceros':
      return "गेंडे हे मोठे, तृणभक्षी प्राणी आहेत ज्यांची त्वचा जाड असते आणि त्यांच्या नाकावर एक किंवा दोन शिंगे असतात. त्यांना थंड राहण्यासाठी आणि त्यांच्या त्वचेचे सूर्यापासून संरक्षण करण्यासाठी चिखलात लोळणे आवडते.";
    case 'sheep':
      return "मेंढ्या त्यांच्या लोकरीसाठी ओळखल्या जाणार्‍या फ्लफी प्राणी आहेत, ज्याचा वापर आरामदायक कपडे बनवण्यासाठी केला जातो. ते 'बा' म्हणतात आणि कळप नावाच्या गटात राहतात";
    case 'squirrel':
      return "गिलहरी हे झुडूपयुक्त शेपटी असलेले केसाळ प्राणी आहेत ज्यांना झाडांवर चढणे आणि काजू खाणे आवडते. ते त्यांच्या तीक्ष्ण पंजेचा वापर करून फांद्या पकडतात आणि हिवाळ्यासाठी अन्न 'बुरो' नावाच्या लपलेल्या ठिकाणी साठवतात";
    case 'tiger':
      return "वाघ हे विशिष्ट केशरी फर आणि काळ्या पट्ट्यांसह मोठ्या मांजरी आहेत. ते उत्कृष्ट शिकारी आहेत आणि इतर वाघांशी संवाद साधण्यासाठी मोठ्याने गर्जना करू शकतात";
    case 'wolf':
      return "लांडगे हे जंगली कुत्री आहेत जे त्यांच्या पॅकमध्ये टीमवर्कसाठी ओळखले जातात. त्यांना तीव्र संवेदना असतात, ज्यात तीक्ष्ण ऐकणे आणि वासाची तीव्र भावना असते.";
    case 'yac':
      return "याक हे हिमालयात आढळणारे केसाळ, उच्च-उंचीचे सस्तन प्राणी आहेत. त्यांना लांब शिंगे, जाड अंगरखे आहेत आणि बहुतेकदा लोक वाहतुकीसाठी आणि दूध आणि लोकरचा स्रोत म्हणून वापरतात.";
    case 'zebra':
      return "झेब्रा हे काळे आणि पांढरे पट्टे असलेले प्राणी आहेत जे आफ्रिकेत राहतात. ते त्यांच्या अनोख्या नमुन्यांसाठी ओळखले जातात आणि त्यांच्या पट्ट्या त्यांना छद्म करण्यात आणि भक्षकांपासून सुरक्षित राहण्यास मदत करतात.";
    default:
      return "याक हे हिमालयात आढळणारे केसाळ, उच्च-उंचीचे सस्तन प्राणी आहेत. त्यांना लांब शिंगे, जाड अंगरखे आहेत आणि बहुतेकदा लोक वाहतुकीसाठी आणि दूध आणि लोकरचा स्रोत म्हणून वापरतात.";
  }
}



