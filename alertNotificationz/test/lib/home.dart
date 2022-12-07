import 'local_notification_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final LocalNotificationService service;
  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Notifications Expt"),
        backgroundColor: const Color(0xff006473),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.25),
        child: Column(
          children: <Widget>[
            TextButton(
              onPressed: () async {
                await service.showNotification(
                    id: 0, title: "Sample Notification", body: "Sample Body");
              },
              child: const Text("Get an instant Notification"),
            ),
            TextButton(
              onPressed: () async {
                await service.showScheduledNotification(
                  id: 0,
                  title: "Sample Notification",
                  body: "Sample Body",
                  seconds: 4,
                );
              },
              child: const Text("Get a delayed Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
