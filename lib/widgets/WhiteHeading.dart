import 'package:flutter/material.dart';

class WhiteHeading extends StatelessWidget implements PreferredSizeWidget {

  const WhiteHeading(
      {Key? key,
        required this.HeadingText,
      })
      : super(key: key);

  final String HeadingText;

// final double fontSize;

  Widget build(BuildContext context) {
    var Cwidgth = MediaQuery.of(context).size.height*0.38;
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child:Container(

        width: MediaQuery.of(context).size.width*0.45,
        decoration: BoxDecoration(
          color:  Color.fromARGB(255, 255, 255, 255),  // Violet color
          borderRadius: BorderRadius.circular(10.0),  // Border radius to round the corners
          border: Border.all(
            color:  Color.fromARGB(255, 192, 191, 197),  // Border color
            width: 1.0, ),),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              HeadingText,
              style: TextStyle(
                fontSize:Cwidgth * 0.08,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 169,
                    113, 253),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

