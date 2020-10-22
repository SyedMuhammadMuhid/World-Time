import 'package:flutter/material.dart';
import 'package:world_weather_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

List <WorldTime> Places=[
  WorldTime('Rainy River','','America/Rainy_River'),
  WorldTime('Rio Branco', '','America/Rio_Branco'),
WorldTime('Algiers','','Africa/Algiers'),
WorldTime('Ho_Chi_Minh', '','Asia/Ho_Chi_Minh'),
WorldTime('Hong_Kong','','Asia/Hong_Kong'),
WorldTime('Makassar', '','Asia/Makassar'),
WorldTime('Seoul','','Asia/Seoul'),
WorldTime('Singapore', '','Asia/Singapore'),
WorldTime('Tokyo','','Asia/Tokyo'),
WorldTime('Canary', '','Atlantic/Canary'),
WorldTime('Adelaide','','Australia/Adelaide'),
WorldTime('Berlin', '','Europe/Berlin'),
WorldTime('Kiritimati', '','Pacific/Kiritimati')];

  @override
  Widget build(BuildContext context) {
    print(' you its me, the build');
    return Scaffold(
      backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          title: Center( child:
            Text(
              'Select The Location',
            )
          ),
        ),
body: ListView.builder(
 itemCount: Places.length,
  itemBuilder: (context, index){
   return Card(
     child: ListTile(
       leading: CircleAvatar(
         backgroundImage: AssetImage('asset/day.jpg'),
       ),

       title: Text(Places[index].location),
       onTap: (){
         Navigator.pushReplacementNamed(context, '/', arguments: {
           'location': Places[index].location,
             'url': Places[index].url,
             'flag': Places[index].flag
    });
    },

     ),
   );
  },

),
    );
  }
}
