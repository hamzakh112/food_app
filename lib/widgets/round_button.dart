import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class RoundButton extends StatelessWidget {
  String title;
  bool loading;
  final VoidCallback ontap;
   RoundButton({Key? key,
     required this.ontap,
     required this.title,
     this.loading=false,
   }) : super(key: key);
  Color buttoncolor=Color(0xFFBCD438);
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:  buttoncolor,
        ),
        child: Center(child: loading? CircularProgressIndicator(strokeWidth: 3,color: Colors.black):
        Text(title,style: GoogleFonts.aladin(color: Colors.black,fontSize: 25),))
      ),
    );
  }
}
