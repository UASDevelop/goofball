import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goofbal/Backend/auth/Usermodel.dart';
import 'package:goofbal/Resources/Toast.dart';
import 'package:goofbal/View/Bottom_navigation/BottomNav.dart';
import 'package:goofbal/View/auth/login/LoginPage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class UserModelView extends GetxController {
  ///GetxController
  UserModel userModel = Get.put(UserModel());

  ///SignupController
  TextEditingController useregion = TextEditingController();
  TextEditingController aboutuser = TextEditingController();
  TextEditingController usergender = TextEditingController();
  TextEditingController userphone = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  ///Singin Controller
  TextEditingController emailcntrlr = TextEditingController();
  TextEditingController passwordcntrl = TextEditingController();

  ///Variable
  var camera = false.obs;
  var notification = false.obs;
  var microphone = false.obs;
  var signloading = false.obs;
  var signuploading = false.obs;
  var image;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> Signup() async {
    signuploading.value = true;
    try {
      var user = await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      if (user != null) {
        userModel.username = username.text;
        userModel.useremail = email.text;
        userModel.userid = auth.currentUser!.uid;
        userModel.camera = camera.value;
        userModel.microphone = microphone.value;
        userModel.notification = notification.value;
        await firestore
            .collection("users")
            .doc(auth.currentUser!.uid)
            .set(userModel.tojson());
        Get.to(LoginPage());
      }
      signuploading.value = false;
    } catch (e) {
      AmeToast.toast("${e}");
      signuploading.value = false;
    }
  }

  Future<void> signin() async {
    signloading.value = true;
    try {
      var user = await auth.signInWithEmailAndPassword(
          email: emailcntrlr.text, password: passwordcntrl.text);
      if (user != null) {
        Get.to(HomePage());
      }
      signloading.value = false;
    } catch (e) {
      AmeToast.toast("${e}");
      signloading.value = false;
    }
  }

  File? imageFile;
  Future<void> uploadimage() async {
    signloading.value = true;
    var picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
        // maxDuration: const Duration(seconds: 60),
      );
      final String fileName = path.basename(pickedImage!.path);
      imageFile = File(pickedImage.path);
      print('Usama$imageFile');

      try {
        FirebaseStorage storage = FirebaseStorage.instance;
        // Uploading the selected image with some custom meta data
        await storage.ref(fileName).putFile(
            imageFile!,
            SettableMetadata(customMetadata: {
              'uploaded_by': 'A bad guy',
              'description': 'Some description...'
            }));
        image = await storage.ref(fileName).getDownloadURL();
        print(image);

        signloading.value = false;
        // Refresh the UI
      } on FirebaseException catch (error) {
        signloading.value = false;

        if (kDebugMode) {
          print(error);
        }
      }
      signloading.value = false;
    } catch (err) {
      signloading.value = false;

      if (kDebugMode) {
        print(err);
      }
    }
  }

  Future<void> Updateprofile() async {
    try {
      signloading.value = true;
      userModel.imageUrl = image;
      userModel.username = username.text;
      userModel.region = useregion.text;
      userModel.phoneNo = userphone.text;
      userModel.about = aboutuser.text;
      userModel.Gender = usergender.text;
      await firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .update(userModel.tojson());
      print("user${auth.currentUser!.uid}");
      signloading.value = false;
    } catch (e) {
      AmeToast.toast("${e}");
      signloading.value = false;
    }
  }
}
