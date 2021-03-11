import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/Ressources/globals.dart';
import 'package:to_do_list/Ressources/strings.dart';
import 'package:to_do_list/Ressources/const.dart';
import 'Widgets/widget.dart';
import 'Widgets/TextWidget.dart';
import 'Widgets/ImageWidget.dart';
import 'adress_email.dart';
import 'package:to_do_list/ui/sign_up.dart';
import 'package:to_do_list/controller/dbHelper.dart';
import 'package:to_do_list/ui/list_tasks_screen.dart';

class SignIn extends StatefulWidget{
  SignIn({Key key, this.title}) : super(key : key);
  final String title;
  
  @override
  State<StatefulWidget> createState()=>  new SignInState(); 
}

class SignInState extends State<SignIn>{

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    if(value != '0'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ListTaskScreen()));
    }
  }

@override
initState(){
  //read();
  super.initState();
} 

  DatabaseHelper databaseHelper = DatabaseHelper();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorText= '';

  void forgetPassFun(){ Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdressEmail()));
                      } 
  void goToSignUp(){ Navigator.push(context,
                     MaterialPageRoute(builder: (context) => SignUp()));
                     } 

  void signInFun(){
    if(_emailController.text.trim() !="" && _passwordController.text.trim() !=""){ 
      errorText='';
      databaseHelper.loginData(_emailController.text.trim(), _passwordController.text.trim())
                    .whenComplete((){
                      if(databaseHelper.status){
                          setState(() => errorText = 'Check email or password' );
                     }else{
                       Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => ListTaskScreen()));
                    }});
      }else{ 
        setState(() => errorText = "Field is empty !" );
      }
  }
  @override
  Widget build(BuildContext context) {
    double paddingBeforTopFlatBtn   = mainHeight(context)*0.02;       //16.5/896

    double paddingBeforTopRaisedBtn = mainHeight(context)*0.1;       //67/896
    double paddingUnderRaisedBtn    = mainHeight(context)*0.085;         //67/896
    double beforTgDev               = mainHeight(context)*0.03;    //67/896
    double hTgDev                   = mainHeight(context)*0.05;       //188/896


    return new Scaffold(
      backgroundColor: color_Backgrnd,         //لون الخلفية
        body: new Stack(
         children: <Widget>[
          Container(
            margin:EdgeInsets.only(top: mainHeight(context)*0.02),
            width  : mainWidth(context),
            height : mainHeight(context)*0.3,
            child  : Image.asset('assets/images/Icon.png', fit:BoxFit.contain),
          ),
          Container(
            width  : mainWidth(context),
            height : mainHeight(context)*0.3,
            padding : EdgeInsets.only(top: mainHeight(context)*0.09),
            child  : Image.asset('assets/images/logo.png',)
          ),

          new ListView(
          children: <Widget>[ 
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: paddingBeforTopField(context)),),

                Container(
                  width  : widthTextField(context),
                  height : heightTextField(context),
                  child  : textFieldWiget(str_email , _emailController, false),
                ),

                Padding(padding: EdgeInsets.only(top: paddingBetweenFields(context)),),
                Container(
                  width  : widthTextField(context),
                  height : heightTextField(context),
                  child  : textFieldWiget(str_password , _passwordController, true),
                ),

               /* errorText.trim()=='' ? Text('', ) 
                                     :*/ errorTextWidget(errorText),           
                               
                Padding(padding: EdgeInsets.only(top: paddingBeforTopFlatBtn),),
                Container(
                  height: 19,
                  width : widthTextField(context),
                  child : flatBtnWidget(str_forgetPass, forgetPassFun)
                ),

                Padding(padding: EdgeInsets.only(top: paddingBeforTopRaisedBtn),),
                raisedBtnWidget(str_signIn, signInFun, context),

                Padding(padding: EdgeInsets.only(top: paddingUnderRaisedBtn),),
                Container(height: 21,
                  child: Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      textWidget01(str_register),
                      inkWell(str_createAcc, goToSignUp),
                    ],
                  ),
                ),
                
                Padding(padding: EdgeInsets.only(top: beforTgDev),),
                Container(
                  height: hTgDev,
                  child: Center(child: Text('By\nTG Developers', style:TextStyle(fontFamily:fntfutura, fontSize:10), textAlign: TextAlign.center,))
                )
              ],
            ),
          ],
        ),
      ],
    )
   );
  }
}