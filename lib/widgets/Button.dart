import 'package:flutter/material.dart';

class Button extends StatelessWidget implements PreferredSizeWidget {

  const Button(
      {Key? key,
        required this.ButtonText,
        required this.onTap,
      //  required this.fontSize,
      })
      : super(key: key);

  final String ButtonText;
  final Function? onTap;
 // final double fontSize;

  Widget build(BuildContext context) {
    var Cwidgth = MediaQuery.of(context).size.height*0.38;

    return ElevatedButton(
      onPressed: () {
        onTap!();
      },
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Text(
          ButtonText,
          style: TextStyle(
              color: Colors.white,
              fontSize:Cwidgth * 0.08,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 248, 134, 187),
        textStyle: TextStyle(fontSize: Cwidgth * 0.08),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
       // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      ),

    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(60.0);

// @override
// // TODO: implement preferredSize
// Size get preferredSize => throw UnimplementedError();

}