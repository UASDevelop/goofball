import 'dart:math';

import 'package:flutter/material.dart';
import 'package:goofbal/View/Commedy/Commedy.dart';
import 'package:goofbal/View/Favourite/Favourite.dart';
import 'package:goofbal/View/Laughter/Laughter.dart';
import 'package:goofbal/View/Profile/Profile.dart';
import 'package:goofbal/View/auth/login/LoginPage.dart';
import 'package:goofbal/View/auth/signup/signup.dart';
import '../../Utilities/constant/Colors.dart';
import '../../Utilities/constant/images.dart';
import 'Bottom_nav_items.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  List pages = [Laughter(), Commedy(), Favourite(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        // margin: EdgeInsets.all(20),
        height: 90,
        color: AppColors.grey,
        // decoration: BoxDecoration(
        //     borderRadius: const BorderRadius.only(
        //       topLeft: Radius.circular(20),
        //       topRight: Radius.circular(20),
        //       bottomLeft: Radius.circular(20),
        //       bottomRight: Radius.circular(20),
        //     ),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.grey.shade50,
        //         offset: const Offset(
        //           5.0,
        //           5.0,
        //         ),
        //         blurRadius: 10.0,
        //         spreadRadius: 2.0,
        //       ), //BoxShadow
        //       BoxShadow(
        //         color: Colors.white,
        //         offset: const Offset(0.0, 0.0),
        //         blurRadius: 0.0,
        //         spreadRadius: 0.0,
        //       ), //BoxS
        //     ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Bottomnavitems(
              onpressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              ischanged: pageIndex == 0 ? true : false,
              image: Images.laughter,
            ),
            Bottomnavitems(
              onpressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              ischanged: pageIndex == 1 ? true : false,
              image: Images.commedy,
            ),
            Bottomnavitems(
              onpressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              ischanged: pageIndex == 2 ? true : false,
              image: Images.favourite,
            ),
            Bottomnavitems(
              onpressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              ischanged: pageIndex == 3 ? true : false,
              image: Images.profile,
            ),
          ],
        ),
      ),
    );
  }
}
