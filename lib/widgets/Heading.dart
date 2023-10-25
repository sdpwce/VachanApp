import 'package:flutter/material.dart';
import 'package:vachanapp/Screens/read.dart';

class Heading extends StatelessWidget implements PreferredSizeWidget {

  const Heading(
  {Key? key,
  required this.HeadingText,
    required this.Cwidgth,
  })
  : super(key: key);

final String HeadingText;
final double Cwidgth;
Widget build(BuildContext context) {
  var cwidgth = MediaQuery.of(context).size.width*0.45;
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Cwidgth,
        decoration: BoxDecoration(
          color:  Color.fromARGB(194, 231, 197, 255),  // Violet color
          borderRadius: BorderRadius.circular(10.0),  // Border radius to round the corners
          border: Border.all(
            color: const Color.fromARGB(255, 169, 113, 253),  // Border color
            width: 1.0,            // Border width
          ),
        ),
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Center(
               child: Text(
                 HeadingText,
                 style: TextStyle(
                   fontSize:cwidgth * 0.16,
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

