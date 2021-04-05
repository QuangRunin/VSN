import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:vsn/model/m_results.dart';
import 'package:vsn/model/m_user.dart';

class ServiceSignUp {
  Future<MResults> register({name,email,password}) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    MUser mUser = MUser();
    final userRef = FirebaseDatabase.instance.reference();
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      mUser = MUser(uid:firebaseAuth.currentUser.uid,name:name,email: email);
      await userRef.child('Users').child(firebaseAuth.currentUser.uid).set(mUser.toMap(mUser));
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
}