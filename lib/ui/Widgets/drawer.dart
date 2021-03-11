import 'package:flutter/material.dart';
import '../../Ressources/strings.dart';
import '../../controller/dbHelper.dart';
import '../../ui/list_tasks_screen.dart';
import '../../Ressources/const.dart';
import '../../Ressources/ressources.dart';

 navigate(BuildContext context, toToday){
   String route = '';
    route = toToday ? '/today': '/tomorrow';
  

    return Navigator.of(context).pushReplacement(
       
       PageRouteBuilder(
         transitionDuration: Duration(milliseconds:1000),
         transitionsBuilder: (BuildContext context,
                       Animation<double> animation,
                       Animation<double> secAnimation,
                       Widget child){
 
            animation = CurvedAnimation(parent: animation, curve: Curves.easeInOutSine);
            return ScaleTransition(alignment: Alignment.topCenter,
                                   scale: animation,
                                   child:child);
         },

         pageBuilder: (context,
                       Animation<double> animation,
                       Animation<double> secAnimation){
                       return ListTaskScreen(isToday: toToday,);
                       }));
 }

Widget drawer(BuildContext context ){
   double W = MediaQuery.of(context).size.width*0.77;
   double H = MediaQuery.of(context).size.height;

   double beforElem  = H * 0.15;
   double leftMargin = W * 0.14;
   double bwtElem    = H * 0.016;
   double afterElem  = H * 0.11;
   DatabaseHelper db = DatabaseHelper();
   return Container(    
           width: W,
           child: Drawer (     
                               
                    child: Stack(
                    
                      children: <Widget>[
                        Container(
                        color: color_BackgrndBlue,   ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(padding:  EdgeInsets.only(top:30),   ),
                            Container(
                              height: 128.8,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      height: 87.5,
                                      width: 65.4,
                                      child: Image.asset("assets/images/avatar.png",)
                                    ),
                                    Text(
                                      global_name!=null?
                                      global_name:'',
                                      style: TextStyle(
                                        fontFamily: fntfuturaM,
                                        fontSize: 19,
                                        color:color_drawerTitle,
                                        height: 1
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                      Container(
                              width: W,
                              margin: EdgeInsets.only(top: beforElem),
                              child: FlatButton(
                                padding:EdgeInsets.only(left:leftMargin,),
                                splashColor: color_drawerfocus,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                        str_toDay,
                                        style: TextStyle(
                                          fontFamily: fntfuturaM,
                                          fontSize: 17,
                                          color:color_drawerElem,
                                        ),
                                    ),
                                ),
                                onPressed:() => navigate(context, true)// Navigator.of(context).pushReplacementNamed('/today'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:bwtElem),
                              width: W,                               
                              child: FlatButton(
                                  padding:EdgeInsets.only(left:leftMargin,),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                          str_tomorrow,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: fntfuturaM,
                                            fontSize: 17,
                                            color:color_drawerElem,
                                          ),
                                      ),
                                  ),
                                  onPressed:() => navigate(context, false)
                                  //Navigator.of(context).pushReplacementNamed('/tomorrow'),
                              ),
                            ),
                           
                            Container(
                              margin: EdgeInsets.only(top:afterElem),
                              width: W,                               
                              child: FlatButton(
                                  padding:EdgeInsets.only(left:leftMargin,),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                          str_logOut,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: fntfuturaM,
                                            fontSize: 17,
                                            color:color_drawerElem,
                                          ),
                                      ),
                                  ),
                                  onPressed:() async{
                                     await db.logout(global_email).then((statut){                                          
                                        if(statut)
                                        Navigator.of(context).pushReplacementNamed('/login');
                                     });  
                                  },
                              ),
                            ),  
                          ],
                        ),
                      ],
                    )
            )
          );
 }