import 'package:flutter/cupertino.dart';

class Const extends InheritedWidget {
  static Const of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<Const>();

  const Const({Widget child, Key key}) : super(key: key, child: child);

  static final String appName = 'VSN';
  static final String signIn = 'Đăng nhập';
  static final String signUp = 'Đăng ký';
  static final String forgotPassWord = 'Quên mật khẩu';
  static final String userName = 'Tên Đăng nhập';
  static final String passWord = 'Mật Khẩu';
  static final String confirmPassword = 'Nhập lại mật khẩu';
  static final String email = 'Email';
  static final String name = 'Tên hiển thị';
  static final String following = 'Đang theo dõi';
  static final String followed = 'Theo dõi';
  static final String post = 'Bài đăng';
  static final String myPage = 'Hồ sơ';
  static final String settingTheme = 'Tùy chọn Theme';
  //validate
  static String emailFormat= "Email Không đúng định dạng";
  static String phoneFormat= "Số điện thoại Không đúng định dạng";
  static String nullFormat = "Vui lòng nhập đầy đủ thông tin";
  static String userNameFormat = "Tên hiển thị phải lớn hơn 5 kí tự";
  static String userNameFormat1 = "Tên hiển thị không vượt quá 20 kí tự";
  static String pwFormat = "Mật khẩu phải lớn hơn 6 kí tự";
  static String pwDuplicate = "Mật khẩu không trùng khớp";

  @override
  bool updateShouldNotify(Const oldWidget) => false;
}
