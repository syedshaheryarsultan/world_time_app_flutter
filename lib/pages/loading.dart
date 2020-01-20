import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {

    WorldTime instance = WorldTime(location: 'Karachi', flag: 'pakistan.png', url: 'Asia/Karachi');
    await instance.getTime();

    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, '/home', arguments: {

        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime': instance.isDayTime,

      });
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
