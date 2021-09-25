import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'main.dart';
class Signup extends StatefulWidget
{

  @override
  _Signup createState()=>_Signup();
}
class _Signup extends State<Signup>
{
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           SizedBox(
             height: 20,
           ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Kindly Sign Up",style: TextStyle(color: Colors.white,fontSize: 32),)
              ],
            ),
            SizedBox(
              height: 60,
            ),
           Row(
             children: [
               SizedBox(
                 width: 27,
               ),
               Text("Email",style: TextStyle(color: Colors.white,fontSize: 17),)
             ],
           ),
           Center(
               child: Padding(
                 padding: const EdgeInsets.all(27),
                 child: (
                     TextField(

                       decoration: InputDecoration(
                         fillColor: Colors.white,
                         filled: true,
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                         ),
                         hintText: 'Email'
                       ),
                     )

                 ),
               ),

           ),
            Row(
              children: [
                SizedBox(
                  width: 26,
                ),
                Text(
                  "Password",style: TextStyle(color: Colors.white,fontSize: 17),
                )
              ],
            ),
            Center(
              child:Padding(
                padding: EdgeInsets.all(27),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Password'
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child:
                  Container(
                    height: 50,
                    width: 310,
                    child: ElevatedButton(

                      style:ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
                      onPressed: (){},
                      child: Text("Submit",style: TextStyle(color:Colors.black),),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  
}