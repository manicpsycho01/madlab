import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int projects = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.black12,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(''),
                radius: 50.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "NAME",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Cobra tate",
              style: TextStyle(
                color: Colors.limeAccent,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "PROJECTS",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "$projects",
              style: TextStyle(
                color: Colors.limeAccent,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  projects++;
                });
              },
              onLongPress: () {
                setState(() {
                  projects *= 2;
                });
              },
              child: Icon(
                Icons.add,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (projects > 0) projects--;
                });
              },
              onLongPress: () {
                setState(() {
                  if (projects > 0) projects ~/= 2;
                });
              },
              child: Icon(
                Icons.remove,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.mail,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  "andrewtate@topg.com",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
