import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Location"),
        centerTitle: true,
      ),
      body: const LocationInfo(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class LocationInfo extends StatefulWidget {
  const LocationInfo({Key? key}) : super(key: key);

  @override
  State<LocationInfo> createState() => _LocationInfoState();
}

class _LocationInfoState extends State<LocationInfo> {
  String _myLoc = "My Location";
  Location location = new Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  bool _isListenLocation = false, _isGetLocation = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(
          height: 20.0,
        ),
        const Icon(
          Icons.location_pin,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Center(
          child: Text(
            "$_myLoc",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        FloatingActionButton(
          child: Icon(
            Icons.location_on_sharp,
          ),
          onPressed: updateLoc,
        ),
      ],
    );
  }

  void updateLoc() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (_serviceEnabled) return;
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) return;
    }
    _locationData = await location.getLocation();
    setState(() {
      _isGetLocation = true;
    });
    if (_isGetLocation) {
      _myLoc = "${_locationData.latitude} / ${_locationData.longitude}";
    }
  }
}
