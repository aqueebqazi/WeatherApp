import 'package:flutter/cupertino.dart';
import 'package:flutter_weather/Signup.dart';
import 'package:flutter_weather/Weatherui.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(
    home: Weath(),
  ));
}
class Weath extends StatefulWidget
{
  @override
  _Weath createState()=>_Weath();
}
class _Weath extends State<Weath>
{
  GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user=_googleSignIn.currentUser;
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Weather App"),
        ),
        body:Column(

          children: [
            SizedBox(
              height: 25,
            ),

            //DecorationPosition.background
           Row(
             children:[
               SizedBox(
                 height: 50,
                 width: 10,
               ),
               Flexible(
                 fit: FlexFit.loose,
                 child: Container(
                     width:400,
                      height: 300,
                     child:
                     Text("Welecome Please Sign In To Use Weather App",
                         style: TextStyle(color: Colors.white,fontSize: 32))),
               ),
             ],
           ),
            SizedBox
              (
              height: 80,
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                   Container(
                     decoration: BoxDecoration(
                       //borderRadius: BorderRadius.circular(33),
                     ),
                     width: 310,
                     height: 50,
                     child: ElevatedButton.icon(
                         onPressed: ()async{

                             await _googleSignIn.signIn();
                             if(_googleSignIn.currentUser!=null)
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Ui()));


                     },
                         style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                         ),
                         icon: FaIcon(FontAwesomeIcons.google,color: Colors.red,),
                       label: Text("Google Sign In",style: TextStyle(color: Colors.black),
                     ),

                     ),
                   )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 22,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:(){
                       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signup()));
                      },
                        //child: Text("Sign Up For New User",style: TextStyle(color: Colors.white,fontSize: 14) ,)
                    )
                  ],
                )
              ],
            )
          ],
        ) ,
      ),
    );
  }

}