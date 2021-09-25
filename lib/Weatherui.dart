
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/datamodel.dart';
import 'package:http/http.dart'as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models.dart';
final mycontrolle = TextEditingController();
String city="";
final abc="mumbai";
final sey="1bb4a9dcec2a6a66c11e904b5e241f0f";
 double temp=0.0;
 double wind=0.0;
//late double temps;
int humidity=3;
class Ui extends StatefulWidget
{
  @override
  _Ui createState()=>_Ui();
}
void get(){
 // print(textedit);
  //print(textedit);
  print(mycontrolle.text);
 // print("abc");
}
Future getdata()async {
  //print(mycontroller);
  //final  parameters={'q':mycontrolle.text,'appid':'1bb4a9dcec2a6a66c11e904b5e241f0f'};
  //final uri= Uri.https('api.openweathermap.org', '/data/2.5/weather', parameters);
  //eneter your api key
 final uri = "http://api.openweathermap.org/data/2.5/weather?q=${mycontrolle.text}&units=metric&appid=Enter your aoi key here";
 // http.Response response = await http.get(Uri.parse(uri));
  final response = await http.get(Uri.parse(uri));
  var Result = jsonDecode(response.body);
   temp= Result['main']['temp'];
   wind= Result['wind']['speed'];
   humidity=Result['main']['humidity'];
   print(temp);
   print(wind);
  // temp=temp;

  //print(g);
}

class _Ui extends State<Ui>
{
  final _getweate = model();
 // final _resp=tempo(temp: temp);
   //_response==response;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  getdata();


  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text("Weather App"),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 22,
              ),
              Row(
                children: [
                  SizedBox(width: 12,),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      width: 190,
                      height: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(
                          color: Colors.white
                        )
                      ),
                      child: Column
                        (
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            leading: const FaIcon(FontAwesomeIcons.city,color: Colors.white,),
                            title: Text("City name",style: TextStyle(color: Colors.white,fontSize:13 ),
                            ),

                          ),
                          //Text("City name", style: TextStyle(color: Colors.white),),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextField(
                                controller: mycontrolle,

                                decoration: InputDecoration(
                                  //border: BorderRadius.circular(9.),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                            ),

                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            ),
                              onPressed: (){
                                setState(() {
                                  getdata();
                                  temp=temp;
                                });


                               // getdata(city);
                                //_();
                                get();
                                //print(g);
                              //  get();
                              }, child:Text("Submit",style: TextStyle(color: Colors.black),))
                        ],

                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),

                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(
                          color: Colors.white
                        )
                      ),
                      height: 190,
                      width: 190,
                    child: Column(
                      children: [
                        SizedBox(height: 29,),
                        FaIcon(FontAwesomeIcons.temperatureHigh,color: Colors.white,size: 32,),
                         SizedBox(height: 12,),
                         Text("Temparature",style: TextStyle(color: Colors.white,fontSize: 16),),
                         SizedBox(height: 12,),
                         Text(temp.toString()+"° c",style: TextStyle(color: Colors.white,fontSize: 19),)
                       // Text(mycontroller.toString(),style: TextStyle(color: Colors.white),)

                      ],
                    ),


                    ),
                  )
                ],

              ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(width: 12,),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(

                        color: Colors.white
                      )
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 29,),
                        FaIcon(FontAwesomeIcons.wind,color: Colors.white,size:32 ,),
                        SizedBox(height: 12,),
                        Text("Wind Speed",style: TextStyle(color: Colors.white,fontSize: 16),),
                        SizedBox(height: 12,),
                        Text(wind.toString()+"kmph",style: TextStyle(color: Colors.white,fontSize: 19),)
                        //TextButton(onPressed: , child: child)
                       // TextButton.icon(onPressed:(){}, icon: FaIcon(FontAwesomeIcons.wind,color: Colors.white,), label: Text("Temparature",style: TextStyle(color: Colors.white,fontSize: 13),),
                      ],
                  ),
                  ),
                ),
                SizedBox(
                  width:12 ,
                ),
                Container(
                  height: 190,
                  width: 190,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                    border:Border.all(
                      color: Colors.white

                    )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 29,),
                      FaIcon(FontAwesomeIcons.cloud,color: Colors.white,size:32 ,),
                      SizedBox(height: 12,),
                      Text("Humidity",style: TextStyle(color: Colors.white,fontSize: 16),),
                      SizedBox(height: 12,),
                      Text(humidity.toString()+"%",style: TextStyle(color: Colors.white,fontSize: 19),)
                      //TextButton(onPressed: , child: child)
                      // TextButton.icon(onPressed:(){}, icon: FaIcon(FontAwesomeIcons.wind,color: Colors.white,), label: Text("Temparature",style: TextStyle(color: Colors.white,fontSize: 13),),
                    ],
                  ),
                )
              ],
            ),

            ],

          ),
        ),
      ),

    );

  }
  void _() async {
  //getdata(mycontroller.text);
   await _getweate.getWeather(mycontrolle.text);
  //  setState(() => _response = response);
  }
}