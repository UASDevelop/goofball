import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goofbal/Utilities/constant/Colors.dart';
import 'package:goofbal/Utilities/constant/Strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import '../../Utilities/constant/images.dart';
import '../Profile/Publicprofiile.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
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
                    width: 119,
                  ),
                  Text(
                    AppString.Favourites,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.white_grey),
                  )
                ],
              ),
            ),
          )),
      body: ListView.builder(
        padding:EdgeInsets.only(top:10,bottom:20,left:10,right:10),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              InkWell(
                onTap:(){
                  Get.to(Publicprofile());
                },
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.white_grey,
                    ),
                    SizedBox(
                      width:5,
                    ),
                    Container(
                      margin: EdgeInsets.only(top:5),
                      // height:MediaQuery.of(context).size.height/18,
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppString.Audrey_Peck,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blue,
                                fontSize: 16),
                          ),
                          Text(
                            AppString.Em_content,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blue,
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              badges.Badge(
                stackFit:StackFit.loose,
                badgeAnimation:badges.BadgeAnimation.rotation(),
                badgeContent:Image.asset(Images.favourite),
                badgeStyle:badges.BadgeStyle(
                  badgeColor:AppColors.white_grey
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 50,right:20),
                  height: 200,
                  decoration: BoxDecoration(
                      color: AppColors.cayan,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.only(left:70,top:5),
                child: Row(
                  children: [
                    Icon(Icons.emoji_emotions_outlined,color:AppColors.blue,),
                    SizedBox(width:4,),
                    Text("12k",
                      style:GoogleFonts.poppins(fontSize:14,color:AppColors.blue),
                    ),
                    SizedBox(width:20,),

                    Image.asset(Images.chat),
                    SizedBox(width:4,),

                    Text("566",                    style:GoogleFonts.poppins(fontSize:14,color:AppColors.blue),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
      backgroundColor: AppColors.grey,
    );
  }
}
