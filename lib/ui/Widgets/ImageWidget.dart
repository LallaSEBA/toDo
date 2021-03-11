import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//صورة القفل 
Widget imgLock(double w, double h){
  return Center(     
    child: new Image.asset('assets/images/lock.png',
    height: h,
    width : w,
    fit: BoxFit.contain,
    ),
  );
}

//صورة الخلفية 
Widget imgBckg(double bW, double bH){
  return Center(
    child: new Image.asset('assets/images/Icon.png',
      fit: BoxFit.cover,
    ),
  );
}

//Logo
Widget imgLogo(){
  return Center(     
    child: new Image.asset('assets/images/logo.png',
    height: 120.0,
    width : 115.0,
    fit: BoxFit.fill,
    ),
  );
}

