import 'package:flutter/material.dart';
import  'package:vachanapp/Screens/SignIn.dart';
import  'package:vachanapp/Screens/SignUp.dart';


class AuthPage extends StatefulWidget{
  const AuthPage({Key? key}):super(key: key);
  @override
  State<AuthPage> createState() => _AuthPageState();
}
class _AuthPageState extends State<AuthPage>{
  bool showLoginPage = true;
  void toggleScreen(){
    setState(() {
      showLoginPage = ! showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context){
    if(showLoginPage){
      return SignInScreen(showRegisterPage: toggleScreen);
    }
    else{
      return SignUpScreen(showLoginPage: toggleScreen);
    }
  }
}