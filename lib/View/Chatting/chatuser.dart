import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utilities/constant/Colors.dart';
import '../../Utilities/constant/Strings.dart';
import '../../Utilities/constant/images.dart';
import '../Profile/Publicprofiile.dart';
import 'ChatInbox.dart';

class Chattinguser extends StatefulWidget {
  const Chattinguser({Key? key}) : super(key: key);

  @override
  State<Chattinguser> createState() => _ChattinguserState();
}

class _ChattinguserState extends State<Chattinguser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                height: 100,
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
                        width: 150,
                      ),
                      Text(
                        AppString.Chats,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.white_grey),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin:EdgeInsets.only(left:10,right:10,top:16),
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
                    child: Image.asset(Images.search),
                  ),
                )),
              ),
            ],
          )),
      body: ListView.builder(
        padding:EdgeInsets.only(left:10,),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.to(ChatInbox());
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.white_grey,
                  child: Icon(Icons.person),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.only(bottom:10),
                  // height:MediaQuery.of(context).size.height/18,
                  width: MediaQuery.of(context).size.width / 1.5,
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
                SizedBox(width:5,),
                Column(
                  children: [
                    Text("08:43",style:GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize:14,color:Color(0xff83B9C9)),),
                    Container(
                        height: 20,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.blue),
                        child: Center(
                            child: Text(
                          "1",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontSize: 12),
                        ))),

                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
