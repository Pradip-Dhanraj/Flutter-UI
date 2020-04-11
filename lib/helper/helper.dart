import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thread/helper/theme.dart';
import 'package:transparent_image/transparent_image.dart';

EdgeInsetsGeometry appSafeArea = const EdgeInsets.symmetric(
  horizontal: 5.0,
);

BoxDecoration baseContainerDecoration = BoxDecoration(
  //color: Theme.of(context).primaryColor,
  gradient: LinearGradient(
    begin: Alignment(0, 1),
    end: Alignment(1, 0),
    tileMode: TileMode.clamp,
    colors: [
      shade01,
      shade02,
    ],
  ),
);

Widget appContainer(
    {Widget view,
    double appheight,
    double appwidth,
    bool shownetworkimage = false}) {
  return Container(
    height: appheight,
    width: appwidth,
    decoration: baseContainerDecoration,
    child: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        shownetworkimage
            ? FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image:
                    "https://66.media.tumblr.com/498573fd5621f18b9ae9ac326d194c6b/tumblr_mme4abs9D01s45dsso1_r1_1280.jpg",
                fit: BoxFit.fill,
              )
            : Container(),
        SafeArea(
          bottom: true,
          top: true,
          minimum: appSafeArea,
          child: view,
        ),
      ],
    ),
  );
}

// Loader
Widget getLoaderLayout() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      CircularProgressIndicator(
        // valueColor: AlwaysStoppedAnimation<Color>(
        //   Colors.greenAccent,
        // ),
        strokeWidth: 3,
        backgroundColor: Colors.black,
      ),
      Padding(
        padding: EdgeInsets.only(top: 15),
        child: Text(
          "Loading...!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
