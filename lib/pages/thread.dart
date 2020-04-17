import 'dart:math';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

const Color blueshade01 = const Color(0xff2B4F81);
const Color blueshade02 = const Color(0xff1f2f46);

const Color s2SidebarColor = const Color(0xff1b3756);

const Color s3TextColor = const Color(0xff4989d3);
const Color s3background = const Color(0xff2B4D7B);
const Color s3SidebarColor = const Color(0xff2c4e7c);
const Color s3SidebarTextColor = const Color(0xff396094);

const Color textcolor = Colors.white54;
double appwidth;
double appheight;

class Thread extends StatefulWidget {
  @override
  _ThreadState createState() => _ThreadState();
}

class _ThreadState extends State<Thread> {
  @override
  Widget build(BuildContext context) {
    appwidth = MediaQuery.of(context).size.width;
    appheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: blueshade02,
        child: Column(
          children: <Widget>[
            Container(
              height: (appheight / 3) * 2,
              child: Stack(
                children: <Widget>[
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image:
                        "https://i.pinimg.com/736x/cb/f4/78/cbf4781a70862ffb8c43ce1d4b991620.jpg",
                    fit: BoxFit.fill,
                  ),
                  Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          getContainerLayout(
                            child: Container(),
                            height: (appheight / 3),
                            backgroundcolor: blueshade02,
                            sideBarColor: s2SidebarColor,
                            sidebarTextColor: s3SidebarTextColor,
                            sidebarText: "C. Ronaldo",
                          ),
                          getNavbar(),
                        ],
                      ),
                      getContainerLayout(
                          child: Container(),
                          height: (appheight / 3),
                          backgroundcolor: blueshade02,
                          sideBarColor: s2SidebarColor,
                          sidebarTextColor: s3SidebarTextColor,
                          sidebarText: "highlights",
                          sidebarIcon: Icon(
                            Icons.data_usage,
                            color: Colors.white54,
                          ),
                          opacity: .9),
                    ],
                  ),
                ],
              ),
            ),
            getContainerLayout(
              child: getStatisticsLayout(),
              height: appheight / 3,
              backgroundcolor: s3background,
              sideBarColor: s3SidebarColor,
              sidebarTextColor: s3SidebarTextColor,
              sidebarIcon: Icon(
                Icons.data_usage,
                color: Colors.white54,
              ),
              sidebarText: "Statistics",
            ),
          ],
        ),
      ),
    );
  }
}

Widget getStatisticsLayout() {
  var lst = [
    "one",
    "two",
    "three",
    "four",
  ].toList();
  return Container(
    child: ListView.builder(
      itemCount: lst.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: <Widget>[
            Text("${lst[index]}"),
          ],
        );
      },
    ),
  );
}

Widget getContainerLayout({
  @required Widget child,
  @required double height,
  Color backgroundcolor = blueshade01,
  Color sidebarTextColor = Colors.white54,
  Color textColor = Colors.white54,
  Icon sidebarIcon,
  double opacity = .5,
  @required Color sideBarColor,
  String sidebarText = "",
}) {
  return Container(
    color: backgroundcolor.withOpacity(opacity),
    height: height,
    child: Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: 70,
          height: height,
          child: RotatedBox(
            quarterTurns: -1,
            child: Row(
              children: <Widget>[
                Text(
                  sidebarText.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    color: sidebarTextColor,
                  ),
                ),
                Spacer(),
                sidebarIcon == null ? Container() : sidebarIcon,
              ],
            ),
          ),
        ),
        Container(
          child: Expanded(child: child),
        ),
      ],
    ),
  );
}

Widget getNavbar() {
  return SafeArea(
    child: Row(
      children: <Widget>[
        Container(
          width: 70,
          child: Icon(
            Icons.data_usage,
            color: textcolor,
          ),
        ),
        Spacer(),
        Container(
          width: 70,
          child: Icon(
            Icons.menu,
            color: textcolor,
          ),
        ),
      ],
    ),
  );
}
