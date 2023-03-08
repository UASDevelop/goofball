import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utilities/constant/Colors.dart';
import '../../Utilities/constant/Strings.dart';
import '../../Utilities/constant/images.dart';
import 'Availcomponent.dart';

class GetEm extends StatefulWidget {
  const GetEm({Key? key}) : super(key: key);

  @override
  State<GetEm> createState() => _GetEmState();
}

class _GetEmState extends State<GetEm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(59),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5))),
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.white_grey,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    AppString.Get_Em_or_Roast_Em,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.white_grey),
                  )
                ],
              ),
            ),
          )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left:30,right:30),
          child: Column(
            children: [
              SizedBox(
                height: 160,
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: AppColors.white_grey,
                    offset: const Offset(
                      1,
                      1,
                    ),
                    // blurRadius: 10.0,
                    // spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: AppColors.white_grey,
                    offset: const Offset(0.0, 0.0),
                    // blurRadius: 0.0,
                    // spreadRadius: 0.0,
                  ), //BoxS
                ]),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Image.asset(
                      Images.em,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Text(
                "Welcome to Get Em or Roast Em",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.black),
              ),
              SizedBox(height:10,),
              Text(AppString.Em_content,textAlign:TextAlign.center,),
              SizedBox(height:40,),
              InkWell(
                onTap:(){
                  Get.to(AvailComponent());
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.Brigh_orange),
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Center(
                    child: Text(
                      AppString.Available_opponents,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white_grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
