import 'package:flutter/material.dart';
import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/widgets/drop.dart';
import 'package:vachanapp/widgets/numberBox.dart';
import 'package:flutter_tts/flutter_tts.dart';

class NumberDetail extends StatefulWidget{

  @override
  NumberD createState() => NumberD();
}

class NumberD extends State<NumberDetail> with TickerProviderStateMixin{

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
  // animation
  late AnimationController _controller1;late AnimationController _controller2;late Animation<double> _animation1;late Animation<double> _animation2;
  late AnimationController _controller3;late Animation<double> _animation3;late AnimationController _controller4;late Animation<double> _animation4;
  late AnimationController _controller5;late Animation<double> _animation5;late AnimationController _controller6;late Animation<double> _animation6;
  late Animation<double> _animation7;late AnimationController _controller7;late AnimationController _controller8;late Animation<double> _animation8;
  late AnimationController _controller9;late Animation<double> _animation9;late AnimationController _controller10;late Animation<double> _animation10;

  bool _containersVisible = false; bool _containersVisible2 = false; bool _containersVisible3 = false;
  bool _containersVisible4 = false;
  bool _containersVisible5 = false;    bool _containersVisible6 = false;
  bool _containersVisible7 = false;    bool _containersVisible8 = false;
  bool _containersVisible9 = false;    bool _containersVisible10 = false;
  // bool _containersVisible6 = false;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _controller2 = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _controller3 = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );
    _controller4 = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _controller5 = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _controller6 = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );
    _controller7 = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _controller8 = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );
    _controller9 = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );
    _controller10 = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );

    _animation1 = Tween<double>(begin: 0, end: 1).animate(_controller1);
    _animation2 = Tween<double>(begin: 0, end: 1).animate(_controller2);
    _animation3 = Tween<double>(begin: 0, end: 1).animate(_controller3);
    _animation4 = Tween<double>(begin: 0, end: 1).animate(_controller4);
    _animation5 = Tween<double>(begin: 0, end: 1).animate(_controller5);
    _animation6 = Tween<double>(begin: 0, end: 1).animate(_controller6);
    _animation7 = Tween<double>(begin: 0, end: 1).animate(_controller7);
    _animation8 = Tween<double>(begin: 0, end: 1).animate(_controller8);
    _animation9 = Tween<double>(begin: 0, end: 1).animate(_controller9);
    _animation10 = Tween<double>(begin: 0, end: 1).animate(_controller10);

    _controller10.addStatusListener((status) { // need to do 1
      if (status == AnimationStatus.completed) {
        // Animation 2 is complete, you can perform any actions here.
      }
    });
  }

  void _startFallingAnimation() {
    if (_containersVisible) {
      _controller1.reset();
      _controller1.forward();
    }
    if (_containersVisible2) {
      _controller2.reset();
       _controller1.reset();
      _controller2.forward();
      Future.delayed(Duration(milliseconds: 100), () {
        _controller1.forward();
      });
    }
    if (_containersVisible3) {
      _controller2.reset();
      _controller1.reset();
      _controller3.reset();
      _controller2.forward();
      Future.delayed(Duration(milliseconds: 100), () {
        _controller1.forward();

      });
      // _controller3.reset();
      Future.delayed(Duration(milliseconds: 50), () {
        _controller3.forward();
      });
    }
    if (_containersVisible4) {
      _controller2.reset();
      _controller1.reset();
      _controller1.forward();
      _controller3.reset();
      _controller3.forward();
      _controller2.forward();
     Future.delayed(Duration(milliseconds: 400), () {
        _controller4.reset();
        _controller4.forward();

      });}
    if (_containersVisible5) {
      _controller2.reset();
      _controller1.reset();
      _controller1.forward();
      Future.delayed(Duration(milliseconds: 600), () {
        _controller5.reset();
        _controller5.forward();});
      _controller3.reset();
      _controller3.forward();
      _controller2.forward();
      Future.delayed(Duration(milliseconds: 400), () {
        _controller4.reset();
        _controller4.forward();
      });}

    if (_containersVisible6) {
      _controller2.reset();
      _controller1.reset();
      _controller1.forward();
      Future.delayed(Duration(milliseconds: 600), () {
        _controller5.reset();
        _controller5.forward();});
      _controller3.reset();
      _controller3.forward();
      Future.delayed(Duration(milliseconds: 800), () {
        _controller6.reset();
        _controller6.forward();});
      _controller2.forward();
      Future.delayed(Duration(milliseconds: 400), () {
        _controller4.reset();
        _controller4.forward();});}

    if (_containersVisible7) {
      _controller2.reset();
      _controller1.reset();
      _controller1.forward();
      Future.delayed(Duration(milliseconds: 600), () {
        _controller5.reset();
        _controller5.forward();});
      _controller3.reset();
      _controller3.forward();
      Future.delayed(Duration(milliseconds: 800), () {
        _controller6.reset();
        _controller6.forward();});
      _controller2.forward();
      Future.delayed(Duration(milliseconds: 400), () {
        _controller4.reset();
        _controller4.forward();
        Future.delayed(Duration(milliseconds: 600), () {
          _controller7.reset();
          _controller7.forward();});
      });}

    if (_containersVisible8) {
      _controller2.reset();
      _controller1.reset();
      _controller1.forward();
      Future.delayed(Duration(milliseconds: 600), () {
        _controller5.reset();
        _controller5.forward();
        Future.delayed(Duration(milliseconds: 600), () {
          _controller8.reset();
          _controller8.forward();});
      });
      _controller3.reset();
      _controller3.forward();
      Future.delayed(Duration(milliseconds: 800), () {
        _controller6.reset();
        _controller6.forward();});
      _controller2.forward();
      Future.delayed(Duration(milliseconds: 400), () {
        _controller4.reset();
        _controller4.forward();
        Future.delayed(Duration(milliseconds: 600), () {
          _controller7.reset();
          _controller7.forward();});
      });}
    if (_containersVisible9) {
      _controller2.reset();
      _controller1.reset();
      _controller1.forward();
      Future.delayed(Duration(milliseconds: 600), () {
        _controller5.reset();
        _controller5.forward();
        Future.delayed(Duration(milliseconds: 600), () {
          _controller8.reset();
          _controller8.forward();});
      });
      _controller3.reset();
      _controller3.forward();
      Future.delayed(Duration(milliseconds: 800), () {
        _controller6.reset();
        _controller6.forward();
        Future.delayed(Duration(milliseconds: 600), () {
          _controller9.reset();
          _controller9.forward();});
      });
      _controller2.forward();
      Future.delayed(Duration(milliseconds: 400), () {
        _controller4.reset();
        _controller4.forward();
        Future.delayed(Duration(milliseconds: 600), () {
          _controller7.reset();
          _controller7.forward();});
      });}
     //
    if (_containersVisible10) {
      _controller2.reset();
      _controller1.reset();
      _controller1.forward();
      Future.delayed(Duration(milliseconds: 600), () {
        _controller5.reset();
        _controller5.forward();
        Future.delayed(Duration(milliseconds: 600), () {
          _controller8.reset();
          _controller8.forward();});
      });
      _controller3.reset();
      _controller3.forward();
      Future.delayed(Duration(milliseconds: 800), () {
        _controller6.reset();
        _controller6.forward();
        Future.delayed(Duration(milliseconds: 600), () {
          _controller9.reset();
          _controller9.forward();});
      });
      _controller2.forward();
      Future.delayed(Duration(milliseconds: 400), () {
        _controller4.reset();
        _controller4.forward();
        Future.delayed(Duration(milliseconds: 600), () {
          _controller7.reset();
          _controller7.forward();
          Future.delayed(Duration(milliseconds: 600), () {
            _controller10.reset();
            _controller10.forward();});
        }
        );
      });}
  }

  void _showContainers(int n) {
    if(n == 10)
      setState(() {
        _containersVisible10 = true;
        _containersVisible9 = true;
        _containersVisible8 = true;
        _containersVisible7 = true;
        _containersVisible6 = true;
        _containersVisible5 = true;
        _containersVisible4 = true;
        _containersVisible3 = true;
        _containersVisible2 = true;
        _containersVisible = true;
      });
    if(n == 9)
      setState(() {
        _containersVisible10 = false;
        _containersVisible9 = true;
        _containersVisible8 = true;
        _containersVisible7 = true;
        _containersVisible6 = true;
        _containersVisible5 = true;
        _containersVisible4 = true;
        _containersVisible3 = true;
        _containersVisible2 = true;
        _containersVisible = true;
      });
    if(n == 8)
      setState(() {
        _containersVisible10 = false;
        _containersVisible9 = false;
        _containersVisible8 = true;
        _containersVisible7 = true;
        _containersVisible6 = true;
        _containersVisible5 = true;
        _containersVisible4 = true;
        _containersVisible3 = true;
        _containersVisible2 = true;
        _containersVisible = true;
      });
    if(n == 7)
      setState(() {
        _containersVisible10 = false;
        _containersVisible9 = false;
        _containersVisible8 = false;
        _containersVisible7 = true;
        _containersVisible6 = true;
        _containersVisible5 = true;
        _containersVisible4 = true;
        _containersVisible3 = true;
        _containersVisible2 = true;
        _containersVisible = true;
      });
    if(n == 6)
      setState(() {
        _containersVisible10 = false;
        _containersVisible9 = false;
        _containersVisible8 = false;
        _containersVisible7 = false;
        _containersVisible6 = true;
        _containersVisible5 = true;
        _containersVisible4 = true;
        _containersVisible3 = true;
        _containersVisible2 = true;
         _containersVisible = true;
      });
    if(n == 5)
      setState(() {
        _containersVisible10 = false;
        _containersVisible9 = false;
        _containersVisible8 = false;
        _containersVisible7 = false;
        _containersVisible5 = true;
        _containersVisible4 = true;
        _containersVisible3 = true;
        _containersVisible2 = true;
        _containersVisible = true;
       _containersVisible6 = false;
      });
    if(n == 4)
      setState(() {
        _containersVisible10 = false;
        _containersVisible9 = false;
        _containersVisible8 = false;
        _containersVisible7 = false;
        _containersVisible5 = false;
        _containersVisible4 = true;
        _containersVisible3 = true;
        _containersVisible2 = true;
        _containersVisible = true;
       _containersVisible6 = false;
      });
    if(n == 3)
      setState(() {
        _containersVisible10 = false;
        _containersVisible9 = false;
        _containersVisible8 = false;
        _containersVisible7 = false;
        _containersVisible5 = false;
        _containersVisible3 = true;
        _containersVisible4 = false;
        _containersVisible2 = true;
         _containersVisible = true;
        _containersVisible6 = false;
      });
    if(n == 2)
    setState(() {
      _containersVisible10 = false;
      _containersVisible9 = false;
      _containersVisible8 = false;
      _containersVisible7 = false;
      _containersVisible5 = false;
      _containersVisible2 = true;
      _containersVisible = true;
      _containersVisible3 = false;
      _containersVisible4 = false;
      _containersVisible6 = false;
    });
    if(n == 1)
      setState(() {
        _containersVisible10 = false;
        _containersVisible9 = false;
        _containersVisible8 = false;
        _containersVisible7 = false;
        _containersVisible5 = false;
        _containersVisible = true;
        _containersVisible2 = false;
        _containersVisible3 = false;
        _containersVisible4 = false;
        _containersVisible6 = false;
      });

  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _controller7.dispose();
    _controller8.dispose();
    _controller9.dispose();
    _controller10.dispose();
    super.dispose();
  }

  // final double fontSize;
  @override
  Widget build(BuildContext context) {
    var Cwidgth = MediaQuery.of(context).size.width;
    var Cheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:  Appbar(),
      body: Stack(
        children: [
          Image.asset(
            'images/lake.jpg',
            fit: BoxFit.cover, // You can adjust the fit property as needed
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
                children: [
                  Container(
                      child: Row(
                          children: [
                              Container(
                                 width: Cwidgth*0.15,
                                  height: Cheight*0.82,
                              //    color: Colors.red,
                                child: Column(
                                    children: [
                                        Row(
                                          children: [InkWell
                                            ( onTap: (){
                                            speak("1 water drop is falling");
                                            _showContainers(1);
                                            _startFallingAnimation();

                                          //  print(_containersVisible2);

                                          },
                                              child: NumberBox(MidBoxText: "1", flag: true, rl: false,)),],),
                                      SizedBox(height:  Cheight*0.82*0.02,),
                                      Row(children: [InkWell   ( onTap: (){
                                        speak("2 water drops are falling");
                                        _showContainers(2);
                                        _startFallingAnimation();
                                       // print(_containersVisible);

                                      },
                                      child: NumberBox(MidBoxText: "2", flag: true, rl: false,)),],),
                                      SizedBox(height:  Cheight*0.82*0.02,),
                                      Row(children: [InkWell(
                                         onTap: (){
                                           speak("3 water drops are falling");
                                          _showContainers(3);
                                          _startFallingAnimation();
                                        //  print(_containersVisible);

                                        },
                                        child: NumberBox(MidBoxText: "3", flag: true, rl: false,)),],),
                                      SizedBox(height:  Cheight*0.82*0.4,),
                                      Row(children: [InkWell(
                                          onTap: (){
                                            speak("7 water drops are falling");
                                            _showContainers(7);
                                            _startFallingAnimation();
                                            //  print(_containersVisible);

                                          },
                                          child: NumberBox(MidBoxText: "7", flag: false, rl: false,)),],),
                                      SizedBox(height:  Cheight*0.82*0.02,),
                                      Row(children: [InkWell(
                                          onTap: (){
                                            speak("8 water drops are falling");
                                            _showContainers(8);
                                            _startFallingAnimation();
                                            //  print(_containersVisible);

                                          },
                                          child: NumberBox(MidBoxText: "8", flag: false, rl: false,)),],),
                                      SizedBox(height:  Cheight*0.82*0.18,),
                                      Row(children: [NumberBox(MidBoxText: "0", flag: true, rl: false,),],),
                                    ],

                                ),
                              ),
                            Container(
                              width: Cwidgth*0.85,
                              height: Cheight*0.82,
                           //   color: Colors.white,
                              child: Column(
                                  children: [
                                      Container(
                                        height: Cheight*0.82*0.15,
                                      //  color: Colors.teal,
                                        child: Row(
                                             children: [
                                                 Container(
                                                     width: Cwidgth*0.85*0.6,
                                                     child: Column(
                                                       children: [Image.asset('images/weather11.png'),],)),
                                               SizedBox(width:  Cwidgth*0.85*0.05,),
                                               Container(
                                                 width: Cwidgth*0.85*0.35,
                                                   child: Row(
                                                     mainAxisAlignment: MainAxisAlignment.end,
                                                     children: [Image.asset('images/weather22.png'),],)),],
                                        ),),
                                    Container(
                                      height: Cheight*0.82*0.85,

                                      child: Row(
                                             children: [
                                                 Container(
                                                     width: Cwidgth*0.85*0.85,
                                               //    color: Colors.grey,
                                                   child: Column(
                                                        children: <Widget>[
                                                            Row(
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    if (_containersVisible10)
                                                                      AnimatedBuilder(
                                                                        animation: _animation10,
                                                                        builder: (context, child) {
                                                                          return Transform.translate(
                                                                            offset: Offset(0, MediaQuery.of(context).size.height * _animation10.value),
                                                                            child: TenDrop(DropText: "10", four: true,),);},),
                                                                    if (_containersVisible7)
                                                                      AnimatedBuilder(
                                                                        animation: _animation7,
                                                                        builder: (context, child) {
                                                                          return Transform.translate(
                                                                            offset: Offset(0, MediaQuery.of(context).size.height * _animation7.value),
                                                                            child: SmallDrop(DropText: "7", four: false,),);},),
                                                                    if (_containersVisible4)
                                                                      AnimatedBuilder(
                                                                        animation: _animation4,
                                                                        builder: (context, child) {
                                                                          return Transform.translate(
                                                                            offset: Offset(0, MediaQuery.of(context).size.height * _animation4.value),
                                                                            child: SmallDrop(DropText: "4", four: true,),);},),
                                                                    if (_containersVisible2)
                                                                      AnimatedBuilder(
                                                                        animation: _animation2,
                                                                        builder: (context, child) {
                                                                          return Transform.translate(
                                                                            offset: Offset(0, MediaQuery.of(context).size.height * _animation2.value),
                                                                            child: SmallDrop(DropText: "2", four: false,),);},),

                                                                  ]),
                                                               // SizedBox(width: 20),
                                                                Stack(
                                                                  children:[

                                                                    if (_containersVisible8)
                                                                      AnimatedBuilder(
                                                                        animation: _animation8,
                                                                        builder: (context, child) {
                                                                          return Transform.translate(
                                                                            offset: Offset(0, MediaQuery.of(context).size.height * _animation8.value),
                                                                            child: SmallDrop(DropText: "8", four: false,),);},),
                                                                    if (_containersVisible5)
                                                                      AnimatedBuilder(
                                                                        animation: _animation5,
                                                                        builder: (context, child) {
                                                                          return Transform.translate(
                                                                            offset: Offset(0, MediaQuery.of(context).size.height * _animation5.value),
                                                                            child: SmallDrop(DropText: "5", four: false,),);},),
                                                                    if (_containersVisible)
                                                                      AnimatedBuilder(
                                                                        animation: _animation1,
                                                                        builder: (context, child) {
                                                                          return Transform.translate(
                                                                            offset: Offset(0, MediaQuery.of(context).size.height * _animation1.value),
                                                                            child: SmallDrop(DropText: "1", four: false,),);},),

                                                               ] ),
                                                                Stack(
                                                                  children:[

                                                                    if (_containersVisible9)
                                                                      AnimatedBuilder(
                                                                        animation: _animation9,
                                                                        builder: (context, child) {
                                                                          return Transform.translate(
                                                                            offset: Offset(0, MediaQuery.of(context).size.height * _animation9.value),
                                                                            child: SmallDrop(DropText: "9", four: false,),);},),
                                                                    if (_containersVisible6)
                                                                      AnimatedBuilder(
                                                                        animation: _animation6,
                                                                        builder: (context, child) {
                                                                          return Transform.translate(
                                                                            offset: Offset(0, MediaQuery.of(context).size.height * _animation6.value),
                                                                            child: SmallDrop(DropText: "6", four: false,),);},),
                                                                    if (_containersVisible3)
                                                                      AnimatedBuilder(
                                                                        animation: _animation3,
                                                                        builder: (context, child) {
                                                                          return Transform.translate(
                                                                            offset: Offset(0, MediaQuery.of(context).size.height * _animation3.value),
                                                                            child: SmallDrop(DropText: "3", four: false,),);},),

                                                                  ]),
                                                              ],),
                                                                       ] )
                                                 ),
                                               Container(
                                                 width: Cwidgth*0.85*0.15,
                                                // color: Colors.red,
                                                 child: Column(
                                                   children: [
                                                     SizedBox(height:  Cheight*0.82*0.06*0.85,),
                                                 Row(mainAxisAlignment: MainAxisAlignment.end,
                                                   children: [InkWell(
                                                     onTap: (){
                                                       speak("4 water drops are falling");
                                                       _showContainers(4);
                                                       _startFallingAnimation();
                                                       print(_containersVisible);

                                                     },
                                                     child: NumberBox(MidBoxText: "4", flag: true, rl: true,)),],),
                                                     SizedBox(height:  Cheight*0.82*0.02*0.85,),
                                                      Row(  mainAxisAlignment:MainAxisAlignment.end,
                                                        children: [
                                                          InkWell(
                                                              onTap: (){
                                                                speak("5 water drops are falling");
                                                                _showContainers(5);
                                                                _startFallingAnimation();
                                                              //  print(_containersVisible);

                                                              },
                                                              child: NumberBox(MidBoxText: "5", flag: true, rl: true,)),
                                                        ],
                                                      ),

                                                     SizedBox(height:  Cheight*0.82*0.02*0.85,),
                                                     Row(  mainAxisAlignment: MainAxisAlignment.end,
                                                         children: [
                                                         InkWell(
                                                             onTap: (){
                                                               speak("6 water drops are falling");
                                                               _showContainers(6);
                                                               _startFallingAnimation();
                                                               //  print(_containersVisible);

                                                             },

                                                             child: NumberBox(MidBoxText: "6", flag: true, rl: true,)),
                                                       ],
                                                     ),
                                                     SizedBox(height:  Cheight*0.82*0.45*0.85,),
                                                     Row( mainAxisAlignment: MainAxisAlignment.end,
                                                       children:
                                                     [InkWell(
                                                         onTap: (){
                                                           speak("9 water drops are falling");
                                                           _showContainers(9);
                                                           _startFallingAnimation();
                                                           //  print(_containersVisible);

                                                         },
                                                         child: NumberBox(MidBoxText: "9", flag: false, rl: true,)),],),
                                                     SizedBox(height:  Cheight*0.82*0.02*0.85,),
                                                     Row( mainAxisAlignment: MainAxisAlignment.end,
                                                       children: [InkWell(
                                                         onTap: (){
                                                           speak("10 water drops are falling");
                                                           _showContainers(10);
                                                           _startFallingAnimation();
                                                           //  print(_containersVisible);

                                                         },
                                                         child: NumberBox(MidBoxText: "10", flag: false, rl: true,)),],),
                                                   ],
                                                 ),
                                               )],),)],),),],),),
                  Container(
                      height: Cheight*0.18,
                //   color: Colors.indigo,
                    child: Column(
                      children: [
                        SizedBox(height: Cheight*0.18*0.1),
                        Row(
                              children: [
                                SizedBox(width: Cwidgth*0.01),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Padding(
                                   padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                     "More Numbers",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:Cwidgth * 0.06,
                                          fontWeight: FontWeight.bold
                                      ), textAlign: TextAlign.center,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(255, 169, 113, 253),
                                    textStyle: TextStyle(fontSize: Cwidgth * 0.01),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                    // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                                  ),

                                )
                              ],
                          ),
                      ],
                    ),
                                    )
                ]),),],),);}}


// class NumberAni extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FallingContainersWidget(),
//     );
//   }
// }
//

//
// class _FallingContainersWidgetState extends State<FallingContainersWidget> with TickerProviderStateMixin {
//   late AnimationController _controller1;
//   late AnimationController _controller2;
//   late Animation<double> _animation1;
//   late Animation<double> _animation2;
//
//   bool _containersVisible = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller1 = AnimationController(
//       duration: Duration(seconds: 3),
//       vsync: this,
//     );
//     _controller2 = AnimationController(
//       duration: Duration(seconds: 2),
//       vsync: this,
//     );
//
//     _animation1 = Tween<double>(begin: 0, end: 1).animate(_controller1);
//     _animation2 = Tween<double>(begin: 0, end: 1).animate(_controller2);
//
//     _controller2.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         // Animation 2 is complete, you can perform any actions here.
//       }
//     });
//   }
//
//   void _startFallingAnimation() {
//     if (_containersVisible) {
//       _controller1.reset();
//       _controller2.reset();
//       _controller1.forward();
//       Future.delayed(Duration(milliseconds: 100), () {
//         _controller2.forward();
//       });
//     }
//   }
//
//   void _showContainers() {
//     setState(() {
//       _containersVisible = true;
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller1.dispose();
//     _controller2.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Animation Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (_containersVisible)
//               Row(
//                 children: [
//                   AnimatedBuilder(
//                     animation: _animation1,
//                     builder: (context, child) {
//                       return Transform.translate(
//                         offset: Offset(0, MediaQuery.of(context).size.height * _animation1.value),
//                         child: Container(
//                           width: 100,
//                           height: 100,
//                           color: Colors.blue,
//                         ),
//                       );
//                     },
//                   ),
//                   SizedBox(width: 20),
//                   AnimatedBuilder(
//                     animation: _animation2,
//                     builder: (context, child) {
//                       return Transform.translate(
//                         offset: Offset(0, MediaQuery.of(context).size.height * _animation2.value),
//                         child: Container(
//                           width: 100,
//                           height: 100,
//                           color: Colors.red,
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             SizedBox(height: 20),
//             TextButton(
//               onPressed: () {
//                 _showContainers();
//                 _startFallingAnimation();
//               },
//               child: Text('Start Falling'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
