import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map instance={};
  String day;
  @override
  Widget build(BuildContext context) {

    instance=ModalRoute.of(context).settings.arguments;// this is used to get data from the previous arguments that was sent as a map
    print('$instance');

    day= instance['is_day'] ? 'day.jpg':'night.jpg';

    return Scaffold(

        backgroundColor: instance['is_day']== true ? Colors.blue : Colors.deepPurple,
      body: SafeArea(
child: Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/$day'),
      fit: BoxFit.cover
    )
  ),
          child: Padding(
        padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
        child:Column(

        children: [
          FlatButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, '/location');
              },
              icon: Icon(
            Icons.public,
                  color: instance['is_day']== true ? Colors.red: Colors.amber,
          ),
              label: Text('Edit Location',
              style: TextStyle(
                color: instance['is_day']== true ? Colors.black87: Colors.white,
              ),)),

          SizedBox(height: 20.0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Text('${instance['location']}',
              style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 2.0,
                color: instance['is_day']== true ? Colors.black87: Colors.white,
              ),),

            ],
          ),
          SizedBox(height: 30.0,),
          Text('${instance['time']}',
            style: TextStyle(
                letterSpacing: 2.0,
                fontSize: 70.0,
              color: instance['is_day']== true ? Colors.black87: Colors.white,
            ),),
        ],
      )
        ,)),
    ));
  }
}
