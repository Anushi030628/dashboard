import 'dart:math';

import 'package:dashboardsecond/application_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey[400],
                  Colors.grey[800],
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              width: 200.0,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage("assets/anusha.jpg"),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "Anusha",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Home",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Profile",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.message,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Blog",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Application()));
                          },
                          leading: Icon(
                            Icons.local_activity,
                            color: Colors.white,
                          ),
                          trailing:
                              Icon(Icons.arrow_forward, color: Colors.white),
                          title: Text(
                            "Activity",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Logout",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              builder: (_, double val, __) {
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 6) * val),
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.grey[800],
                      title: Text("WELCOME"),
                    ),
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Swipe right to open the menu",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
            //onTap: () {
            //setState(() {
            // value == 0 ? value = 1 : value = 0;
            //});
            //},
          )
        ],
      ),
    );
  }
}
