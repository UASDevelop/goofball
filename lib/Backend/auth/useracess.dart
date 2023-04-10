import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:goofbal/Backend/auth/UserView.dart';
import 'package:goofbal/Backend/auth/Usermodel.dart';
import 'package:goofbal/Resources/Toast.dart';

class UserData extends GetxController {
  UserModelView userModelView = Get.put(UserModelView());
  UserModel userModel=Get.put(UserModel());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth=FirebaseAuth.instance;
  @override
  void onInit() {
    GetuserData();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> GetuserData() async {
    try {
      await firestore.collection("users").doc(auth.currentUser!.uid).get().then((value) {
        userModel.username=value.data()!["username"];
        update();
        userModel.useremail=value.data()!["useremail"];
        update();
        userModel.userid=value.data()!["userid"];
        update();
        userModel.notification=value.data()!["notification"];
        update();
        userModel.camera=value.data()!["camera"];
        update();
        userModel.microphone=value.data()!["microphone"];
        userModel.imageUrl=value.data()!["imageUrl"];
        userModel.Gender=value.data()!["Gender"];
        userModel.about=value.data()!["about"];
        userModel.phoneNo=value.data()!["phoneNo"];
        userModel.region=value.data()!["region"];
      });
    } catch (e) {
AmeToast.toast("${e}");
    }
  }
}
