import 'package:flutter/material.dart';
class AppBaR extends StatelessWidget implements PreferredSizeWidget {

  const AppBaR(
      {Key? key,
        required this.AppBarText,
      })
      : super(key: key);

  final String AppBarText;


  Widget build(BuildContext context) {
    var fontsize = MediaQuery.of(context).size.height*0.04;
    //var fontsize;
    return AppBar(

      title: Text(

        AppBarText,
        style: TextStyle(

          color: Colors.white,
          fontSize: fontsize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 248, 134, 187),
      //  backgroundColor: const Color.fromARGB(255, 255, 217, 41),
      //backgroundColor: const Color.fromARGB(255, 131, 94, 255),
      centerTitle: true,
      // Color.fromARGB(194, 211, 172, 248),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}