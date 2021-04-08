import 'package:cloud_firestore/cloud_firestore.dart';

class MUser {
  String uid;
  String name;
  String email;
  String avatar;
  bool isOnline;
  String birthday;
  String sex;
  String address;
  String password;
  String confirmPassword;
  dynamic followed;
  dynamic following;
  dynamic albumImage;
  dynamic albumStatus;
  dynamic albumVideo;

  MUser(
      {this.uid,
      this.name,
      this.email,
      this.avatar,
      this.isOnline = false,
      this.birthday,
      this.sex,
      this.address,
      this.password,
      this.confirmPassword,
      this.followed,
      this.following,
      this.albumImage ,
      this.albumStatus ,
      this.albumVideo });

  Map toMap(MUser user) {
    var data = Map<String, dynamic>();
    data["uid"] = user.uid;
    data["name"] = user.name;
    data["email"] = user.email;
    data["avatar"] = user.avatar;
    data["isOnline"] = user.isOnline;
    data["birthday"] = user.birthday;
    data["sex"] = user.sex;
    data["address"] = user.address;
    data["followed"] = user.followed;
    data["following"] = user.following;
    data["albumImage"] = user.albumImage;
    data["albumStatus"] = user.albumStatus;
    data["albumVideo"] = user.albumVideo;
    return data;
  }

  MUser.fromJson(Map data) {
    uid = data['uid'];
    name = data['name'];
    email = data['email'];
    avatar = data['avatar'];
    isOnline = data['isOnline'];
    birthday = data['birthday'];
    sex = data['sex'];
    address = data['address'];
    followed = data['followed'];
    following = data['following'];
    following = data['albumImage'];
    following = data['albumStatus'];
    following = data['albumVideo'];
  }
}
