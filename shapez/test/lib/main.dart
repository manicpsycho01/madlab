import 'package:flutter/material.dart';
import 'package:flutter_shapes/flutter_shapes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Week 4 Graphical Primitives'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            Text('\nCircle\n'),
            Container(
                height: 100.0,
                width: 50.0,
                // ignore: prefer_const_constructors
                decoration: new ShapeDecoration(
                  shape: const CircleBorder(side: BorderSide.none),
                  color: Colors.pink,
                )),
            Text('\n\nRectangle\n\n'),
            Container(
              height: 150,
              width: 100,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            Text('\nSized Box\n'),
            SizedBox(
                height: 50,
                width: 10,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.pink)),
                )),
            Text('\n\nSquare\n\n'),
            IconButton(
              onPressed: (() {}),
              icon: const Icon(
                Icons.square,
                size: 150,
                color: Colors.black,
              ),
            )
          ],
        ));
  }
}
