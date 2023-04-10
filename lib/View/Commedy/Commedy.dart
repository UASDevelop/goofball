import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goofbal/Backend/auth/useracess.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utilities/constant/Colors.dart';
import '../../Utilities/constant/Strings.dart';
import '../../Utilities/constant/images.dart';
import '../../main.dart';
import '../Profile/Publicprofiile.dart';
import 'comvideoacess.dart';

class CommedyVideo extends StatefulWidget {
  @override
  _CommedyVideoState createState() => _CommedyVideoState();
}

class _CommedyVideoState extends State<CommedyVideo> {
  UserData userData=Get.put(UserData());
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('post').snapshots();

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
                    width: 100,
                  ),
                  Text(
                    AppString.Comedy_Feed,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.white_grey),
                  )
                ],
              ),
            ),
          )),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
            if(snapshot.connectionState==ConnectionState.none){
              return Text("data",style:GoogleFonts.poppins(fontWeight:FontWeight.w500,color:AppColors.blue,),);
            }
          return ListView(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding:
                    EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(Publicprofile(id:data["userid"],));
                            print(data["id"]);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:NetworkImage(userData.userModel.imageUrl.toString()),
                                backgroundColor: AppColors.white_grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                // height:MediaQuery.of(context).size.height/18,
                                width: MediaQuery.of(context).size.width / 1.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      data["headline"],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blue,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      data["about"],
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
                        Container(
                          margin: EdgeInsets.only(left: 50, right: 20),
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              // color: AppColors.cayan,
                              borderRadius: BorderRadius.circular(10)),
                          child: Card(
                            child: CommedyVide(
                              videopath: data["videourl"],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70, top: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.emoji_emotions_outlined,
                                color: AppColors.blue,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "12k",
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: AppColors.blue),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset(Images.chat),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "566",
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: AppColors.blue),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
