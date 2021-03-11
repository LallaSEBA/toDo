import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Ressources/const.dart';

Widget textWidget01(String textWidget01){
  return Text(
    textWidget01,
    style: TextStyle(fontSize: 15.0, color: color_TxtF, fontFamily: fntfuturaH),
  );
}

Widget textWidget02(textWidget02){
  return Text(
    textWidget02,
    style: TextStyle(fontSize: 18.0, color: color_title, fontFamily: fntfuturaM),
    textAlign: TextAlign.center,
  );
}

Widget inkWell(String inkWellWidget , Function inkWellWidgetFun){
  return InkWell(
    onTap: inkWellWidgetFun,
    child: Text( inkWellWidget,
        style: TextStyle(
            color: color_Btn,
            fontSize: 15.0,
            fontFamily: fntfuturaM
           // decoration: TextDecoration.underline,
      ),
    ),
  );
}

Widget errorTextWidget(String errorText1){
  return Container(
    padding: EdgeInsets.only(top: 10.0),
    child: Text(errorText1, style: TextStyle(color: btnColor,),),
  );
}
