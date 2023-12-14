//昼か夜かの判定
import 'dart:convert';

import 'package:firebase_tutorial/model/astro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CheckHiruYoru{
  static late bool isHiru;

  static Future<void> setIsHiru() async {
    Uri url = Uri.parse('https://api.sunrise-sunset.org/json?lat=35&lng=135&date=today&formatted=0&tzId=Asia/Tokyo');
    var value = await http.get(url);
    //debugPrint(AstroData.fromJson(jsonDecode(value.body)).day_length);
    AstroDataContainer astroDataContainer = AstroDataContainer.fromJson(jsonDecode(value.body));
    //日の入り
    DateTime sunset = DateTime.parse(astroDataContainer.results.sunset);
    //日の出
    DateTime sunrise = DateTime.parse(astroDataContainer.results.sunrise);
    debugPrint("now${DateTime.now().toLocal()}");
    debugPrint("日の入り${sunset.toLocal()}");
    debugPrint("日の出${sunrise.toLocal()}");

    if (sunrise.isBefore(DateTime.now()) && sunset.isAfter(DateTime.now())) {
      debugPrint("昼です");
      isHiru = true;
    }else{
      debugPrint("夜です");
      isHiru = false;
    }
  }
}
