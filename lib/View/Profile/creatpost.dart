import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goofbal/Backend/CreatePost/PostView.dart';
import 'package:goofbal/View/Commedy/comvideoacess.dart';
import 'package:goofbal/View/Profile/Demovideo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:video_player/video_player.dart';

import '../../Backend/CreatePost/playVideo.dart';
import '../../Resources/Toast.dart';
import '../../Utilities/constant/Colors.dart';
import '../../Utilities/constant/Strings.dart';
import '../../Utilities/constant/images.dart';
import '../../main.dart';
import '../Bottom_navigation/BottomNav.dart';
class Createpost extends StatefulWidget {
  const Createpost({Key? key}) : super(key: key);

  @override
  State<Createpost> createState() => _CreatepostState();
}

class _CreatepostState extends State<Createpost> {
  PostView postView=Get.put(PostView());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
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
                          Get.to(HomePage());
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
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      InkWell(
                        onTap: () {
                          if(postView.headline.text.isEmpty){
                            AmeToast.toast("head line is required");
                          }else if(postView.about.text.isEmpty){
                            AmeToast.toast("about  is required");
                          }else if(postView.videourl==null){
                            AmeToast.toast("Vide is required");}else{
                            postView.Setpost();
                          }

                          postView.videourl!=null?
                          print(postView.videourl):print('usama');
                        },
                        child: Text(
                          AppString.Posts,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: AppColors.white_grey,
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
      body: Obx(() => LoadingOverlay(isLoading:postView.videoloading.value, child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                AppString.Headline,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 0.5, color: AppColors.blue)),
                child:TextFormField(
                  controller:postView.headline,
                  decoration:InputDecoration(
                      hintText:"Headline",
                      border:InputBorder.none,
                      hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, color: AppColors.blue),
                      contentPadding:EdgeInsets.only(left:10)
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                AppString.About,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 0.5, color: AppColors.blue)),
                child: TextFormField(
                  controller:postView.about,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: "About",
                      hintStyle:GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, color: AppColors.blue),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            postView.videourl!=null?Container(
                height:200,
                child: CommedyVide(videopath:postView.videourl,)):
            Container(
              height:200,
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(20),
                border:Border.all(width:1,color:Colors.grey)
              ),
              width:MediaQuery.of(context).size.width,
              child:Center(child: Text("you have not any Video yet"))
            ),
              SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // postView.Createpost();
          // postView.videourl!=null?
          // postView.controller!.play();
          Get.to(Createpost());
        },

        backgroundColor: Colors.white,
        child:PickFile(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

