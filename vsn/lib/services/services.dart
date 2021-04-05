import 'package:vsn/model/m_results.dart';
import 'package:vsn/services/service_sign_in.dart';
import 'package:vsn/services/service_sign_up.dart';

class Services {
  static Future<MResults> register({String name, String email, String password}) {
    return ServiceSignUp().register(name: name,email: email,password: password);
  }
  static Future<MResults> login({String email, String password}) {
    return ServiceSignIn().login(email: email,password: password);
  }
}