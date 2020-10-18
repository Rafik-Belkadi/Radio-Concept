import 'dart:ui';

import 'package:flutter/material.dart';

import 'Signup.dart';

class EntryPoint extends StatefulWidget {
  EntryPoint({Key key}) : super(key: key);

  @override
  _EntryPointState createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Stack(children: [
        ...buildBackground(size, theme),
        Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 150.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/logo.png"))),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 40.0),
                margin: EdgeInsets.only(bottom: 150.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's Get\nStarted",
                      style: textTheme.headline1,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Enjoy the best radio stations\nfrom your home, don't miss\nout on anything",
                      style: textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 100.0,
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  width: size.width * .7,
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => new Signup())),
                    child: Text(
                      "Get Started",
                      style: textTheme.button,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  List<Widget> buildBackground(Size size, ThemeData theme) {
    return [
      Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
      ),
      Opacity(
        opacity: 1,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.overlay,
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.2, 1],
                  colors: [theme.primaryColor, Colors.white.withOpacity(0.2)]),
              image: DecorationImage(
                  image: AssetImage("assets/blur.png"), fit: BoxFit.fill)),
        ),
      ),
      Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.overlay,
          gradient: LinearGradient(
              stops: [0.2, 1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF05D8E8), Colors.white.withOpacity(0.2)]),
        ),
      )
    ];
  }
}
