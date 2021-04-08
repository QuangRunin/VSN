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
  List<ListLike> listLike;

  MPost(
      {this.uid,
      this.name,
      this.status,
      this.dateTime,
      this.avatarUrl,
      this.isLike,
      this.totalCount,
      this.totalLike,
      this.totalShare,
      this.image,
      this.listLike
      });

  Map toMap(MPost post) {
    var data = Map<String, dynamic>();
    data["uid"] = post.uid;
    data["name"] = post.name;
    data["status"] = post.status;
    data["dateTime"] = post.dateTime;
    data["avatarUrl"] = post.avatarUrl;
    data["isLike"] = post.isLike;
    data["image"] = post.image;
    data["totalCount"] = post.totalCount;
    data["totalLike"] = post.totalLike;
    data["totalShare"] = post.totalShare;
    data["listLike"] = post.listLike;
    return data;
  }
  MPost.fromJson(Map<String, dynamic> data) {
    uid = data['uid'];
    name = data['name'];
    status = data['status'];
    dateTime = data['dateTime'];
    avatarUrl = data['avatarUrl'];
    isLike = data['isLike'];
    image = data['image'];
    totalCount = data['totalCount'];
    totalLike = data['totalLike'];
    totalShare = data['totalShare'];
    listLike = data["listLike"] != null ? List<ListLike>.from(data["listLike"].map((x) => ListLike.fromJson(x))) : null;
  }
}

class ListLike {
  String uid;
  String name;
  String avatarUrl;

  ListLike({this.uid, this.name, this.avatarUrl});

  Map toMap(ListLike mLike) {
    var data = Map<String, dynamic>();
    data["uid"] = mLike.uid;
    data["name"] = mLike.name;
    data["avatarUrl"] = mLike.avatarUrl;
    return data;
  }

  ListLike.fromJson(Map<String, dynamic> data) {
    uid = data['uid'];
    name = data['name'];
    avatarUrl = data['avatarUrl'];
  }
}
