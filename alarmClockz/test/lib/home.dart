import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TimeOfDay time = TimeOfDay(hour: 23, minute: 59);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alarm Clock",
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Time set: ",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.cyan,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                        context: context,
                        initialTime: time,
                      );
                      if (newTime == null) return;

                      setState(() {
                        time = newTime;
                      });
                    },
                    child: Text(
                      "Edit Time",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      FlutterAlarmClock.createAlarm(time.hour, time.minute);
                    },
                    child: Text(
                      "Set Alarm",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
