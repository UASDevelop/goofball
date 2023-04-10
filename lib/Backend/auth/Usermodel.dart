class UserModel {
  String? username;
  String? useremail;
  String? userid;
  bool? camera;
  bool? notification;
  bool? microphone;
  String? region;
  String? phoneNo;
  String? Gender;
  String? about;
  String? imageUrl;
  UserModel(
      {this.camera,
      this.microphone,
      this.notification,
      this.useremail,
      this.userid,
      this.username,
      this.about,
      this.Gender,
      this.imageUrl,
      this.phoneNo,
      this.region});
  factory UserModel.tojson(Map<String, dynamic> json) {
    return UserModel(
        username: json["username"],
        useremail: json["useremail"],
        userid: json["userid"],
        camera: json["camera"],
        notification: json["notification"],
        microphone: json["microphone"],
        region: json["region"],
        imageUrl: json["imageUrl"],
        about: json["about"],
        Gender: json["Gender"],
        phoneNo: json["phoneNo"]);
  }
  Map<String, dynamic> tojson() => {
        "username": username,
        "useremail": useremail,
        "userid": userid,
        "camera": camera,
        "microphone": microphone,
        "notification": notification,
        "username": username,
        "Gender": Gender,
        "about": about,
        "imageUrl": imageUrl,
        "phoneNo": phoneNo,
        "region": region,
      };
}
