import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utilities/constant/Colors.dart';
import '../../Utilities/constant/Strings.dart';
import '../../Utilities/constant/images.dart';
import '../Chatting/chatuser.dart';

class Publicprofile extends StatefulWidget {
  const Publicprofile({Key? key}) : super(key: key);

  @override
  State<Publicprofile> createState() => _PublicprofileState();
}

class _PublicprofileState extends State<Publicprofile> {
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
                    "",
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
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(left:10,right:10,top:20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.white_grey,
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
                SizedBox(height:5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppString.Walter_Williams,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    InkWell(
                      onTap:(){
                        Get.to(Chattinguser());
                      },
                      child:

                    Image.asset(Images.chat1)),
                    SizedBox(width:25,),
                  ],
                ),
                SizedBox(height:5),

                Text(
                  AppString.Comedian,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greytext),
                ),
                SizedBox(height:20,),
                Padding(
                  padding: const EdgeInsets.only(left:18,right:18),
                  child: Row(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "2022",
                            style: GoogleFonts.poppins(
                                fontSize:20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black),
                          ),
                          Text(
                            AppString.Joined,
                            style: GoogleFonts.poppins(
                                fontSize:14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greytext),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "216",
                            style: GoogleFonts.poppins(
                                fontSize:20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black),
                          ),
                          Text(
                            AppString.Laughters,
                            style: GoogleFonts.poppins(
                                fontSize:14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greytext),
                          )
                        ],
                      ), Column(
                        children: [
                          Text(
                            "203",
                            style: GoogleFonts.poppins(
                                fontSize:20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black),
                          ),
                          Text(
                            AppString.Frowners,
                            style: GoogleFonts.poppins(
                                fontSize:14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greytext),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height:20,),

                Row(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration:BoxDecoration(
                        color:Colors.white,
                        borderRadius:BorderRadius.circular(20),
                        border:Border.all(
                          width:.5,
                          color:AppColors.Brigh_orange
                        )
                      ),
                      height:50,
                      width:MediaQuery.of(context).size.width/2.3,
                      child:Row(
                        crossAxisAlignment:CrossAxisAlignment.center,
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Icon(Icons.insert_emoticon,color:AppColors.Brigh_orange,),
                          SizedBox(width:4,),
                          Text(AppString.Be_a_Frowners,style:GoogleFonts.poppins(fontWeight:FontWeight.w500,color:AppColors.Brigh_orange,fontSize:15),)
                        ],
                      ),
                    ),
                    Container(
                      decoration:BoxDecoration(
                          color:AppColors.Brigh_orange,
                          borderRadius:BorderRadius.circular(20),
                          border:Border.all(
                              width:.5,
                              color:Colors.white
                          )
                      ),
                      height:50,
                      width:MediaQuery.of(context).size.width/2.3,
                      child:Row(
                        crossAxisAlignment:CrossAxisAlignment.center,
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Icon(Icons.emoji_emotions_sharp,color:Colors.white,),
                          SizedBox(width:4,),
                          Text(AppString.Be_a_Laugher,style:GoogleFonts.poppins(fontWeight:FontWeight.w500,color:Colors.white,fontSize:15),)
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height:15,),
                Container(
                  height:400,
                  child: GridView.count(
                    // cacheExtent:220,
                    crossAxisCount: 2,
                    // crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    // shrinkWrap: true,
                    // physics:NeverScrollableScrollPhysics(),
                    children: List.generate(
                      14,
                          (index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Container(
                            height: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: AppColors.cayan,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Here We will display the videos",textAlign:TextAlign.center,),
                                SizedBox(height:30,),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          width: 1, color: AppColors.Brigh_orange)),
                                  height: 40,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Text(
                                      AppString.Challenge,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300,
                                          color: AppColors.Brigh_orange,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
