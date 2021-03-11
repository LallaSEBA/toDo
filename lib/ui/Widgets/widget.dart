import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/Ressources/globals.dart';
import '../../Ressources/const.dart';

//appBar
Widget appBar(String appBarWidget , Function appBarFun){
  return AppBar(
    leading: IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: appBarFun,),
    title: Text('Change Password', style: TextStyle(color:color_AppBarTitle, fontFamily: fntfuturaM, fontSize: 23),),
    centerTitle: true,
    backgroundColor: color_BackgrndBlue,
  );
}

//textFields
Widget textFieldWiget(String hintTextWidget,
                      TextEditingController controllerWidget,
                      bool obscureTextWidget){
  return Container(
    child: TextField(                                
        controller: controllerWidget,
        obscureText: obscureTextWidget,
        //maxLines: 2, 
        keyboardType: hintTextWidget.toLowerCase().contains('email')? TextInputType.emailAddress :  TextInputType.text,
        decoration: InputDecoration(hintText: hintTextWidget,
                                    hintStyle: TextStyle(
                                      color: color_TxtF,
                                      fontSize: 13.0,
                                      fontFamily: fntfuturaL
                                    ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color_BackgrndBlue, width:1)
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color_BackgrndBlue, width:1)
          ),
        ),
    ),
  );
}

//flatButton
Widget flatBtnWidget(String textWidget, Function onPressedFun){
  return FlatButton(
    padding: EdgeInsets.all(0),
    child: Align(
      alignment: Alignment.centerRight,
      child: Text(
        textWidget,
        style: TextStyle(fontSize: 13),
      ),
    ),
    textColor: color_Btn,
    onPressed: onPressedFun,
    //splashColor: color_Btn,
  );
}


//raisedButton
Widget raisedBtnWidget(String signTypeWidget, Function functionWidget, context){
  return Container(
    width: mainWidth(context)*0.71,
    height: mainHeight(context)*0.073,
    child: RaisedButton(
      onPressed: functionWidget,
      color: color_Btn,
      textColor: Colors.white,
      elevation: 5.0,
      splashColor: color_Btn,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
     // padding: new EdgeInsets.only(left:100.0, right: 100.0, top: 14.0, bottom:14.0),
      child: Text( signTypeWidget , style: TextStyle( fontSize: 22.0, color:color_txtBtn, fontFamily: fntfuturaH)),
    ),
  );
}

Widget alertDialogWidget(){
  return  AlertDialog(
    backgroundColor: color_Backgrnd,
    titlePadding: EdgeInsets.only(top:30),
    contentPadding: EdgeInsets.all(0),
    title: Icon(Icons.done, color: color_BackgrndBlue, size: 90.0, ),
    content: Container(padding: EdgeInsets.only(bottom: 60),
      child: Text('Great Job', 
                style: TextStyle(color:color_Btn, fontSize: 21.0,height: 1),
                textAlign: TextAlign.center,
              ),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),
  );
}
/*
//raisedButtun Add +
Widget raisedBtnAdd(Function addMission){
  return RaisedButton(
    onPressed: addMission,
    color: btnColor,
    elevation: 5.0,
    splashColor: color_TxtF,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0),),
    child: Icon(Icons.add),
  );
}*/