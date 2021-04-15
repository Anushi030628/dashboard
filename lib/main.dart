import 'package:dashboardsecond/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Animation/FadeAnimation.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey();

  void validate() {
    if (formkey.currentState.validate()) {
      print("validated");
    } else {
      print('not validated');
    }
  }

  String validatepass(value) {
    if (value.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/background.jpg'),
                    fit: BoxFit.fill,
                  )),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/light-1.png'),
                              )),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/light-2.png'),
                              )),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/clock.png'),
                              )),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text(
                                  "LOGIN PAGE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Center(
                    child: Form(
                      autovalidate: true,
                      key: formkey,
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(
                              1.8,
                              Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(143, 148, 251, .2),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[100]))),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Email",
                                            hintStyle: TextStyle(
                                              color: Colors.grey[400],
                                            )),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: "Required *"),
                                          EmailValidator(
                                              errorText: "Not A Valid Email"),
                                        ]),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Password",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400])),
                                          validator: MultiValidator([
                                            MinLengthValidator(6,
                                                errorText:
                                                    "should be at 6 characters"),
                                            MaxLengthValidator(15,
                                                errorText:
                                                    "should not be more than 15 characters"),
                                          ])),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                              2,
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(143, 148, 251, 1),
                                      Color.fromRGBO(143, 148, 251, .6),
                                    ])),
                                child: Center(
                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()));
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 70,
                          ),
                          FadeAnimation(
                              1.5,
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: Color.fromRGBO(143, 148, 251, 1)),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
