import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:vsn/common/const.dart';
import 'package:vsn/common/utils.dart';
import 'package:vsn/model/m_post.dart';
import 'package:vsn/pages/home/home_controller.dart';
import 'package:vsn/pages/profile/profile_controller.dart';
import 'package:vsn/services/services.dart';

class PostStatusController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final ProfileController profileController = Get.find();
  final HomeController homeController = Get.find();
  File image;
  final picker = ImagePicker();
  String status;
  DateTime now = DateTime.now();
  String dateTime ;

  @override
  void onInit() {
    dateTime = DateFormat("dd-MM-yyy HH:mm:ss").format(now);
    Services().updateAvatar();
    super.onInit();
  }
  Future getImage({type}) async {
    final pickerFile = await picker.getImage(source: type == 0 ? ImageSource.camera : ImageSource.gallery);
      if(pickerFile != null){
        image = File(pickerFile.path);
      }
    update();
  }
  void setStatus({data}){
    status = data;
    update();
  }
  void postStatus(context){
    if(status != null || image != null){
      Utils.showLoading(context);
      Services().createPost(file: image,mPost: MPost(
          uid: profileController.mUser.uid,
          name: profileController.mUser.name,
          status: status,
          dateTime:dateTime,
          avatarUrl: profileController.mUser.avatar,
          isLike: false,
          totalCount: 0,
          totalLike: 0,
          totalShare: 0)).then((value) async{
            Get.back();
            if(value.loaded){
              homeController.getData();
              await Future.delayed(Duration(milliseconds: 500),(){
                Get.back();
                Get.snackbar(Const.notification,Const.postStatusSuccess);
              });
            }
            else{
              Get.snackbar(Const.notification, value.message);
            }
      });
    }
    else {
      Get.snackbar(Const.notification, Const.postEmpty);
    }
  }

}