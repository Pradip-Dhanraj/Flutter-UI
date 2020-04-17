import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thread/customwidgets/delayedanimation.dart';
import 'package:thread/customwidgets/rotationanimation.dart';
import 'package:thread/helper/theme.dart';

class CreateBlog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateBlogState();
}

class CreateBlogState extends State<CreateBlog> with TickerProviderStateMixin {
  String time;

  void initState() {
    super.initState();
    updateTime();
  }

  void updateTime() {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        time =
            "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().second}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: shade02,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Delayedaimation(
                      milliseconsdelay: 800,
                      child: Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Image.asset(
                          "smile.png",
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20, top: 10),
                        child: Icon(
                          Icons.more,
                          color: Colors.white54,
                        ),
                      )),
                ],
              ),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(30),
                    color: Colors.white24,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RotationAnimation(
                          child: Icon(
                            Icons.add,
                            size: 80,
                            color: Colors.white54,
                          ),
                        ),
                        Text(
                          "Add Blog",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
