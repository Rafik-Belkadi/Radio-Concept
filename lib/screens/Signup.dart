import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:radio/screens/Home.dart';

class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Stack(
        children: [
          ...buildBackground(size, theme),
          Positioned(
            top: 150.0,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset("assets/logo2.png")),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign up",
                        style: textTheme.headline1,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "to start play",
                        style: textTheme.headline3,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone Number",
                        style: textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                          height: 50.0,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              boxShadow: [
                                BoxShadow(
                                  color: theme.primaryColor,
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: theme.primaryColor, width: 2.0)),
                          child: Container(
                            height: 50,
                            width: size.width * .8,
                            color: theme.backgroundColor,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                              decoration: InputDecoration(
                                  hoverColor: Colors.transparent,
                                  contentPadding:
                                      EdgeInsets.only(left: 20.0, bottom: 5.0),
                                  // helperText: "Your Phone number ",
                                  // labelText: "Your phone number",
                                  // counterText: "Your phone number",
                                  hintText: "Your phone number",
                                  hintStyle: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[300].withAlpha(80)),
                                  border: InputBorder.none,
                                  fillColor: Colors.transparent,
                                  focusColor: Colors.transparent),
                            ),
                          )),
                      SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        height: 70.0,
                        width: 150.0,
                        color: theme.canvasColor,
                        child: RaisedButton(
                            color: theme.canvasColor,
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new Home())),
                            child: Image.asset("assets/arrow.png")),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Or Sign In",
                        style: textTheme.bodyText1,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> buildBackground(Size size, ThemeData theme) {
    return [
      Opacity(
        opacity: 0.9,
        child: new BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/blur.png"), fit: BoxFit.fill)),
          ),
        ),
      ),
      Positioned(
        right: 0,
        child: Image.asset("assets/polygone.png"),
      )
    ];
  }
}
