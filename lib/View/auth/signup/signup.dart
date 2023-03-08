import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goofbal/Utilities/constant/Colors.dart';
import 'package:goofbal/Utilities/constant/Strings.dart';
import 'package:goofbal/View/Bottom_navigation/BottomNav.dart';
import 'package:goofbal/View/auth/login/LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utilities/constant/images.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool enablepushnotifi = false;
  bool enablemicrophone = false;
  bool enablecamera = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SingleChildScrollView(
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
                      value: enablepushnotifi,
                      shape: CircleBorder(),
                      onChanged: (bool? value) {
                        setState(() {
                          enablepushnotifi = value!;
                        });
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
                      value: enablemicrophone,
                      shape: CircleBorder(),
                      onChanged: (bool? value) {
                        setState(() {
                          enablemicrophone = value!;
                        });
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
                      value: enablecamera,
                      shape: CircleBorder(),
                      onChanged: (bool? value) {
                        setState(() {
                          enablecamera = value!;
                        });
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
                 Get.to(HomePage());
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
      ),
    );
  }
}
