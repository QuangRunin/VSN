import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:vsn/common/const.dart';
import 'package:vsn/model/m_post.dart';

class HomeController extends GetxController {
  List<MPost> mPostList = <MPost>[];
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  @override
  void onInit() {
    print('>>>> run .>>');
    getData();
    update();
    super.onInit();
  }
  void getData() async{
    await _fireStore.collection(Const.newFeedCollection).get().then((QuerySnapshot query) => {
      mPostList = query.docs.map((postJson) => MPost.fromJsonList(postJson.data())).toList()
    });
    print(mPostList.length);
  }
}