import 'package:flutter/material.dart';

import 'buying.dart';

class Application extends StatelessWidget {
  List<Mycard> mycard = [
    Mycard(Icons.shop, 'Application 1', true),
    Mycard(Icons.shop, 'Application 2', false),
    Mycard(Icons.shop, 'Application 3', false),
    Mycard(Icons.shop, 'Application 4', false),
    Mycard(Icons.shop, 'Application 5', false),
    Mycard(Icons.shop, 'Application 6', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Creative Applications'),
        backgroundColor: Colors.grey[400],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Choose your Application',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: mycard
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Buying()),
                          );
                        },
                        child: Card(
                          color: e.isActive ? Colors.deepPurple : null,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                e.icon,
                                size: 50,
                                color: e.isActive
                                    ? Colors.white
                                    : Colors.deepPurple,
                              ),
                              SizedBox(height: 10),
                              Text(
                                e.title,
                                style: TextStyle(
                                    color: e.isActive
                                        ? Colors.white
                                        : Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Mycard {
  final icon;
  final title;
  bool isActive = false;

  Mycard(this.icon, this.title, this.isActive);
}
