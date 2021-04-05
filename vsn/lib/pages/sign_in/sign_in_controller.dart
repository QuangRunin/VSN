import 'package:get/get.dart';
import 'package:vsn/common/const.dart';
import 'package:vsn/common/utils.dart';
import 'package:vsn/model/m_user.dart';
import 'package:vsn/routes/app_routes.dart';
import 'package:vsn/services/services.dart';

class SignInController extends  GetxController {
  var arrSignIn = [Const.userName,Const.passWord];
  MUser mSignIn = MUser(email: '',password: '');
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  void setMSignIn({int type, value}){
    switch(type){
      case 0:
        mSignIn.email = value;
        break;
      case 1:
        mSignIn.password = value;
        break;
    }
    update();
  }
  validateSignIn(){
    if(mSignIn.email.isEmpty || mSignIn.password.isEmpty ){
      return Const.nullFormat;
    } else {
      if(!Utils.validateEmail(mSignIn.email)){
        return Const.emailFormat;
      } else {
        return null;
      }
    }
  }
  void signInWithEmailAndPassword(context) async{
    String onMessage = await validateSignIn();
    if(onMessage != null){
      Utils.showAlertMessage(context, onMessage);
    }
    else {
      Utils.showLoading(context);
      Services.login(email:mSignIn.email,password:  mSignIn.password).then((value) {
        Get.back();
        if(value.loaded){
          Get.offNamed(AppRoutes.DASHBOARD);
        }
        else {
          Utils.showAlertMessage(context, value.message);
        }
      });
    }
  }
}