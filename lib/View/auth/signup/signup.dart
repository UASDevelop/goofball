import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goofbal/Backend/auth/UserView.dart';
import 'package:goofbal/Utilities/constant/Colors.dart';
import 'package:goofbal/Utilities/constant/Strings.dart';
import 'package:goofbal/View/Bottom_navigation/BottomNav.dart';
import 'package:goofbal/View/auth/login/LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../Utilities/constant/images.dart';

class Signup extends GetView<UserModelView> {
  UserModelView userModelView=Get.put(UserModelView());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body:Obx(() => LoadingOverlay(isLoading:userModelView.signuploading.value , child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          color: AppColors.white_grey,
                          width: 0.4,
                        ))),
                child: TextFormField(
                  style:GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:15,color:Colors.white),

                  controller:userModelView.username,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: AppColors.white_grey,
                        fontWeight: FontWeight.w100,
                        fontSize: 14),
                    hintText: AppString.Username,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height:20,),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          color: AppColors.white_grey,
                          width: 0.4,
                        ))),
                child: TextFormField(
                  style:GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:15,color:Colors.white),

                  controller:userModelView.email,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: AppColors.white_grey,
                        fontWeight: FontWeight.w100,
                        fontSize: 14),
                    hintText:"Email",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 0.4, color: AppColors.white_grey))),
                child: TextFormField(
                  style:GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:15,color:Colors.white),
                  obscureText:true,
                  controller:userModelView.password,
                  decoration: InputDecoration(
                    hintText: AppString.Password,
                    hintStyle: TextStyle(
                        color: AppColors.white_grey,
                        fontWeight: FontWeight.w100,
                        fontSize: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account.?",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: AppColors.white_grey,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(LoginPage());
                    },
                    child: Text(
                      AppString.Login,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: AppColors.Brigh_orange,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(children: [
                Transform.scale(
                    scale: 2,
                    child: Checkbox(
                      activeColor: Colors.white54,
                      checkColor: AppColors.blue,
                      // fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: userModelView.notification.value,
                      shape: CircleBorder(),
                      onChanged: (bool? value) {

                          userModelView.notification.value = value!;

                      },
                    )),
                SizedBox(
                  width: 20,
                ),
                Text(
                  AppString.Enable_Push_Notifications,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white_grey),
                ),
              ]),
              Row(children: [
                Transform.scale(
                    scale: 2,
                    child: Checkbox(
                      activeColor: Colors.white54,
                      checkColor: AppColors.blue,
                      // fillColor: MaterialStateProperty.resolveWith(getColor),
                      value:  userModelView.microphone.value,
                      shape: CircleBorder(),
                      onChanged: (bool? value) {

                        userModelView.microphone.value = value!;

                      },
                    )),
                SizedBox(
                  width: 20,
                ),
                Text(
                  AppString.Enable_Microphone,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white_grey),
                ),
              ]),
              Row(children: [
                Transform.scale(
                    scale: 2,
                    child: Checkbox(
                      activeColor: Colors.white54,
                      checkColor: AppColors.blue,
                      // fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: userModelView.camera.value,
                      shape: CircleBorder(),
                      onChanged: (bool? value) {

                        userModelView.camera.value = value!;

                      },
                    )),
                SizedBox(
                  width: 20,
                ),
                Text(
                  AppString.Enable_Camera,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white_grey),
                ),
              ]),
              SizedBox(height:30,),
              InkWell(
                onTap:(){
                  userModelView.Signup();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.Brigh_orange),
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Center(
                    child: Text(
                      AppString.Register,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white_grey),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white_grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(Images.google),
                        Text(
                          AppString.Google_login,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white_grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(Images.apple),
                        Text(
                          AppString.Apple_login,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ))),
    );
  }
}
