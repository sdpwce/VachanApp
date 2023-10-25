import 'package:flutter/material.dart';
//import 'package:vachanapp/widgets/AppBar.dart';
import 'package:vachanapp/utils/color_utils.dart';
import 'package:vachanapp/widgets/AlphaBox.dart';

class AlphaDetail extends StatelessWidget implements PreferredSizeWidget {

  const AlphaDetail(
      {Key? key,
        required this.AlphaText,
        //  required this.fontSize,
      })
      : super(key: key);

  final String AlphaText;

  // final double fontSize;

  Widget build(BuildContext context) {
    var Cwidgth = MediaQuery.of(context).size.height*0.38;

    return Scaffold(
      //  appBar:  Appbar(AppBarText: "वाचन", flag: false,),
    body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
      gradient: LinearGradient(
      colors: [
      hexStringToColor("FCE5F1"),
      hexStringToColor("FAD2E3"),] , begin: Alignment.topCenter, end: Alignment.bottomCenter
      ),
      ),
    ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(60.0);

// @override
// // TODO: implement preferredSize
// Size get preferredSize => throw UnimplementedError();

}