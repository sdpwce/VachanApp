import 'package:flutter/material.dart';
import 'package:vachanapp/widgets/textField.dart';
import 'package:vachanapp/widgets/Button.dart';
import 'package:vachanapp/Screens/MainPage.dart';



class SignInScreen extends StatefulWidget{

  final VoidCallback showRegisterPage;
  const SignInScreen({Key? key, required this.showRegisterPage}): super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>{
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  final _finalpasswordController = TextEditingController();
  bool selectedLanguage = false;
  @override
  Widget build(BuildContext context){
    var Cheight = MediaQuery.of(context).size.height*0.48;
    var Cwidgth = MediaQuery.of(context).size.height*0.38;


    return Scaffold(
        backgroundColor: Color.fromARGB(255, 23, 120, 128),
        body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: Cheight*0.4,
                          width: Cwidgth*0.9,
                          child: Image.asset('images/half cloud.png')),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Container(
                  //         height: Cheight*0.3,
                  //         width: Cwidgth*0.4,
                  //         child: Image.asset('images/autumn.png')),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.height*0.1,
                      ),
                      Text("वाचन", style:TextStyle(
                          fontSize: Cwidgth * 0.2,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,

                      ),),
                      Container(
                          height: Cheight*0.3,
                          width: Cwidgth*0.4,
                          child: Image.asset('images/reading-book.png')),
                    ],
                  ),
                  Container(
                    height: Cheight,
                    width: Cwidgth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0), // Adjust the radius to control the curve.
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38, // Shadow color
                          offset: Offset(0, 2), // Offset of the shadow
                          blurRadius: 9.0, // Spread of the shadow
                        ),
                      ],
                      color:  Color.fromARGB(250, 214, 230, 238),
                      //Color.fromARGB(216, 202, 152, 243),

                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.05,
                          ),
                          resuableTextField("email", false, _emailTextController),
                          resuableTextField("password", false, _passwordTextController),
                          // resuableTextField("Confirm Password", false, _finalpasswordController),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Medium", style: TextStyle(
                                  fontSize: Cwidgth * 0.055,
                                  color: Color.fromARGB(255, 169, 113, 253)
                              ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio(
                                    value: false,
                                    groupValue: selectedLanguage,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedLanguage = value!;
                                      });
                                    },
                                  ),
                                  Text('Marathi',style: TextStyle(
                                      fontSize: Cwidgth * 0.055,
                                  ),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio(
                                    value: true,
                                    groupValue: selectedLanguage,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedLanguage = value!;
                                      });
                                    },
                                  ),
                                  Text('English', style: TextStyle(
                                      fontSize: Cwidgth * 0.055,
                                  ),),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.07,
                          ),
                          Button(ButtonText: "LogIn", onTap:(){ navigateToSecondPage(context, selectedLanguage);}),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Not Yet Signed Up?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Cwidgth * 0.06,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.01,
                              ),
                              GestureDetector(
                                  onTap: widget.showRegisterPage,// need to change page
                                  child: Text(" Sign Up",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Cwidgth * 0.06,
                                    ),
                                  )
                              )
                            ],
                          ),

                        ],
                      ),
                    ),

                  ),
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
            )
    );
  }
}

// Function to navigate to the Second Page
void navigateToSecondPage(BuildContext context, bool Slang) {

  var selectedLanguage = Slang;
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MainPage(lang: selectedLanguage = Slang,)),
  );
}