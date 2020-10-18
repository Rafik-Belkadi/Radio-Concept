import 'package:flutter/material.dart';
import 'dart:math' as math;

class PlayingNow extends StatefulWidget {
  PlayingNow({Key key}) : super(key: key);

  @override
  _PlayingNowState createState() => _PlayingNowState();
}

class _PlayingNowState extends State<PlayingNow> {
  double value = 0.65;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/blur.png"), fit: BoxFit.cover)),
            ),
            Center(
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background2.png"),
                        fit: BoxFit.fill)),
              ),
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 40.0,
                        ),
                      ),
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: theme.primaryColor,
                        child: Text("R"),
                      )
                    ],
                  ),
                  SizedBox(height: 40.0),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Text(
                        "Playing now",
                        style: textTheme.headline2,
                      ),
                      Icon(Icons.favorite,
                          size: 30.0, color: theme.primaryColor)
                    ],
                  ),
                  SizedBox(height: 40.0),
                  Text(
                    "90.5",
                    style: textTheme.headline1,
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 40,
                left: size.width * .1,
                child: Column(
                  children: [
                    buildPlay(theme),
                    SizedBox(
                      height: 40,
                    ),
                    buildRangeSlider(size, theme, textTheme)
                  ],
                ))
          ],
        ));
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
          width: size.width * .7,
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          SizedBox(
            width: 30.0,
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
          SizedBox(
            width: 30.0,
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
}
