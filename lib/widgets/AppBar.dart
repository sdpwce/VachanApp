import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vachanapp/Screens/ProfilePage.dart';
class Appbar extends StatelessWidget implements PreferredSizeWidget {

  const Appbar(
      {Key? key, required this.apptext,
      })
      : super(key: key);
  final String apptext;
  Widget build(BuildContext context) {
    var Cwidgth = MediaQuery.of(context).size.height*0.38;
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: Checkbox.width*1.3, top: Checkbox.width*0.8),
        child: Text(apptext,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontSize: Cwidgth*0.12,
            letterSpacing: 2,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'menu',
          onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage()));},
        ),
      ],
      backgroundColor: Color.fromARGB(255, 23, 120, 128),
      centerTitle: false,

    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(65.0);

// @override
// // TODO: implement preferredSize
// Size get preferredSize => throw UnimplementedError();

}