import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goofbal/Utilities/constant/Colors.dart';

class Bottomnavitems extends StatelessWidget {
  final VoidCallback onpressed;
  final bool ischanged;
  final String image;
  Bottomnavitems(
      {required this.onpressed, required this.ischanged, required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 100,
      width:50,
      decoration: BoxDecoration(
        shape:BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color:AppColors.white_grey,
              offset: const Offset(
                1,
                1,
              ),
              // blurRadius: 10.0,
              // spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color:AppColors.white_grey,
              offset: const Offset(0.0, 0.0),
              // blurRadius: 0.0,
              // spreadRadius: 0.0,
            ), //BoxS
          ]),
      child: InkWell(
          onTap: onpressed,
          child: Image.asset(
            image,
            color: ischanged == true
                ? AppColors.blue
                : AppColors.Brigh_orange,
          )),
    );
  }
}
