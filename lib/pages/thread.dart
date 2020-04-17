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
            getContainerLayout(
              child: Container(),
              height: (appheight / 3) * 2,
              backgroundcolor: blueshade02,
              sideBarColor: s2SidebarColor,
              sidebarTextColor: s3SidebarTextColor,
            ),
            getContainerLayout(
              child: Container(),
              height: appheight / 3,
              backgroundcolor: s3background,
              sideBarColor: s3SidebarColor,
              sidebarTextColor: s3SidebarTextColor,
              sidebarIcon: Icon(
                Icons.data_usage,
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              getContainerLayout(
                child: Container(),
                height: (appheight * .3) * 2,
                backgroundcolor: blueshade02,
                sideBarColor: s2SidebarColor,
                sidebarTextColor: s3SidebarTextColor,
                sidebarIcon: Icon(
                  Icons.data_usage,
                  color: Colors.white54,
                ),
              ),
              getContainerLayout(
                child: Container(),
                height: appheight * .3,
                backgroundcolor: s3background,
                sideBarColor: s3SidebarColor,
                sidebarTextColor: s3SidebarTextColor,
                sidebarIcon: Icon(
                  Icons.data_usage,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
*/

Widget getContainerLayout({
  @required Widget child,
  @required double height,
  String backgroundimageurl,
  Color backgroundcolor = blueshade01,
  Color sidebarTextColor = Colors.white54,
  Color textColor = Colors.white54,
  Icon sidebarIcon,
  @required sideBarColor,
}) {
  return Container(
    height: height,
    child: Stack(
      children: <Widget>[
        (backgroundimageurl != null)
            ? FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: backgroundimageurl,
                fit: BoxFit.fill,
              )
            : Container(
                color: backgroundcolor,
              ),
        Container(
          color: sideBarColor,
          height: double.infinity,
          padding: EdgeInsets.all(20),
          width: 70,
          child: RotatedBox(
              quarterTurns: -1,
              child: Row(
                children: <Widget>[
                  Text(
                    "sample".toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: sidebarTextColor,
                    ),
                  ),
                  Spacer(),
                  sidebarIcon == null ? Container() : sidebarIcon,
                ],
              )),
        ),
      ],
    ),
  );
}

Widget getNavbar() {
  return Row(
    children: <Widget>[
      Icon(
        Icons.data_usage,
        color: textcolor,
      ),
      Spacer(),
      Icon(
        Icons.donut_small,
        color: textcolor,
      ),
    ],
  );
}
