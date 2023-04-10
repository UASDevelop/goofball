import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goofbal/Utilities/constant/Colors.dart';
import 'package:goofbal/Utilities/constant/Strings.dart';
import 'package:goofbal/View/Laughter/FreeForAll.dart';
import 'package:goofbal/View/Laughter/Livesession.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utilities/constant/images.dart';
import '../Commedy/Commedy.dart';
import 'GetEm.dart';

class Laughter extends StatefulWidget {
  const Laughter({Key? key}) : super(key: key);

  @override
  State<Laughter> createState() => _LaughterState();
}

class _LaughterState extends State<Laughter> {
  List images = [
    Images.freeforall,
    Images.em,
    Images.microphone,
  ];
  List title = [
    "Free For All",
    "Get Em or Roast Em",
    "Live Original Standup",
  ];
  List subtitle = [
    "Be yourself and make people laugh",
    "Roast each other on a live session and make people laugh",
    "Make people laugh with your original comedy",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey,
        body: Stack(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              color: AppColors.blue,
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.Welcome,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white_grey),
                        ),
                        Image.asset(Images.setting),
                      ],
                    ),
                    Text(
                      AppString.Walter_Williams,
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white_grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                          decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 10,
                          top: 15,
                        ),
                        border: InputBorder.none,
                        // fillColor: AppColors.white_grey,
                        // filled: true,
                        hintText: AppString.Ansonia_Chio,
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: Image.asset(Images.location),
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 150, left: 10, right: 10),
                child: ListView.builder(
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap:(){
                        if(index==0){
                          Get.to(CommedyVideo());
                        }else if(index==1){
                          Get.to(GetEm());
                        }else{
                          Get.to(Livesession());
                        }
                      },
                      child:Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 200,
                        decoration: BoxDecoration(
                            color: AppColors.white_grey,
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                          padding: const EdgeInsets.only(left:15,top:50),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Image.asset(images[index]),
                              SizedBox(height:10,),
                              Text(
                                title[index],
                                style: GoogleFonts.poppins(
                                    fontSize:16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black),
                              ),
                              Text(
                                subtitle[index],
                                style: GoogleFonts.poppins(
                                    fontSize:12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greytext),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ))
          ],
        ));
  }
}
