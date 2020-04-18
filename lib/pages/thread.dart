import 'dart:math';

import 'package:flutter/material.dart';
import 'package:thread/customwidgets/carouselpage.dart';
import 'package:thread/customwidgets/delayedanimation.dart';
import 'package:thread/customwidgets/linearindicator.dart';
import 'package:thread/customwidgets/rotationanimation.dart';
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
                          Delayedaimation(
                            milliseconsdelay: 600,
                            child: getNavbar(),
                          ),
                        ],
                      ),
                      getContainerLayout(
                          child: Delayedaimation(
                            milliseconsdelay: 800,
                            transition: const Offset(0.35, 0.0),
                            child: getCarouselPage(),
                          ),
                          height: (appheight / 3),
                          backgroundcolor: blueshade02,
                          sideBarColor: s2SidebarColor,
                          sidebarTextColor: s3SidebarTextColor,
                          sidebarText: "highlights",
                          sidebarIcon: Icon(
                            Icons.data_usage,
                            color: Colors.white54,
                          ),
                          opacity: .95),
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

Widget getCarouselPage() {
  var lst = [
    "Pradip Dhanraj",
    "Flutter Developer",
    "Xamarin Developer",
    "Johnson Controls",
  ];
  return CarouselPage(
    itemsSource: lst,
    templateFunction: (Object obj) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$obj',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white54,
            ),
          ),
          Text('$obj',
              style: TextStyle(
                color: Colors.white54,
              )),
        ],
      );
    },
  );
}

class Statistics {
  int total;
  int score;
  String title;
  Statistics(
      {@required this.title, @required this.score, @required this.total});
}

Widget getStatisticsLayout() {
  var lst = [
    Statistics(score: 19, total: 33, title: "Possesion"),
    Statistics(score: 40, total: 189, title: "Pass Completion"),
    Statistics(score: 10, total: 156, title: "Shot on"),
    Statistics(score: 5, total: 41, title: "Goals"),
  ].toList();
  return Container(
    alignment: Alignment.topCenter,
    child: ListView.builder(
      itemCount: lst.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          height: 50,
          padding: EdgeInsets.only(
            right: 5,
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: appwidth / 5,
                child: Text(
                  "${((lst[index].score / lst[index].total) * 100).round()}%",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: s3TextColor,
                    fontSize: 28,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "${lst[index].title.toUpperCase()}",
                        style: TextStyle(
                          color: const Color(0xff40608f),
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        child: LinearIndicator(
                          total: double.parse('${lst[index].total}'),
                          value: double.parse('${lst[index].score}'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: appwidth / 5,
                child: Text(
                  "${(-((lst[index].score / lst[index].total) * 100) + 100).round()}%",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xff1f2f46),
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),
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
                Delayedaimation(
                  milliseconsdelay: 1000,
                  child: Text(
                    sidebarText.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: sidebarTextColor,
                    ),
                  ),
                ),
                Spacer(),
                sidebarIcon == null
                    ? Container()
                    : Delayedaimation(
                        milliseconsdelay: 1000,
                        child: RotationAnimation(
                          child: sidebarIcon,
                          degree: 360,
                        ),
                      ),
              ],
            ),
          ),
        ),
        Container(
          child: Expanded(
            child: child,
          ),
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
            child: RotationAnimation(
              degree: 360,
              child: Icon(
                Icons.data_usage,
                color: textcolor,
              ),
            )),
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
