import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vsn/model/m_user.dart';

class MPost {
  String uid;
  String name;
  String status;
  String dateTime;
  String avatarUrl;
  bool isLike;
  dynamic totalCount;
  dynamic totalLike;
  dynamic totalShare;
  dynamic image;

  MPost(
      {this.uid,
      this.name,
      this.status,
      this.dateTime,
      this.avatarUrl,
      this.totalCount,
      this.totalLike,
      this.totalShare,
      this.image});

  Map toMap(MPost post) {
    var data = Map<String, dynamic>();
    data["uid"] = post.uid;
    data["name"] = post.name;
    data["status"] = post.status;
    data["dateTime"] = post.dateTime;
    data["avatarUrl"] = post.avatarUrl;
    data["image"] = post.image;
    data["totalCount"] = post.totalCount;
    data["totalLike"] = post.totalLike;
    data["totalShare"] = post.totalShare;
    return data;
  }

  MPost.fromJson(Map data) {
    uid = data['uid'];
    name = data['name'];
    status = data['status'];
    dateTime = data['dateTime'];
    avatarUrl = data['avatarUrl'];
    image = data['image'];
    totalCount = data['totalCount'];
    totalLike = data['totalLike'];
    totalShare = data['totalShare'];
  }
}
