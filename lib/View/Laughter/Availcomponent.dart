import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utilities/constant/Colors.dart';
import '../../Utilities/constant/Strings.dart';
import '../../Utilities/constant/images.dart';

class AvailComponent extends StatefulWidget {
  const AvailComponent({Key? key}) : super(key: key);

  @override
  State<AvailComponent> createState() => _AvailComponentState();
}

class _AvailComponentState extends State<AvailComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(140),
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
                        width: 80,
                      ),
                      Text(
                        AppString.Available_opponents,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.white_grey),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin:EdgeInsets.only(left:5,right:5),
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
                  hintText: AppString.Available_opponents,
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: Image.asset(Images.search),
                  ),
                )),
              ),
            ],
          )),
      body: GridView.count(
        // cacheExtent:220,
        crossAxisCount: 2,
        // crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,
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
    );
  }
}
