import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'models.dart';
class model{
   getWeather(String city)async{
    final  parameters={'q':city,'appid':'1bb4a9dcec2a6a66c11e904b5e241f0f'};
    final uri= Uri.https("https://api.openweathermap.org/", "/data/2.5/weather", parameters);
    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }

 // final  parameters={'q':city,'appid':'1bb4a9dcec2a6a66c11e904b5e241f0f'};
  //final uri= Uri.https("https://api.openweathermap.org/", "/data/2.5/weather", parameters);
}