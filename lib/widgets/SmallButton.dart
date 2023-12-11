import 'package:flutter/material.dart';

class SButton extends StatelessWidget implements PreferredSizeWidget {

  const SButton(
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
    var cwidth = MediaQuery.of(context).size.height*0.5;

    return ElevatedButton(
      onPressed: () {
        onTap!();
      },
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Text(
          "Listen",
          style: TextStyle(
              color: Colors.white,
              fontSize:cwidth * 0.05,
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 248, 134, 187),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
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