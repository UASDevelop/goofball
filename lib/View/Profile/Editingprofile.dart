import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goofbal/Backend/auth/UserView.dart';
import 'package:goofbal/Backend/auth/useracess.dart';
import 'package:goofbal/Resources/Toast.dart';
import 'package:goofbal/Utilities/constant/Colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../Utilities/constant/Strings.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserData userData=Get.put(UserData());
  UserModelView userModelView=Get.put(UserModelView());
  @override
  Widget build(BuildContext context) {
    return Obx(() => LoadingOverlay(
          isLoading:userModelView.signloading.value,
          child: Scaffold(
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
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: AppColors.white_grey,
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Text(
                              AppString.Edit_Profile,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppColors.white_grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              userModelView.uploadimage();
                            });
                            print(userModelView.image);
                          },
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(userData.userModel.imageUrl == null
                                ? "https://firebasestorage.googleapis.com/v0/b/goofball-5e541.appspot.com/o/IMG-20230408-WA0002.jpg?alt=media&token=27878791-d969-4568-b977-a167bffebf1a"
                                : userData.userModel.imageUrl.toString()),
                            backgroundColor: AppColors.white_grey,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                             userData.userModel.username.toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: AppColors.black),
                            ),
                            Text(
                              userData.userModel.region==null?"Regions":userData.userModel.region.toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColors.greytext),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppString.Username,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(width: 0.5, color: AppColors.blue)),
                      child: TextFormField(
                        controller:userModelView.username,
                        decoration: InputDecoration(
                            hintText:userData.userModel.username!.isEmpty?AppString.Username:userData.userModel.username,
                            border: InputBorder.none,
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: AppColors.blue,
                                fontSize: 14),
                            contentPadding: EdgeInsets.only(left: 10)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppString.Region,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(width: 0.5, color: AppColors.blue)),
                      child: TextFormField(
                        controller:userModelView.useregion,
                        decoration: InputDecoration(
                            hintText:userData.userModel.region==null?AppString.Region:userData.userModel.region,
                            border: InputBorder.none,
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: AppColors.blue,
                                fontSize: 14),
                            contentPadding: EdgeInsets.only(left: 10)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          AppString.Phone_Number,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                              fontSize: 18),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          AppString.Gender,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                              fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 15,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 0.5, color: AppColors.blue)),
                          child: TextFormField(
                            controller:userModelView.userphone,

                            decoration: InputDecoration(
                                hintText:userData.userModel.phoneNo==null?AppString.Phone_Number:userData.userModel.phoneNo,
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blue,
                                    fontSize: 14),
                                contentPadding: EdgeInsets.only(left: 10)),
                            keyboardType:TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 15,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 0.5, color: AppColors.blue)),
                          child: TextFormField(
                            controller:userModelView.usergender,

                            decoration: InputDecoration(
                                hintText:userData.userModel.Gender==null?AppString.Gender:userData.userModel.Gender,
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blue,
                                    fontSize: 14),
                                contentPadding: EdgeInsets.only(left: 10)),
                          ),
                        ),
                      ],
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
                          border:
                              Border.all(width: 0.5, color: AppColors.blue)),
                      child: TextFormField(
                        controller:userModelView.aboutuser,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText:userData.userModel.about==null?AppString.About:userData.userModel.about,
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: AppColors.blue),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          if(userModelView.username.text.isEmpty){
                            AmeToast.toast("user name required");
                          }else if(userModelView.useregion.text.isEmpty){
                            AmeToast.toast("user regios required");
                          }else if(userModelView.userphone.text.isEmpty){
                            AmeToast.toast("user phone  required");
                          }else if(userModelView.usergender.text.isEmpty){
                            AmeToast.toast("gender required");
                          }else if(userModelView.aboutuser.text.isEmpty){
                            AmeToast.toast("about yourself somethings");
                          }else if(userModelView.image==null){
                            AmeToast.toast("Upload the Image");
                          }
                          else{
                            print(userData.userModel.username);
                            userModelView.Updateprofile();
                         // Get.back();
                        }},
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.blue),
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Center(
                            child: Text(
                              AppString.Update,
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white_grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
