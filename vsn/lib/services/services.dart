import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vsn/common/const.dart';
import 'package:vsn/model/m_post.dart';
import 'package:vsn/model/m_results.dart';
import 'package:vsn/model/m_user.dart';

class Services {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<MResults> login({email,password}) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return MResults(loading: false,loaded: true,loadFailed: false,loadMore: false,data: null,message: 'Tạo tài khoản thành công');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'error_login_invalid_email') {
        return MResults(loading: false,loaded: false,loadFailed: true,loadMore: false,data: null,message: 'Địa chỉ email bị định dạng sai');
      } else if (e.code == 'error_login_wrong_password') {
        return MResults(loading: false,loaded: false,loadFailed: true,loadMore: false,data: null,message: 'error_login_wrong_password');
      } else {
        return MResults(loading: false,loaded: false,loadFailed: true,loadMore: false,data: null,message: 'Đăng nhập không thành công, vui lòng thử lại sau');
      }
    } catch (e) {
      return MResults(loading: false,loaded: false,loadFailed: true,loadMore: false,data: null,message: e.toString());
    }
  }
  Future<MResults> register({name,email,password}) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    MUser mUser = MUser();
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      mUser = MUser(uid:firebaseAuth.currentUser.uid,name:name,email: email);
      await _firestore.collection(Const.userCollection).doc(firebaseAuth.currentUser.uid).set(mUser.toMap(mUser));
      return MResults(loading: false,loaded: true,loadFailed: false,loadMore: false,data: null,message: 'Tạo tài khoản thành công');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return MResults(loading: false,loaded: false,loadFailed: true,loadMore: false,data: null,message: 'Mật khẩu được cung cấp quá yếu');
      } else if (e.code == 'email-already-in-use') {
        return MResults(loading: false,loaded: false,loadFailed: true,loadMore: false,data: null,message: 'Email này đã được đăng kí với một tài khoản khác');
      } else {
        return MResults(loading: false,loaded: false,loadFailed: true,loadMore: false,data: null,message: 'Tạo tài khoản không thành công, vui lòng thử lại sau');
      }
    } catch (e) {
      return MResults(loading: false,loaded: false,loadFailed: true,loadMore: false,data: null,message: e.toString());
    }
  }

  Future<MResults> createPost({MPost mPost}) async{
    try {
      await _fireStore.collection(Const.newFeedCollection).doc('Post${Timestamp.now().seconds.toString()}').set(mPost.toMap(mPost));
      return MResults(loading: false,loaded: true,loadFailed: false,loadMore: false,data: null,message: 'Đăng bài thành công');
    } catch(e){
      return MResults(loading: false,loaded: false,loadFailed: true,loadMore: false,data: null,message: e.toString());
    }
  }
  Future<MResults> getPosts() async{
    try {
      await _fireStore.collection(Const.newFeedCollection).doc('Post${Timestamp.now().seconds.toString()}').get().then((value) => {
        print(value.data())
      });
      return MResults(loading: false,loaded: true,loadFailed: false,loadMore: false,data: null,message: 'Đăng bài thành công');
    } catch(e){
      return MResults(loading: false,loaded: false,loadFailed: true,loadMore: false,data: null,message: e.toString());
    }
  }
}