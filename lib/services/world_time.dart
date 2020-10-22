import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;// location name for the UI
  String time; // Time in that location
  String flag; //flag of the country
  String url; // location url for the api endpoint
  bool is_day=true;// true if day, false if night

  WorldTime(String lo, String fl, String u)
  {
    this.location=lo;
    this.flag=fl;
    this.url=u;
  }
  //WorldTime({this.location,this.flag,this.url});

  Future<void> Get_time() async{
    // simulating a delay to make it look like that we are retrieving data from a server of a data base.
    // String first_delay= await Future.delayed(Duration(seconds: 4),(){
    //   return 'F the world';
    // });
    //
    // String second_delay= await Future.delayed(Duration(seconds: 2), (){
    //   return 'Did you do really do that';
    // });
    // print('$first_delay-.... $second_delay');
    //  Response response= await get('https://jsonplaceholder.typicode.com/todos/1');
    //  Map data= jsonDecode(response.body);
    //  print(data['title']);
    try{
    Response response= await get('http://worldtimeapi.org/api/timezone/$url');
    Map data= jsonDecode(response.body);
    //print(data);
    String datetime=data['datetime'];
    DateTime time= DateTime.parse(datetime);
    int offset=int.parse(data['utc_offset'].substring(1,3));
    //print('$datetime and $offset');
    // print('$time');
    time=time.add(Duration(hours: offset));
    print('$time');
    this.is_day= time.hour > 5 && time.hour < 18  ? true :false;

    this.time= DateFormat.jm().format(time);


    }
    catch(e)
    {
      print('The error that was caught:  $e');
      this.time='$e ---- Could not retrieve the time data';
    }
  }
}
