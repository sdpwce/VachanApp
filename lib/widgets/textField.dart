
import 'package:flutter/material.dart';

Container resuableTextField(String text, bool isPasswordType, TextEditingController controller){

     return Container(
       padding: EdgeInsets.fromLTRB(15, 9, 15, 7),
       child: TextField(
          controller: controller,
         obscureText: isPasswordType,
         autocorrect: !isPasswordType,
         cursorColor: Colors.grey,
         
         style: TextStyle(
              color: Colors.grey,),

             decoration: InputDecoration(
               labelText: text,
                labelStyle: TextStyle(color: Colors.blueGrey, fontSize: 18),
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never ,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                ),
           ),
           keyboardType: isPasswordType
           ? TextInputType.visiblePassword
               : TextInputType.emailAddress,
         ),
     );
}