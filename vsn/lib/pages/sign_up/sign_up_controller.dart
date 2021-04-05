import 'package:get/get.dart';
import 'package:vsn/common/const.dart';
import 'package:vsn/common/utils.dart';
import 'package:vsn/model/m_user.dart';
import 'package:vsn/routes/app_routes.dart';
import 'package:vsn/services/services.dart';

class SignUpController extends  GetxController {
  var arrSignUp = [Const.name,Const.email,Const.passWord,Const.confirmPassword];
  MUser mSignUp = MUser(email: '',password: '',name: '',confirmPassword: '');

  void signUpWithEmailAndPassword(context) async{
    String onMessage = await validateSignUp();
    if(onMessage != null){
      Utils.showAlertMessage(context, onMessage);
    }
    else {
      Utils.showLoading(context);
      Services.register(name: mSignUp.name,email: mSignUp.email,password: mSignUp.password).then((value) {
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
  validateSignUp(){
    if(mSignUp.email.isEmpty || mSignUp.password.isEmpty || mSignUp.name.isEmpty){
      return Const.nullFormat;
    }
    else if(mSignUp.confirmPassword != mSignUp.password){
      return Const.pwDuplicate;
    }
    else if(mSignUp.name.length < 5){
      return Const.userNameFormat;
    }
    else if(mSignUp.name.length > 20){
      return Const.userNameFormat1;
    }
    else if(mSignUp.password.length < 6){
      return Const.pwFormat;
    }
    else if(!Utils.validateEmail(mSignUp.email)){
      return Const.emailFormat;
    }
    else {
      return null;
    }
  }
  void setMSignUp({int type, value}){
    switch(type){
      case 0:
        mSignUp.name = value;
        update();
        break;
      case 1:
        mSignUp.email = value;
        update();
        break;
      case 2:
        mSignUp.password = value;
        update();
        break;
      case 3:
        mSignUp.confirmPassword = value;
        update();
        break;
    }
    update();
  }
}