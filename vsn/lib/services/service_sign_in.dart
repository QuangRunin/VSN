import 'package:firebase_auth/firebase_auth.dart';
import 'package:vsn/model/m_results.dart';

class ServiceSignIn {
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
}