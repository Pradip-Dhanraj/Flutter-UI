import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thread/customwidgets/delayedanimation.dart';
import 'package:thread/helper/theme.dart';

class CreateBlog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateBlogState();
}

class CreateBlogState extends State<CreateBlog> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  StreamController<String> streamController;

  String time;

  void newMessage(int number, String message) {
    final duration = Duration(seconds: number);
    Timer.periodic(duration, (Timer t) {
      streamController.add("Message at ${DateTime.now().toString()}");
      print("Message at ${DateTime.now().toString()}");
    });
  }

  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    streamController = StreamController<String>();
    //newMessage(5, "ll");
    updateTime();
    //time = "${DateTime.now().toString()}";
  }

  void dispose() {
    streamController.close();
    super.dispose();
  }

  void updateTime() {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        time =
            "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().second}";
      });
    });
  }

  // StreamBuilder(
  //               initialData: null,
  //               stream: streamController.stream,
  //               builder: (context, snapshot) {
  //                 return Text("${snapshot.data}");
  //               }),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: shade02,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Delayedaimation(
                  milliseconsdelay: 800,
                  child: Text(
                    "$time",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
