import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:radio/screens/playing.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  double value = 0.65;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Row(
        children: [
          buildAppBar(size, theme, textTheme),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => new PlayingNow())),
            child: Container(
              width: size.width * 0.8,
              height: size.height,
              padding: EdgeInsets.only(
                  top: 50.0, left: 20.0, right: 20.0, bottom: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildTop(textTheme, theme),
                  Text(
                    "Popular",
                    style: textTheme.headline2,
                  ),
                  buildRadios(size, theme, textTheme),
                  buildPlay(theme),
                  buildRangeSlider(size, theme, textTheme)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildRangeSlider(Size size, ThemeData theme, TextTheme textTheme) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.volume_up,
          color: Color(0xff32324E),
        ),
        Container(
          width: size.width * .5,
          height: 10.0,
          child: Slider(
              activeColor: theme.canvasColor,
              inactiveColor: Color(0xff32324E),
              value: value,
              onChanged: (val) => setState(() => value = val)),
        ),
        Text(
          (value * 100).toInt().toString() + "%",
          style: textTheme.bodyText1,
        )
      ],
    );
  }

  Container buildPlay(ThemeData theme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(color: Color(0xFF005679), shape: BoxShape.circle),
            child: Transform.rotate(
              angle: -180 * math.pi / 180,
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: theme.primaryColor, shape: BoxShape.circle),
            child: Icon(
              Icons.play_arrow,
              size: 40,
              color: Colors.white,
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(color: Color(0xFF005679), shape: BoxShape.circle),
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }

  Row buildTop(TextTheme textTheme, ThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(style: textTheme.headline3, children: [
            TextSpan(text: "Hello "),
            TextSpan(
                text: "Rafik",
                style: textTheme.headline3.apply(color: theme.primaryColor)),
          ]),
        ),
        CircleAvatar(
          radius: 20.0,
          backgroundColor: theme.primaryColor,
          child: Text("R"),
        )
      ],
    );
  }

  Column buildRadios(Size size, ThemeData theme, TextTheme textTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              height: 140,
              width: size.width * .33,
              decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(width: 1.0, color: theme.primaryColor)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Playing",
                          style: textTheme.caption.apply(color: Colors.black)),
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 18.0,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "94.7",
                        style: textTheme.headline2,
                      ),
                      Text(
                        "Jil FM",
                        style: textTheme.bodyText1,
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                      ),
                      Image.asset("assets/freq.png"),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                      ),
                    ],
                  )
                ],
              ),
            ),
            buildChaine(size, textTheme, "90.5", "Behdja Radio", Colors.red),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildChaine(
                size, textTheme, "98.5", "Spain Radio", Colors.purpleAccent),
            buildChaine(
                size, textTheme, "91.0", "NRJ Radio", Colors.greenAccent),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildChaine(
                size, textTheme, "104.5", "Flutter Radio", Colors.yellowAccent),
            buildChaine(
                size, textTheme, "91.0", "Cinema Radio", Colors.deepPurple),
          ],
        ),
      ],
    );
  }

  Container buildChaine(
      Size size, TextTheme textTheme, String freq, String name, Color color) {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 140,
      width: size.width * .33,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(width: 1.0, color: textTheme.caption.color)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(),
              Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 18.0,
              )
            ],
          ),
          Column(
            children: [
              Text(
                freq,
                style:
                    textTheme.headline2.apply(color: textTheme.caption.color),
              ),
              Text(
                name,
                style:
                    textTheme.bodyText1.apply(color: textTheme.caption.color),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              Image.asset("assets/freq2.png"),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container buildAppBar(Size size, ThemeData theme, TextTheme textTheme) {
    return Container(
      width: size.width * .2,
      height: size.height,
      padding: EdgeInsets.symmetric(vertical: 50.0),
      color: Color(0xff080833),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/logo2.png"))),
          ),
          Spacer(),
          RotatedBox(
            quarterTurns: -1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    ScaleTransition(
                        scale: _animation,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: theme.canvasColor),
                        )),
                    FlatButton(
                        onPressed: () => {},
                        child: Text(
                          "Popular",
                          style: textTheme.bodyText1,
                        )),
                  ],
                ),
                FlatButton(
                    onPressed: () => {},
                    child: Text(
                      "Favorites",
                      style: textTheme.caption,
                    )),
                FlatButton(
                    onPressed: () => {},
                    child: Text(
                      "All Stations",
                      style: textTheme.caption,
                    )),
              ],
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
