import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:world_weather_app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

void instance_creater() async
{
  Map the_info;
  the_info=ModalRoute.of(context).settings.arguments;
 print('${the_info["location"]},  YOYOYOYOYOYOYOY');

  WorldTime instance= WorldTime(the_info['location'], the_info['flag'], the_info['url']);
  await instance.Get_time();
  print('${instance.time}  hay, it worked');
  Navigator.pushReplacementNamed(context, '/home',
  arguments: {// Sending data as a map o the next screen to de used, this will be recieved there by using the ModalRoute function
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'is_day': instance.is_day
  });
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    instance_creater();
    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
          child: SpinKitWave(
            color: Colors.red,
            size: 50.0,
          ),
        ),
    );
  }
  }

