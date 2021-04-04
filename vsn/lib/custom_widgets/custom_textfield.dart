import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vsn/common/styles.dart';


// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String label;
  final bool activeObscureText;
  final Function onChanged;
  CustomTextField({Key key,this.label,this.activeObscureText = false,this.onChanged}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: false,
      style: TextStyle(
        color: Colors.black54
      ),
      // controller: controllerMin,
      keyboardType: TextInputType.multiline,
      onChanged: onChanged,
      obscureText:activeObscureText ,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: TextFieldPaddingVertical,horizontal: TextFieldPaddingHorizontal),
        labelText: label,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13.0,
          color: Colors.black54
        ),
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide:  BorderSide(color: Colors.black87),
        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide:  BorderSide(color: Colors.black54),

        ),
      ),
    );
  }
}
